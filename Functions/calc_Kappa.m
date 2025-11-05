%%%/*-----------------------------------------------------------------------------
%%%  Raman correction (Kappa) computation 
%%% -----------------------------------------------------------------------------*/

function [K]=calc_Kappa( bb_a,il,lut_Raman,lut_RamanMax,lut_RamanMin)
  if bb_a>=lut_RamanMin(il) && bb_a<=lut_RamanMax(il)
    in = bb_a;
    K = lut_Raman(il,1).*in.*in.*in + lut_Raman(il,2).*in.*in +  lut_Raman(il,3).*in + lut_Raman(il,4);
  else
    K=-2;
  end
end