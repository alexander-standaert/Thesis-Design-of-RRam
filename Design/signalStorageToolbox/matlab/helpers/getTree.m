function [ tree ] = getTree( nodeList )
% function [ tree ] = getTree( nodeList )
%
%  Get a tree view from a nodeList, e.g.
%  nodeList = { 'Xsub1.a', 'Xsub1.b', 'Xsub2.n1', 'n3' }
%
%  will return a structure tree, containing the name
%
%  tree.Xsub1.a  = 'Xsub1.a'
%  tree.Xsub1.b  = 'Xsub1.b'
%  tree.Xsub2.n1 = 'Xsub2.n1'
%  tree.n3 = 'n3'
%
%  note:replaces ':' with 'I' in the structure-names, but not in the nodenames
%                    themselves
%
%  This allows easy tab-completion ...


    tree = struct( 'PATH', '' );

    % sort the list
    %nodeList=strrep( nodeList, ':', 'I' );
    nodeList = sort( nodeList );
    
    % split each line
    partList  = regexp( nodeList, '\.', 'split' );
    
    %start making the tree 
    path='';
    baseIndex=1;
    tree = makeSubTree( partList, baseIndex, path );
        

end


function [ subTree ] = makeSubTree( partList, baseIndex, path )
    
    
    
    subTree = struct( 'zPATH', path );

    % call makeSubTree( )  for each base-name in partList, and add it to
    
    nextIndex=1;
    while nextIndex <= length( partList );
        
        parts=partList{nextIndex};
        baseName = parts{ baseIndex };
        
        sameBaseName=1;
        
        for j=(nextIndex+1):length(partList)
           parts = partList{j};
           if strcmp( parts{baseIndex}, baseName );
               sameBaseName=sameBaseName+1;
           else
               break;
           end
        end
        
        endIndex = nextIndex+sameBaseName-1;
       
        
        
        if ( (sameBaseName==1) && ( length( partList{nextIndex} )==baseIndex ) )
            %% it is a final node
            
            fprintf( [ 'starting baseName="' baseName '"\n' ] );
            %%replace every ':' by a I
            tempName = strrep( baseName, ':', 'I' );
            %%replace every '_' by a I
            tempName = strrep( tempName, '_', 'u' );
            %%tempName = strrep( tempName, 'v(' , '') ;
           % tempName = strrep( tempName, ')' , '') ;
            %%if it is a v(blahblah) node, replace by blahblah on the
            %%tree... if it is a bluh(blahblah), replace by blahblahIbluh
            %%% if it is a bluh(blah node, replace by blahIbluh
            isVoltage=regexp( tempName,'v\((?<nodeName>\S*)\)\s*' ,'names');
            isCurrent=regexp( tempName,'(?<nodeType>\w*)\((?<nodeName>\S*)\)\s*' ,'names');
            isHalfV  =regexp( tempName,'v\((?<nodeName>\S*)\s*' ,'names');
            isHalfCurrent=regexp( tempName,'(?<nodeType>\w*)\((?<nodeName>\S*)\s*' ,'names');
            isHalfEndV  =regexp( tempName,'(?<nodeName>\S*)\)\s*' ,'names');
            if(~isempty(isCurrent))
                if(~isempty(isVoltage))
                    tempName = isVoltage.nodeName;
                else
                    tempName = [ isCurrent.nodeName 'I' isCurrent.nodeType];
                end
            else
            if (~isempty(isHalfCurrent)) 
                 if (~isempty(isHalfV))
                        tempName = isHalfV.nodeName;
                 else
                        tempName = [ isHalfCurrent.nodeName 'I' isHalfCurrent.nodeType];
                 end
            else
            if(~isempty(isHalfEndV))
                tempName = isHalfEndV.nodeName;
            end
            end
            end
            
            try 
                subTree.(tempName) =  [ path baseName ];            
            catch e
                fprintf( 'while constructing tree: WARNING: "%s" is not a valid field name -- skipping \n', tempName );                
            end
        else
            %% it is still a subcircuit ...   
            isHalfV  =regexp( baseName,'v\((?<nodeName>\S*)\s*' ,'names');
            isHalfCurrent=regexp( baseName,'(?<nodeType>\w*)\((?<nodeName>\S*)\s*' ,'names');
            if (~isempty(isHalfCurrent)) 
                 if (~isempty(isHalfV))
                        tempName = isHalfV.nodeName;
                 else
                        tempName = [ isHalfCurrent.nodeName 'I' isHalfCurrent.nodeType];
                 end
            else
                tempName = baseName;
            end
            subTree.(tempName) = makeSubTree( partList(nextIndex:endIndex), baseIndex+1, [ path baseName '.'] );
        end
                
                
        nextIndex=nextIndex+sameBaseName;
    end

end

