// -------------------------------------------------------------
// helperFunctions
//
// Functions to calculated the value of a logarithmic function
// that is described by 2 datapoints
//
// Author: Stefan Cosemans
// -------------------------------------------------------------


// macro definitions for PRINT functions {{{1
// -------------------------------------------------------------
`define my_printf(enableOutput,pattern,val) if( (enableOutput)==1 ) $display( (pattern), (val) ) 
`define my_fprintf(enableOutput,fid,pattern,val) if( (enableOutput)==1 ) $fdisplay( (fid), (pattern), (val) )
// }}}1



// target_omega_y = f( Vapplied, V0, omega_y_0, V1, omega_y_1 )
// -------------------------------------------------------------
// --> Determine how deep the cell will be reset if the
//     voltage Vapplied is applied for a very long time.
//     We assume a logarithmic fit through the two supplied points
analog function real calculate_target_omega_y;
  input V, V_0, omega_y_0, V_1, omega_y_1;
  real  V, V_0, omega_y_0, V_1, omega_y_1;
  real  A, B;

  begin
    A = (ln(omega_y_1)-ln(omega_y_0) )/(V_1-V_0);
    B = ln(omega_y_0) - A*V_0;
    calculate_target_omega_y = exp( A*V+B );
  end
endfunction


// tau = f( Vapplied, V0, tau0, V1, tau1 ) ; 
// -------------------------------------------------------------
// --> assume a logarithmic fit through
//     the two provided points, and calculate
//     the tau corresponding to Vapplied
//
//     NOTE: if tau0 and tau1 are actually T_per_decade, 
//           this method does return T_per_decade rather than tau
analog function real calculate_tau;
  input V, V_0, tau_0, V_1, tau_1;
  real  V, V_0, tau_0, V_1, tau_1;
  real  y0,y1,x0,x1;
  real  A, B;

  begin
    x0=V_0;
    x1=V_1;
    y0=ln(tau_0);
    y1=ln(tau_1);

    A = (y1-y0)/(x1-x0);
    B = y0 - A*x0;
    calculate_tau = exp( A*V+B );
  end
endfunction


// -- The code below is not needed any more with the current
//    implementation of set
// 
// omega_y = find_omega_y( Itarget, Vrme, omega_x, V0, file )
// -------------------------------------------------------------
// --> For an RME with given omega_x and V0,
//     find the omega_y for which Itarget is achieved at Vrme
// 
// note: not used in current implementation
// note: - should implement this with binary search
//       - if omega_x and V0 don't change, you could 
//         use a pre-calculated look-up table
//       however, as this method is only called when a cell exits
//       the special_set_mode, performance probably isn't that critical
// note: compiler complains about Vrme not being declared
//       -- no clue why
/*
analog function real find_omega_y;
  input Itarget, Vrme, omega_x, V0, file;
  real  Itarget, Vrme, omega_x, V0;
  integer file;
  real  I, omega_y, best_omega_y, best_current;

  begin
      $fdisplay( file, "(find_omega_y) target current:%gA\n", Itarget );
      best_current=0;
      best_omega_y=0;

      for( omega_y=1e10 ; omega_y<1e18; omega_y=omega_y*1.05 ) begin 
        // about 400 iterations
        I=calculateCurrentRME( omega_x, omega_y, V0, Vrme, 0, 0 );
        if( abs(I-Itarget)<abs(best_current-Itarget) ) begin
          best_current=I;
          best_omega_y = omega_y;
        end
      end
      $fdisplay( file, "(find_omega_y): omega_y=%gHz, current=%gA\n", best_omega_y, best_current );

      find_omega_y = best_omega_y;
  end
endfunction
*/

