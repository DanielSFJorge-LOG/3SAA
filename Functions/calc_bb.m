%%%/*-----------------------------------------------------------------------------
%%%  bb computation
%%% -----------------------------------------------------------------------------*/

function [res]=calc_bb(rrs, Kd,pos_eta,pos_muw,eta, muw, lut_bb)
% global lut_bb;
  l_eta=[0.000, 0.005, 0.015, 0.020, 0.025, 0.030, 0.035, 0.040, 0.045, 0.050, 0.055, 0.060, 0.065, 0.070, 0.075, 0.080, 0.085, 0.090, 0.100, 0.150, 0.200];
  l_muw=[1, 0.991568, 0.966878, 0.927777, 0.877437, 0.82048, 0.763094, 0.712903];
  bb00 = restit_fit_bb(pos_eta,   pos_muw,   rrs, Kd, lut_bb);
  bb01 = restit_fit_bb(pos_eta,   pos_muw+1, rrs, Kd, lut_bb);
  bb10 = restit_fit_bb(pos_eta+1, pos_muw,   rrs, Kd, lut_bb);
  bb11 = restit_fit_bb(pos_eta+1, pos_muw+1, rrs, Kd, lut_bb);

  tmp1 = interp_line(l_eta(pos_eta), l_eta(pos_eta+1), eta, bb00, bb10);
  tmp2 = interp_line(l_eta(pos_eta), l_eta(pos_eta+1), eta, bb01, bb11);

  res = interp_line(l_muw(pos_muw), l_muw(pos_muw+1), muw, tmp1, tmp2);

end
