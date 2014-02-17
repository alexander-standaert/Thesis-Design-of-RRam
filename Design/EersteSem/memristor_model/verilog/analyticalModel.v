// calculateCurrentRME
// -------------------------------------------------------------
// calculate the current through the resistive memory element,
// when the given voltage "Vox" is applied over its terminals
// Robin Degraeve's QM model is used, using Philippe Roussel's mathematica
// results
// if file    !=0, information on the number of iterations is saved to file
// if verbose !=0, much more information is saved to file (really for debug only)
//
// Author: Stefan Cosemans 
// -------------------------------------------------------------
analog function real calculateCurrentRME;
  input omega_x, omega_y, V0, Vox, file, verbose, Nmax;
  real  omega_x, omega_y, V0, Vox;
  integer file, verbose, Nmax;

//  real Nmax ;  // stop at this iteration if still no convergence has been reached
  real eps  ;  // stop when the last added term is less than eps of the calculated total
  real qe, hPl, hBar;  
  real E_n, alpha, Itotal, Ipre, I_n;

  integer index;
  real delta ; // In / Itotal --> how much does the latest term add. Compared to eps
  integer rv;

  real A,B;
  real limit;

  // print notifications and warnings when the calculated Irme deviates too
  // much from the real value. This is not an exact check, but it should give
  // an indication
  // A message is printed to the log file if both 
  // * error percentage (I_last_contribution/Itotal)
  // * absolute error current (I_last_contribution)
  real notify_ErrorPercentage;
  real notify_ErrorCurrent;   
  real warn_ErrorPercentage;
  real warn_ErrorCurrent;

  begin 

//    Nmax = 100;
    limit = 10;               // limit avoids numerical issues
                              // set it as high as possible, but without
                              // introducing overflows or ringing
                              // Setting it too low will result in Irme=0
                              // for some (very low current) settings
                              // 50 seems to be an upper bound for simulating 
                              // with 'original' LRS cell and 5kOhm load
    eps  = 0.01;
    qe   = 1.602176487e-19;   // electron charge (positive number..)
    hPl  = 6.6260689e-34;     // Plank's constant
    hBar = hPl / (2 * `M_PI);    // Reduced Plank's constant
    //  e    = exp(1);            // exp(1);
  
    E_n    = 0.0;
    Itotal = 0.0;
    Ipre   = 0.0;
    I_n    = 0.0;

    index = 0;
    delta = 1.0;          

    // notify when we have 1% "error" for a current which is larger than 100nA
    notify_ErrorPercentage = 1;
    notify_ErrorCurrent    = 1e-9;   
    // warn if we have 10% "error" for a current which is larger than 1uA 
    warn_ErrorPercentage   =   10;
    warn_ErrorCurrent      = 1e-6;

    // --- see matlab code for information on the implementation of the model equations

    alpha = 2*`M_PI / ( hBar * omega_x );
    if ( file!=0 && verbose ) begin
      $fdisplay( file, "omega_x=%g\n", omega_x );
      $fdisplay( file, "omega_y=%g\n", omega_y );
      $fdisplay( file, "V0     =%g\n", V0      );
      $fdisplay( file, "alpha  =%g\n", alpha   );
      $fdisplay( file, "Vox    =%g\n", Vox     );
    end
  
//    while ( (index<Nmax) && ( abs(delta)>eps) ) begin    
    while ( (index<Nmax) ) begin    
            
      E_n  = qe * V0 + hBar * omega_y * ( index+1.0/2 ) ; 
      //warning: must use "1.0", not "1" to convert to float! (1/2=0 !!)

      A = alpha*(E_n-qe*Vox/2);
      B = alpha*(E_n+qe*Vox/2);

      if( A<limit  && B<limit  ) begin
        //Ipre = qe * Vox + ln( (1+exp( A )) / (1+exp( B )) ) / alpha;
        Ipre = qe * Vox + ( ln(1+exp( A )) - ln(1+exp( B )) ) / alpha;
      end
      if( A<limit  && B>=limit ) begin
        Ipre = qe * Vox + ( ln(1+exp(A)) - B ) / alpha;
      end
      if( A>=limit && B<limit ) begin
        Ipre = qe * Vox + ( A - ln(1+exp(B)) ) / alpha;
      end
      if( A>=limit && B>=limit ) begin
        Ipre = qe * Vox + ( A - B ) / alpha;
        //Ipre = 0; // (A-B)/alpha == -qe * Vox
                  // drop it because of very bad numerical stuff
      end


      //warning: there seems to be a numerical issue with the verilog
      //         implementation of the above formula. When summing many terms,
      //         contributions first vanish, but from e.g. 57 onwards,
      //         they abruptly increase to large values again.
      //         This incorrect behavior is not present in matlab.
      //         In a first implementation, this problem was avoided by using the 
      //         stop criteria abs(delta)>eps.
      //         However, this results in a current which is not monotonic
      //         with Vox, which is very problematic for simulator convergence
      //
      // We now avoid the overflow by using simplified expressions for large
      // A and B
      
      I_n  = (2*qe/hPl) * Ipre;
      Itotal = Itotal+I_n;

      if ( file!=0 && verbose ) begin
        $fdisplay( file, "---------------------------------\n" );
        $fdisplay( file, "index   =%d\n", index   );
        $fdisplay( file, "E_n     =%g\n", E_n     );
        $fdisplay( file, "Ipre    =%g\n", Ipre    );
        $fdisplay( file, "I_n     =%g\n", I_n     );
        $fdisplay( file, "Itotal  =%g\n", Itotal  );
      end

      index = index+1;  
      if( Itotal!=0 ) begin
        delta = I_n/Itotal;        
      end
      
    end

    if ( file!=0 ) begin
      if( verbose ) begin
        $fdisplay( file, "wx=%gHz, wy=%gHz, V0=%gV --> index=%d, delta=%g, Itotal=%gA Vin=%g\n", 
                         omega_x, omega_y, V0, index, delta, Itotal, Vox );
      end
      if( Itotal!=0 ) begin
        delta = abs( I_n/Itotal );        
        if( delta> warn_ErrorPercentage/100 && I_n>warn_ErrorCurrent ) begin
          $fdisplay( file, "WARNING: delta in Irme>%3.2f%% (Irme=%3.6fuA)\n", (I_n/Itotal)*100, Itotal/1e-6 );
        end else begin
          if( delta> notify_ErrorPercentage/100 && I_n>notify_ErrorCurrent ) begin
          $fdisplay( file, "NOTE   : delta in Irme>%3.2f%% (Irme=%3.6fuA)\n", (I_n/Itotal)*100, Itotal/1e-6 ); 
          end
        end
      end
    end

  // assign result to return value
  calculateCurrentRME = Itotal;

  end //end of begin function
endfunction
