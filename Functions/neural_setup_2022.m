global idSEAWIFS;
global idMODIS;
global idMERIS;
global idOLCI;
global idOLCI6WL;
global path_mapping;

cd([path_mapping '\LUT'])
NBCLASSES_BB=7;
NBLO=8;
NBLO=6;
NBTHETA=3;
NBmaxRrs    =37;
NBETA       =21;
NBMUW       =8;
NBPOLYbb    =3;
NBPOLYa     =4;
NBPOLYraman =4;
INVALID_RRS =-996;

MAX_N=10;
% /* =======================================================================================================
%  * OLCI 6WL ou SeaWiFS 
%  * ======================================================================================================= */
% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 >= .85 */
% /* nombre de couches cachees - hidden layer number */
rsupSW_NC=2;
% /* nombre de donnees d entree - input data number*/
rsupSW_NE=6;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rsupSW_NC1=8;
% /* nombre de neurones de la deuxieme couche cachee */
rsupSW_NC2=6;
% /* nombre de donnees de sortie - nb output*/
rsupSW_NS=1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rsupSW_NES=7;

% /* LUTs file names */
rsupSW_LUT_POIDS=dlmread('KdOLCI_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_555_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_8_6_switch_ss_620_sup_all_muw_bis.sn','',1,0);
rsupSW_LUT_MOY=importdata( 'Moy_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_ss_620_all_muw.dat');
rsupSW_LUT_ECART=importdata( 'Ecart_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_ss_620_all_muw.dat');


% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 < .85 */
% /* nombre de couches cachees - hidden layer number */
rinfSW_NC=2;
% /* nombre de donnees d entree - input data number*/
rinfSW_NE=7;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rinfSW_NC1=9;
% /* nombre de neurones de la deuxieme couche cachee */
rinfSW_NC2=6;
% /* nombre de donnees de sortie - nb output*/
rinfSW_NS=1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rinfSW_NES=8;

% /* LUTs file names */
rinfSW_LUT_POIDS =dlmread('KdOLCI_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_670_log_Kd_lambda_merge_seuil_15_angle_ascii_9x1_hh_9_6_switch_ss_620_inf_all_muw.sn','',1,0);
rinfSW_LUT_MOY=importdata('Moy_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_ss_620_all_muw.dat');
rinfSW_LUT_ECART =importdata('Ecart_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_ss_620_all_muw.dat');

% /* =======================================================================================================
%  *  SeaWiFS  Old Kd without muw as input
%  * ======================================================================================================= */
% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 >= .85 */
% /* nombre de couches cachees - hidden layer number */
rsupSWold_N= 2;
% /* nombre de donnees d entree - input data number*/
rsupSWold_NE=5;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rsupSWold_NC1=4;
% /* nombre de neurones de la deuxieme couche cachee */
rsupSWold_NC2=4;
% /* nombre de donnees de sortie - nb output*/
rsupSWold_NS=1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rsupSWold_NES= 6;

% /* LUTs file names */
rsupSWold_LUT_POIDS=dlmread( 'KdSeaWiFS_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_555_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_4_4_publi_200715.sn','',1,0);
rsupSWold_LUT_MOY=importdata( 'Moy_KdSeaWiFS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_160715.dat');
rsupSWold_LUT_ECART =importdata( 'Ecart_KdSeaWiFS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_160715.dat');


% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 < .85 */
% /* nombre de couches cachees - hidden layer number */
rinfSWold_NC =2;
% /* nombre de donnees d entree - input data number*/
rinfSWold_NE =6;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rinfSWold_NC1 =5;
% /* nombre de neurones de la deuxieme couche cachee */
rinfSWold_NC2 =5;
% /* nombre de donnees de sortie - nb output*/
rinfSWold_NS=1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rinfSWold_NES= 7;

% /* LUTs file names */
rinfSWold_LUT_POIDS=dlmread( 'KdSeaWiFS_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_670_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_5_5_publi_160715_ter.sn','',1,0);
rinfSWold_LUT_MOY=importdata( 'Moy_KdSeaWiFS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_160715.dat');
rinfSWold_LUT_ECART =importdata( 'Ecart_KdSeaWiFS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_160715.dat');

% /* LUTs parameters definition */

% /* =======================================================================================================
%  *  MODIS 
%  * ======================================================================================================= */
% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 >= .85 */
% /* nombre de couches cachees - hidden layer number */
rsupMO_NC =2;
% /* nombre de donnees d entree - input data number*/
rsupMO_NE= 5;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rsupMO_NC1 =5;
% /* nombre de neurones de la deuxieme couche cachee */
rsupMO_NC2= 4;
% /* nombre de donnees de sortie - nb output*/
rsupMO_NS= 1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rsupMO_NES= 6;

% /* LUTs file names */
rsupMO_LUT_POIDS=dlmread( 'KdMODIS_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_555_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_5_4_publi_CSIRO.sn','',1,0);
rsupMO_LUT_MOY=importdata( 'Moy_KdMODIS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_555_log_Kd_lambda_merge_seuil_15_ss_645_publi_sup_CSIRO.dat');
rsupMO_LUT_ECART =importdata( 'Ecart_KdMODIS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_555_log_Kd_lambda_merge_seuil_15_ss_645_publi_sup_CSIRO.dat');


% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 < .85 */
% /* nombre de couches cachees - hidden layer number */
rinfMO_NC= 2;
% /* nombre de donnees d entree - input data number*/
rinfMO_NE= 6;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rinfMO_NC1=10;
% /* nombre de neurones de la deuxieme couche cachee */
rinfMO_NC2= 7;
% /* nombre de donnees de sortie - nb output*/
rinfMO_NS= 1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rinfMO_NES= 7;

% /* LUTs file names */
rinfMO_LUT_POIDS=dlmread( 'KdMODIS_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_670_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_10_7_publi_CSIRO.sn','',1,0);
rinfMO_LUT_MOY=importdata( 'Moy_KdMODIS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_ss_645_publi_inf_CSIRO.dat');
rinfMO_LUT_ECART =importdata( 'Ecart_KdMODIS_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_ss_645_publi_inf_CSIRO.dat');

% /* LUTs parameters definition */



% /* =======================================================================================================
%  *  MERIS / OLCI old
%  * ======================================================================================================= */
% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 >= .85 */
% /* nombre de couches cachees - hidden layer number */
rsupOL_NC= 2;
% /* nombre de donnees d entree - input data number*/
rsupOL_NE =5;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rsupOL_NC1 =7;
% /* nombre de neurones de la deuxieme couche cachee */
rsupOL_NC2= 4;
% /* nombre de donnees de sortie - nb output*/
rsupOL_NS= 1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rsupOL_NES =6;

% /* LUTs file names */
rsupOL_LUT_POIDS=dlmread( 'KdOLCI_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_555_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_7_4_switch_110416.sn','',1,0);
rsupOL_LUT_MOY=importdata( 'Moy_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_ss_620.dat');
rsupOL_LUT_ECART =importdata( 'Ecart_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_ss_620.dat');


% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 < .85 */
% /* nombre de couches cachees - hidden layer number */
rinfOL_NC= 2;
% /* nombre de donnees d entree - input data number*/
rinfOL_NE= 6;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rinfOL_NC1 =5;
% /* nombre de neurones de la deuxieme couche cachee */
rinfOL_NC2= 5;
% /* nombre de donnees de sortie - nb output*/
rinfOL_NS =1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rinfOL_NES= 7;

% /* LUTs file names */
rinfOL_LUT_POIDS=dlmread( 'KdOLCI_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_670_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_5_5_switch_110416.sn','',1,0);
rinfOL_LUT_MOY=importdata( 'Moy_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_ss_620.dat');
rinfOL_LUT_ECART =importdata( 'Ecart_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_publi_ss_620.dat');
% 
% /* LUTs parameters definition */


% /* =======================================================================================================
%  *  MERIS / OLCI  version 2018
%  * ======================================================================================================= */
% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 >= .85 */
% /* nombre de couches cachees - hidden layer number */
rsup2OL_NC= 2;
% /* nombre de donnees d entree - input data number*/
rsup2OL_NE =6;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rsup2OL_NC1= 9;
% /* nombre de neurones de la deuxieme couche cachee */
rsup2OL_NC2= 6;
% /* nombre de donnees de sortie - nb output*/
rsup2OL_NS= 1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rsup2OL_NES= 7;

% /* LUTs file names */
rsup2OL_LUT_POIDS=dlmread( 'KdOLCI_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_555_log_Kd_lambda_merge_seuil_15_angle_ascii_6x1_hh_9_6_switch_620_sup_all_muw_bis.sn','',1,0);
rsup2OL_LUT_MOY=importdata( 'Moy_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_620_all_muw.dat');
rsup2OL_LUT_ECART =importdata( 'Ecart_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_620_all_muw.dat');


% /* Definition  des variables pour le reseau avec Rrs490/Rrs555 < .85 */
% /* nombre de couches cachees - hidden layer number */
rinf2OL_NC= 2;
% /* nombre de donnees d entree - input data number*/
rinf2OL_NE= 8;
% /* nombre de neurones de la premiere couche cachee - number of neuron in the first hidden layer */
rinf2OL_NC1= 10;
% /* nombre de neurones de la deuxieme couche cachee */
rinf2OL_NC2= 8;
% /* nombre de donnees de sortie - nb output*/
rinf2OL_NS= 1;
% /* nombre de neurones d'entree + sortie - nb input + nb output*/
rinf2OL_NES= 9;

% /* LUTs file names */
rinf2OL_LUT_POIDS=dlmread( 'KdOLCI_poids_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_443_to_670_log_Kd_lambda_merge_seuil_15_angle_ascii_9x1_hh_10_8_switch_620_inf_all_muw.sn','',1,0);
rinf2OL_LUT_MOY=importdata( 'Moy_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_620_all_muw.dat');
rinf2OL_LUT_ECART =importdata( 'Ecart_KdOLCI_IOCCG_NOMAD_BOUM_ss_12_COASTCOLOUR_412_to_670_log_Kd_lambda_merge_seuil_15_angle_switch_620_all_muw.dat');

% /* LUTs parameters definition */

