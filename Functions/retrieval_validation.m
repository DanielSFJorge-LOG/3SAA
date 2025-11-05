
%   /* look up table for Raman correction */
% /* -------------------------------------------------------------------
%  * IOP retrieval validation test 
%  * Werdel et al Applied Optics 2013
%  --------------------------------------------------------------------- */
    function [status]=retrieval_validation(bbp, ANW,aphy,acdm, RRS,idAlgo)

 G1=0.0949; G2=0.0794;idLSD=0;
  
  for lambda=1:length(bbp)
    if (bbp(lambda) <= -0.05*BBW(lambda) & bbp(lambda)>-900) | bbp(lambda) > 1
      status = 1;
    end
  end
  
    
  if idAlgo ~= idLSD
    if (acdm(usedL(1)) <= -0.05*AW(usedL(1)) & acdm(usedL(1))>-900) | acdm(usedL(1)) > 5
      status = 2;

      for lambda=1:length(aphy)
      if (aphy(lambda) <= -0.05*AW(lambda) & aphy(lambda)>-900) | aphy(lambda) > 5
        status = 3;
      end
      end
    end
  end
  
  for lambda=1:length(bbp)
    bb   = bbp(lambda) + BBW(lambda);
    u    = bb / (ANW(lambda)+AW(lambda) + bb);
    rrs  = G1*u + G2*u*u;
    RrsRes(lambda) = (0.52*rrs) / (1-1.7*rrs);
  end
  
  DeltaRrs = 0.0;
  for lambda=1:length(RrsRes)
    DeltaRrs= (RrsRes(lambda)-RRS(lambda)) / RRS(lambda);
  end
  DeltaRrs = Dealta/length(RrsRes);
  if DeltaRrs > .33 
    status = 4;
  end
end
