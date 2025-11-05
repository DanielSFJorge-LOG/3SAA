% /* ------------------------------------------------------------------------------- 
%  Lecture des differrentes Look Up Tables
%  -------------------------------------------------------------------------------  */
%   function neuron_lect_LUTswitch(idSensor)
global idSEAWIFS;
global idMODIS;
global idMERIS;
global idOLCI;
global idOLCI6WL;
global path_mapping;

% cd([path_mapping '\LUT'])
run('neural_setup_2022.m')

% /* ===================================== SeaWiFS ===================================== */
  if idSensor == idSEAWIFS || idSensor == idOLCI6WL || idSensor == idOLCI
%     /* ----- LUTs for Rrs490/Rrs555 >= .85 ------ */
%rsupSW_LUT_POIDS
%POIDS
      nomfic=rsupSW_LUT_POIDS;
      rsupSW_b1(1:rsupSW_NC1)=nomfic(1:rsupSW_NC1,3);
      rsupSW_b2(1:rsupSW_NC2)=nomfic(9:14,3);
      rsupSW_b3=nomfic(15,3);
      
      for i=1:rsupSW_NE
          for ii=1:rsupSW_NC1
           rsupSW_w1(i,ii)=nomfic(15+ii+(i-1)*8,3);   
          end
      end
      
      for i=1:rsupSW_NC1
          for ii=1:rsupSW_NC2
            rsupSW_w2(i,ii)=nomfic(63+ii+(i-1)*6,3);
          end
      end
     
      rsupSW_w3(1:rsupSW_NC2)=nomfic(112:117,3);
      
 %MOY 
      nomfic=rsupSW_LUT_MOY;
      rsupSW_moy(1:4)=nomfic(2:5);
      rsupSW_moy(rsupSW_NE-1)=nomfic(8);
      rsupSW_moy(rsupSW_NE)=nomfic(9);
      rsupSW_moy(rsupSW_NES)=nomfic(10);
      
 %ECART
      nomfic=rsupSW_LUT_ECART;
      rsupSW_ecart(1:4)=nomfic(2:5);
      rsupSW_ecart(rsupSW_NE-1)=nomfic(8);
      rsupSW_ecart(rsupSW_NE)=nomfic(9);
      rsupSW_ecart(rsupSW_NES)=nomfic(10);

%   /* ----- LUTs for Rrs490/Rrs555 < .85 ------ */
%rsupSW_LUT_POIDS
%POIDS
      nomfic=rinfSW_LUT_POIDS;
      rinfSW_b1(1:rinfSW_NC1)=nomfic(1:9,3);
      rinfSW_b2(1:rinfSW_NC2)=nomfic(10:15,3);
      rinfSW_b3=nomfic(16,3);
      
      for i=1:rinfSW_NE
          for ii=1:rinfSW_NC1
           rinfSW_w1(i,ii)=nomfic(16+ii+(i-1)*9,3);   
          end
      end
      
      for i=1:rinfSW_NC1
          for ii=1:rinfSW_NC2
            rinfSW_w2(i,ii)=nomfic(79+ii+(i-1)*6,3);
          end
      end
      
      rinfSW_w3(1:rinfSW_NC2)=nomfic(134:end,3);

% MOY
      nomfic=rinfSW_LUT_MOY;
      rinfSW_moy(1:4)=nomfic(2:5);
      rinfSW_moy(5)=nomfic(7);
      rinfSW_moy(rinfSW_NE-1)=nomfic(8);
      rinfSW_moy(rinfSW_NE)=nomfic(9);
      rinfSW_moy(rinfSW_NES)=nomfic(10);


%ECART
      nomfic=rinfSW_LUT_ECART;
      rinfSW_ecart(1:4)=nomfic(2:5);
      rinfSW_ecart(5)=nomfic(7);
      rinfSW_ecart(rinfSW_NE-1)=nomfic(8);
      rinfSW_ecart(rinfSW_NE)=nomfic(9);
      rinfSW_ecart(rinfSW_NES)=nomfic(10);

 
%   /* =====================================  MODIS  ===================================== */
  elseif idSensor == idMODIS
