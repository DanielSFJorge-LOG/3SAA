%%%/*-----------------------------------------------------------------------------
%%%  Restitution du fit bb/Kd = f(Rrs)
%%% -----------------------------------------------------------------------------*/

function [bb]= restit_fit_bb(peta,pmuw,rrs, kd,lut_bb)
% global lut_bb
  bb = kd * (lut_bb(peta,pmuw,1).*rrs + lut_bb(peta,pmuw,2)*rrs*rrs + lut_bb(peta,pmuw,3)*rrs*rrs*rrs);
end