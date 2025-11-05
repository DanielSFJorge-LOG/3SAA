%%%/*-----------------------------------------------------------------------------
%%%  Restitution du fit Kd/a = f(rrs)
%%% -----------------------------------------------------------------------------*/

function [a]=restit_fit_a(peta,pmuw,kd,rrs, lut_a)
% global lut_a;
  a = kd ./ (lut_a(peta,pmuw,1) + lut_a(peta,pmuw,2).*rrs + lut_a(peta,pmuw,3).*rrs.*rrs + lut_a(peta,pmuw,4).*rrs.*rrs.*rrs);
end