%       /* ----- LUTs for Rrs490/Rrs555 >= .85 ------ */
%POIDS
      nomfic=rsupMO_LUT_POIDS;
      rsupMO_b1(1:rsupMO_NC1)=nomfic(1:5,3);
      rsupMO_b2(1:rsupMO_NC2)=nomfic(6:9,3);
      rsupMO_b3=nomfic(10,3);
      
      for i=1:rsupMO_NE
          for ii=1:rsupMO_NC1
           rsupMO_w1(i,ii)=nomfic(10+ii+(i-1)*5,3);   
          end
      end
      
      for i=1:rsupMO_NC1
          for ii=1:rsupMO_NC2
            rsupMO_w2(i,ii)=nomfic(35+ii+(i-1)*4,3);
          end
      end
      
      rsupMO_w3(1:rsupMO_NC2)=nomfic(56:end,3);

% MOY
      nomfic=rsupMO_LUT_MOY;
      rsupMO_moy(1:4)=nomfic(2:5);
      rsupMO_moy(rsupMO_NE)=nomfic(8);
      rsupMO_moy(rsupMO_NES)=nomfic(10);

%ECART
      nomfic=rsupMO_LUT_ECART;
      rsupMO_ecart(1:4)=nomfic(2:5);
      rsupMO_ecart(rsupMO_NE)=nomfic(8);
      rsupMO_ecart(rsupMO_NES)=nomfic(10);

%   /* ----- LUTs for Rrs490/Rrs555 < .85 ------ */
%POIDS
      nomfic=rinfMO_LUT_POIDS;
      rinfMO_b1(1:rinfMO_NC1)=nomfic(1:10,3);
      rinfMO_b2(1:rinfMO_NC2)=nomfic(11:17,3);
      rinfMO_b3=nomfic(18,3);
      
      for i=1:rinfMO_NE
          for ii=1:rinfMO_NC1
           rinfMO_w1(i,ii)=nomfic(18+ii+(i-1)*10,3);   
          end
      end
      
      for i=1:rinfMO_NC1
          for ii=1:rinfMO_NC2
            rinfMO_w2(i,ii)=nomfic(78+ii+(i-1)*7,3);
          end
      end
      
      rinfMO_w3(1:rinfMO_NC2)=nomfic(149:end,3);

% MOY
      nomfic=rinfMO_LUT_MOY;
      rinfMO_moy(1:4)=nomfic(2:5);
      rinfMO_moy(5)=nomfic(7);
      rinfMO_moy(rinfMO_NE)=nomfic(8);
      rinfMO_moy(rinfMO_NES)=nomfic(10);

%ECART
      nomfic=rinfMO_LUT_ECART;
      rinfMO_ecart(1:4)=nomfic(2:5);
      rinfMO_ecart(5)=nomfic(7);
      rinfMO_ecart(rinfMO_NE)=nomfic(8);
      rinfMO_ecart(rinfMO_NES)=nomfic(10);
      
      
   
%  /* =====================================  MERIS / OLCI  ===================================== */
  elseif idSensor == idMERIS
      
%     /* ----- LUTs for Rrs490/Rrs555 >= .85 ------ */      
 %POIDS
      nomfic=rsupOL_LUT_POIDS;
      rsupOL_b1(1:rsupOL_NC1)=nomfic(1:7,3);
      rsupOL_b2(1:rsupOL_NC2)=nomfic(8:11,3);
      rsupOL_b3=nomfic(12,3);
      
      for i=1:rsupOL_NE
          for ii=1:rsupOL_NC1
           rsupOL_w1(i,ii)=nomfic(12+ii+(i-1)*7,3);   
          end
      end
      
      for i=1:rsupOL_NC1
          for ii=1:rsupOL_NC2
            rsupOL_w2(i,ii)=nomfic(47+ii+(i-1)*4,3);
          end
      end
      
      rsupOL_w3(1:rsupOL_NC2)=nomfic(76:end,3);

% MOY
      nomfic=rsupOL_LUT_MOY;
      rsupOL_moy(1:4)=nomfic(2:5);
      rsupOL_moy(rsupOL_NE)=nomfic(7);
      rsupOL_moy(rsupOL_NES)=nomfic(9);

%ECART
      nomfic=rsupOL_LUT_ECART;
      rsupOL_ecart(1:4)=nomfic(2:5);
      rsupOL_ecart(rsupOL_NE)=nomfic(7);
      rsupOL_ecart(rsupOL_NES)=nomfic(9);
           
