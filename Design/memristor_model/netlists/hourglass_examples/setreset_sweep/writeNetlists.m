function [] = writeNetlists()
% function [] = writeNetlists()
%
%   write a netlist for the settings as defined in simulationSettings.m
%   this script can define multiple rampRates

    [ settings, rampRates ] = simulationSettings();
    
    for i=1:length(rampRates.rampRates)
        simName  = rampRates.simNames{i};
        rampRate = rampRates.rampRates(i);
        writeNetlist( settings, simName, rampRate );
    end
    
    createPerformAllSimulations( rampRates.simNames );
    
end

function [] = writeNetlist( settings, simName, rampRate )
    
    sp = settings;
    sp = fillOutTimeInfo( sp, rampRate );   
    
    mat2spice( 'setreset_sweep.m2s', 'generated', sp );
    
    commandString = sprintf( '!mv generated/setreset_sweep.sp generated/setreset_sweep_%s.sp', simName );    
    eval( commandString );       
    
end


function [ sp ] = fillOutTimeInfo( sp, rampRate )

    sp.Ttop     = sp.Vmax / rampRate;
    
    Tflat= sp.Ttop*sp.flatTime; 
    sp.Ttop2    = sp.Ttop + Tflat;
    sp.Tmid     = sp.Ttop2 +sp.Ttop*sp.returnTimeFraction;
    sp.Tbottom  = sp.Tmid + 1*sp.Ttop;
    sp.Tbottom2 = sp.Tbottom + Tflat;    
    sp.Tcycle  = sp.Tbottom2 + sp.Ttop*sp.returnTimeFraction;
	
    sp.Tstop = sp.Tcycle * sp.cycles;
    
    sp.progressPrintStep = sp.Tcycle/10;
    sp.time_step_bound   = sp.Tcycle/20000;
    sp.flux_limit = sp.fluxLimitInPeriod / sp.Ttop;
    
    sp.PWLstatement = constructPWLstatement( sp );
    
end

function [ PWLstatement ] = constructPWLstatement( sp )
% construct a PWL statement for reset -set -reset -set - ...

    PWL = '';
    for i=1:sp.cycles        
        if false % reset first
            PWL = sprintf( '%s  ''%d*Tcycle'' 0  ''%d*Tcycle+Ttop'' Vmin ''%d*Tcycle+Ttop2'' Vmin ''%d*Tcycle+Tmid'' 0  ''%d*Tcycle+Tbottom''  Vmax  ''%d*Tcycle+Tbottom2''  Vmax', PWL, i-1, i-1, i-1, i-1, i-1, i-1 );
        else    % set first
            PWL = sprintf( '%s  ''%d*Tcycle'' 0  ''%d*Tcycle+Ttop'' Vmax ''%d*Tcycle+Ttop2'' Vmax ''%d*Tcycle+Tmid'' 0  ''%d*Tcycle+Tbottom''  Vmin  ''%d*Tcycle+Tbottom2''  Vmin', PWL, i-1, i-1, i-1, i-1, i-1, i-1 );
        end
    end
    
    PWLstatement = sprintf( 'PWL( %s )', PWL );

end


function [] = createPerformAllSimulations( simNames )

    fid = fopen('generated/performAllSimulations.sh', 'w' );
    if fid==-1
        error( 'could not create file generated/performAllSimulations.sh\n' );
    end
    fprintf( fid, '#!/bin/bash                                                                      \n\n' ); 
    
    fprintf( fid, '# output path is relative to path in which spectre is run: ./UWI/                \n\n' );
    fprintf( fid, 'mkdir logs                                                                       \n\n' );
    fprintf( fid, 'mkdir UWI                                                                        \n\n' );
    
    %fprintf( fid, 'cd generated                                                                     \n'   );    
    for i=1:length( simNames )
        name = simNames{i};
        fprintf( fid, 'export UWI_OUTPUT_MAP=UWI/%s/                                         \n\n', name );
        fprintf( fid, 'nice UWIspectre.sh setreset_sweep_%s.sp | tee output_console_%s.log   \n'  , name, name );
    end
    %fprintf( fid, 'cd ..                                                                            \n' );
   
    fclose(fid);
    !chmod u+x generated/performAllSimulations.sh
    
end
