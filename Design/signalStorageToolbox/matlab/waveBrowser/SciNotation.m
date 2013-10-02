function outS = SciNotation( number , unit)
            %
            % function outS = SciNotation( number [, unit])
            %
            % convert the number into a String of 'scientific' notation ,
            % of the form '%7.3g%s' , with %s being G , M , k , '' , m , u
            % , n , p , f , depending on the nearest size of the number.
            % concatenates the unit at the end of the string, if an unit is
            % defined
            %
            %  example
            %
            %  Results.ResultsHelper.SciNotation(1) ==> '1'
            %  Results.ResultsHelper.SciNotation(1e9) ==> '1G'
            %  Results.ResultsHelper.SciNotation(1.5e-8) ==> '15n'
            %  Results.ResultsHelper.SciNotation(1.5e-15,'F') ==> '1.5pF'
            if(iscell(number))
                number = cell2mat(number);
            end
            if(islogical(number))
                number = double(number);
            end
            if(~isnumeric(number))
                outS = number;
            else
                if(~isempty(number))
                    ee = floor(log10(abs(number)));
                    switch ee
                        case {11,10,9}
                            prefix = 'G';
                            frac = 1e9;
                        case {8,7,6}
                            prefix = 'M';
                            frac = 1e6;
                        case {5,4,3}
                            prefix = 'k';
                            frac = 1e3;
                        case {-1, -2, -3}
                            prefix = 'm';
                            frac = 1e-3;
                        case {-4, -5, -6}
                            prefix = 'u';
                            frac = 1e-6;
                        case {-7, -8, -9}
                            prefix = 'n';
                            frac = 1e-9;
                        case {-10, -11, -12}
                            prefix = 'p';
                            frac = 1e-12;
                        case {-13, -14, -15 , -16 , -17 , -18}
                            prefix = 'f';
                            frac = 1e-15;
                        otherwise
                            prefix = '';
                            frac = 1;
                    end
                    
                    
                    if (nargin ==1)
                        outS = sprintf('%7.3g%s',number/frac,prefix);
                    else
                        outS = sprintf('%0.4g%s%s',number/frac,prefix,unit);
                    end
                else
                    outS = sprintf('NaN');
                end
            end
            
        end
    