%   /* ----- LUTs for Rrs490/Rrs555 < .85 ------ */

 %POIDS
      nomfic=rinfOL_LUT_POIDS;
      rinfOL_b1(1:rinfOL_NC1)=nomfic(1:5,3);
      rinfOL_b2(1:rinfOL_NC2)=nomfic(6:10,3);
      rinfOL_b3=nomfic(11,3);
      
      for i=1:rinfOL_NE
          for ii=1:rinfOL_NC1
           rinfOL_w1(i,ii)=nomfic(11+ii+(i-1)*5,3);   
          end
      end
      
      for i=1:rinfOL_NC1
          for ii=1:rinfOL_NC2
            rinfOL_w2(i,ii)=nomfic(41+ii+(i-1)*5,3);
          end
      end
      
      rinfOL_w3(1:rinfOL_NC2)=nomfic(67:end,3);

% MOY
      nomfic=rinfOL_LUT_MOY;
      rinfOL_moy(1:5)=nomfic(2:6);
      rinfOL_moy(rinfOL_NE)=nomfic(7);
      rinfOL_moy(rinfOL_NES)=nomfic(9);

%ECART
      nomfic=rinfOL_LUT_ECART;
      rinfOL_ecart(1:5)=nomfic(2:6);
      rinfOL_ecart(rinfOL_NE)=nomfic(7);
      rinfOL_ecart(rinfOL_NES)=nomfic(9);

%         /* =====================================  OLCI v2018  ===================================== */
  elseif idSensor == idOLCI
%     /* ----- LUTs for Rrs490/Rrs555 >= .85 ------ */
%POIDS
      nomfic=rsup2OL_LUT_POIDS;
      rsup2OL_b1(1:rsup2OL_NC1)=nomfic(1:9,3);
      rsup2OL_b2(1:rsup2OL_NC2)=nomfic(10:15,3);
      rsup2OL_b3=nomfic(16,3);
      
      for i=1:rsup2OL_NE
          for ii=1:rsup2OL_NC1
           rsup2OL_w1(i,ii)=nomfic(16+ii+(i-1)*9,3);   
          end
      end
      
      for i=1:rsup2OL_NC1
          for ii=1:rsup2OL_NC2
            rsup2OL_w2(i,ii)=nomfic(70+ii+(i-1)*6,3);
          end
      end
      
      rsup2OL_w3(1:rsup2OL_NC2)=nomfic(125:end,3);

% MOY
      nomfic=rsup2OL_LUT_MOY;
      rsup2OL_moy(1:4)=nomfic(2:5);
      rsup2OL_moy(rsup2OL_NE-1)=nomfic(8);
      rsup2OL_moy(rsup2OL_NE)=nomfic(9);
      rsup2OL_moy(rsup2OL_NES)=nomfic(10);

%ECART
      nomfic=rsup2OL_LUT_ECART;
      rsup2OL_ecart(1:4)=nomfic(2:5);
      rsup2OL_ecart(rsup2OL_NE-1)=nomfic(8);
      rsup2OL_ecart(rsup2OL_NE)=nomfic(9);
      rsup2OL_ecart(rsup2OL_NES)=nomfic(10);


%   /* ----- LUTs for Rrs490/Rrs555 < .85 ------ */

%POIDS
      nomfic=rinf2OL_LUT_POIDS;
      rinf2OL_b1(1:rinf2OL_NC1)=nomfic(1:10,3);
      rinf2OL_b2(1:rinf2OL_NC2)=nomfic(11:18,3);
      rinf2OL_b3=nomfic(19,3);
      
      for i=1:rinf2OL_NE
          for ii=1:rinf2OL_NC1
           rinf2OL_w1(i,ii)=nomfic(19+ii+(i-1)*10,3);   
          end
      end
      
      for i=1:rinf2OL_NC1
          for ii=1:rinf2OL_NC2
            rinf2OL_w2(i,ii)=nomfic(99+ii+(i-1)*8,3);
          end
      end
      
      rinf2OL_w3(1:rinf2OL_NC2)=nomfic(180:end,3);

% MOY
      nomfic=rinf2OL_LUT_MOY;
      rinf2OL_moy(1:6)=nomfic(2:7);
      rinf2OL_moy(rinf2OL_NE-1)=nomfic(8);
      rinf2OL_moy(rinf2OL_NE)=nomfic(9);
      rinf2OL_moy(rinf2OL_NES)=nomfic(10);

%ECART
      nomfic=rinf2OL_LUT_ECART;
      rinf2OL_ecart(1:6)=nomfic(2:7);
      rinf2OL_ecart(rinf2OL_NE-1)=nomfic(8);
      rinf2OL_ecart(rinf2OL_NE)=nomfic(9);
      rinf2OL_ecart(rinf2OL_NES)=nomfic(10);
  else    
  end