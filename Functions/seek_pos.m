%%%/*-----------------------------------------------------------------------------
%%%  
%%% -----------------------------------------------------------------------------*/

function [res]=seek_pos(data, nb, tab)
NBETA       =21;
NBMUW       =8;
    if nb==NBETA
        if data <= tab(1)
         res=1;
        end
        
        if data >= tab(nb) 
            res=nb-1;
        end
        
        for i=1:nb-1
                if data >= tab(i) & data < tab(i+1)
                    res = i;
                else
                end
        end
    end

    if nb == NBMUW
        if data >= tab(1) 
        res=1;
        end
        if data <= tab(nb)
           res=nb-1;
        end
        
        for i=1:nb-1
                if data <= tab(i) & data > tab(i+1)
                    res = i;
                else
                end
        end
    end

end
