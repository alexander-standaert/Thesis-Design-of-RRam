% WARNING: this is a copy of getHfOxRME()
%          make changes to the original file in framework/RMEs/HfOx/                              
    

function [ RME  ] = getHfOxRME( Vin, RMEparams, Nmax, detailedPlots )
% function [ RME ] = getHfOxRME( Vin, RMEparams, [ Nmax, detailedPlots ] )
%
% Return the current through the HfOx resistive memory element (RME) with the given parameters
% Current is calculated at the values specified in Vin
% the current is returned as a java SignalStorageToolbox Signal object
%
% Filament conduction equation using model for QM transport through constriction
%
% model by R. Degraeve
% based on mathematica implementation by Ph.J.Roussel
%
% matlab implementation by stefan cosemans
%
% example parameters:
%   RMEparams.V0      = 0.25;
%   RMEparams.omega_x = 6.0e14; %Hz
%   RMEparams.omega_y = 1.0e14; %Hz
%
%   Vin:  The voltage over the RME (also called Vox) for which the current is to be calculated
%         e.g. -1.2:0.1:1.2
%
%   Nmax: Number of terms (correspond to "channels") tgat we take along in the summation. 
%         According to Robin and Philippe, 2 or 3 terms should be enough for valid cell parameters.
%         an infinite number doesn't make sense from a physical point of view
%         For some artificial parameter values, you need more than 50 terms to get sufficiently
%         close to the final result 
%         (it is allowed to sum to N~=inf, but the contributions should quickly go to zero
%          with higher N)
%
% returns RME : 
%   RME.params
%   RME.VRME_to_IRME : java signalStorageToolbox Signal that maps VRME --> IRME
%   RME.V_to_I       : identical to VRME_to_IRME -- should drop VRME_to_IRME
%
% time cost: 150ms per call with N=100 on prometheus
%

    if nargin<3
        Nmax=100;
    end
    if nargin<4
        detailedPlots=0;
    end
    N=Nmax;  % --- seems like we need many terms in the expansion to get the same result as in philip's graph at higher voltages [he used up to 100, to be exact]
    
    V0      = RMEparams.V0;
    omega_x = RMEparams.omega_x;
    omega_y = RMEparams.omega_y;
    
    Vox=Vin;
    
    c=getConstants();
    qe   = c.q; % C
    %me   = c.electronMass; % kg
    hPl  = c.h; % J s
    hbar = c.hbar;
    e=exp(1);    

    %--- saddle surface equation   [not used???]
    %EnV0 = qe*V0 + 1/2 * me * ( (omega_y*y)^2 - (omega_x*x)^2 );

    %--- quantized energy levels in constriction  En = f(V0, omega_y, n)



    % Ph.J.Roussel changed the order of calculation compared to R.Degraeve
    % start from T_n(E) = [R.Degraeve's formula]
    %       calculate Ipre_n( Vox ) = [ integrate T_n(E) ] from = - q/2 Vox to +q/2 vox
    %       --> Ph.J.Roussel obtained an analytic expression for [ integrate T_n(E) ]
    %       then calculate filament I(Vox) : 2*qe/hPl * [ sum n=0...N { Ipre_n }]
    alpha = 2*pi / ( hbar * omega_x );
    %fprintf( '%g\n', alpha );  %debug
    
    
    % log is the natural logarithm

    
    clear En; 
    clear A;
    clear B;
    nV = 0:N;
    for i=nV
        E_n(i+1) = qe * V0 + hbar * omega_y * ( i+1/2 ) ;
%        Ipre_n{i+1} = qe * Vox + log(                                      ...
%                                        (1+e.^(alpha*(E_n(i+1)-qe*Vox/2) ) ) ./ ...
%                                        (1+e.^(alpha*(E_n(i+1)+qe*Vox/2) ) )    ...
%                                    ) / alpha;
        
        A = alpha * ( E_n(i+1) - qe*Vox/2 );
        B = alpha * ( E_n(i+1) + qe*Vox/2 );        
        Aprime = 1+exp(A);
        Bprime = 1+exp(B);        
        logA = log( Aprime );
        logB = log( Bprime );        
        deltaLog = logA - logB;        
        deltaLogScaled = deltaLog / (alpha);        
        prepart = (qe)*Vox;        
        
        
        if 0
            Ipre_n{i+1} = prepart + deltaLogScaled;
        else
            L=30; % set as high as possible, but avoid numerical noise on the signals...
            S1 = (A< L) & (B< L);
            S2 = (A< L) & (B>=L);
            S3 = (A>=L) & (B< L);
            S4 = (A>=L) & (B>=L);
            
            Ix = S1 .* (  qe * Vox + ( log( (1+exp( A ))) - log( 1+exp( B )) ) / alpha  ) + ...
                 S2 .* (  qe * Vox + ( log(1+exp(A))      - B                ) / alpha  ) + ...
                 S3 .* (  qe * Vox + ( A                  - log(1+exp(B))    ) / alpha  ) + ...
                 S4 .* (  0                                                             );
            
            % fix erratic NaN values...            
            indices = isnan( Ix );
            Ix( indices ) = 0;
            Ipre_n{i+1} = Ix;
            
                      
            %note:        S4 .* (  qe * Vox + ( A                  - B                ) / alpha  );
            %             is 0, because (A-B)/alpha=-qe*Vox
                      
            %fprintf( 'n=%d, [S1]=%d, [S2]=%d, [S3]=%d, [S4]=%d\n', i, sum(S1), sum(S2), sum(S3), sum(S4) );
                      
            
%             if( (A<7) & (B<7)  ) 
%                 Ipre_n{i+1} = qe * Vox + ( log( (1+exp( A ))) - log( 1+exp( B )) ) / alpha;
%                 %Ipre_n{i+1} = prepart + deltaLogScaled;
%                 fprintf( 'A-----------------\n' );
%                 %Ipre = qe * Vox + ( log(1+exp( A )) - log(1+exp( B )) ) / alpha;
%             end
%             if(  ) 
%                 Ipre_n{i+1} = qe * Vox + ( log(1+exp(A)) - B ) / alpha;
%                 fprintf( 'B-----------------\n' );
%             end
%             if(  ) 
%                 Ipre_n{i+1} = qe * Vox + ( A - log(1+exp(B)) ) / alpha;
%                 fprintf( 'C-----------------\n' );
%             end
%             if(  ) 
%                 Ipre_n{i+1} = qe * Vox + ( A - B ) / alpha;
%                 fprintf( 'D-----------------\n' );
%             end
        end
        I_n{i+1} = (2*qe/(hPl)) * Ipre_n{i+1};
        
%         figure(10001); 
%         semilogy( Vox, A, 'r-', 'displayName', sprintf( 'A_%d', i) ); title('A');
%         hold on;
%         figure(10002); 
%         semilogy( Vox, B, 'r-', 'displayName', sprintf( 'B_%d', i) );title('B');
%         hold on;
%         figure(10003); 
%         semilogy( Vox, Aprime, 'r-', 'displayName', sprintf( 'Aprime_%d', i) ); title('A_prime');
%         hold on;
%         figure(10004); 
%         semilogy( Vox, Bprime, 'r-', 'displayName', sprintf( 'Bprime_%d', i) );title('B_prime');
%         hold on;
%         figure(10005); 
%         semilogy( Vox, abs(logA), 'r-', 'displayName', sprintf( 'logA_%d', i) ); title('logA');
%         hold on;
%         figure(10006); 
%         semilogy( Vox, abs(logB), 'r-', 'displayName', sprintf( 'log_B_%d', i) );title('logB');
%         hold on;
%         figure(10010); 
%         semilogy( Vox, abs(deltaLog), 'r-', 'displayName', sprintf( 'deltaLog_%d', i) );title('deltaLog');
%         hold on;
%         figure(10012); 
%         semilogy( Vox, abs(deltaLogScaled), 'r-', 'displayName', sprintf( 'deltaLogScaled_%d', i) );title('deltaLogScaled');
%         hold on;
%         figure(10015); 
%         semilogy( Vox, abs(prepart), 'r-', 'displayName', sprintf( 'prepart_%d', i) );title('prepart');
%         hold on;        
%         figure(10020); 
%         semilogy( Vox, Ipre_n{i+1}, 'r-', 'displayName', sprintf( 'Ipre_n_%d', i) );title('Ipre_n');
%         hold on;
%         figure(10031); 
%         semilogy( Vox, I_n{i+1}, 'r-', 'displayName', sprintf( 'I_n_%d', i) );title('I_n');
%         hold on;
         
        
    end

    
    
    I_filament = I_n{1}*0;
    for i=nV
        I_filament = I_filament + I_n{i+1};
        
        % debug code -- to debug verilog-a version
        %fprintf( '----------------\n' );
        %fprintf( 'index = %d      \n', i        );
        %fprintf( 'E_n   =%g\n', E_n(i+1)        );
        %fprintf( 'Ipre_n=%g\n', Ipre_n{i+1}     );
        %fprintf( 'I_n   =%g\n', I_n{i+1}        );
        %fprintf( 'Itotal=%g\n', I_filament      );
        %fprintf( '%d: %d x NaN\n', i, sum( isnan( I_filament ) ) );
    end

    %fprintf('alpha=%g, E0=%g, E1=%g, qe*alpha=%g, E0*alpha=%g, E1*alpha=%g \n', alpha, E_n(1), E_n(2), qe*alpha, E_n(1)*alpha, E_n(2)*alpha );
    
    %size(Vox)
    %size(E_n(1))
    %size(Ipre_n{1})
    %size(I_n{1})
    
    if detailedPlots
        % --------- plot E_n( 0:N ) : straight line

        figure(1);
        plot( nV, E_n, 'ko' );
        hold on;
        grid on;
        xlabel( 'n' );
        ylabel( 'E_n [J]' ); % todo: check unit    I

        % --------------------------------------- linear
        % --------- plot I_n( Vox ); n=0...N
        figure(2);
        nextStyle(1);
        for i=nV
            plot( Vox, I_n{i+1}, nextStyle(), 'displayName', sprintf( 'n=%d',i ) );    
            hold on;
        end
        % --------- total filament current I_filament( Vox )
        plot( Vox, I_filament, 'r-', 'lineWidth', 2 );    
        grid on;
        xlabel( 'Vox [V]' );
        ylabel( '(partial) filament current [A]' );
        legend show;

        % --------------------------------------- semilogy
        % --------- plot I_n( Vox ); n=0...N
        figure(3);
        nextStyle(1);
        for i=nV
            semilogy( Vox, I_n{i+1}, nextStyle(), 'displayName', sprintf( 'n=%d',i ) );    
            hold on;
        end
        % --------- total filament current I_filament( Vox )
        semilogy( Vox, I_filament, 'r-', 'lineWidth', 2 );    
        grid on;
        xlabel( 'Vox [V]' );
        ylabel( '(partial) filament current [A]' );
        legend show;   
    
    end
    
    % ----- transform into a java SignalStorageToolbox Signal    
    
    import be.kuleuven.micas.signals.*;  %weird that htis must be repeated :s
    
    I_filament_java = Signal( Vin, 'V_RME', 'V', I_filament, 'I_RME', 'A' );
    I_filament = I_filament_java;
    
    RME.params = RMEparams;
    RME.VRME_to_IRME = I_filament;
    RME.V_to_I = I_filament;
    
end
