# 3SAA — Matlab
3SAA model based on Jorge et al., 2021.
This repository provides a MATLAB implementation of the 3SAA model for the **OLCI (ESA) sensor**.  

---

## 📌 Function Overview

The main function is:

% Retrieve $$a_{nw}$$, $$bb_{p}$$, $$K_{d}$$, $$a_{ph}$$ and $$a_{dg}$$ at specific wavelength (412, 443, 490, 510, 560, 665)
```matlab
[aphy_3SAA,adg_3SAA,ANW,BBP,KD]=Run_3SAA(Rrs,asol00,[],4,1,4,0,0,[],[],[],0,[],0,[]);
```
### Main Inputs
- Rrs — Remote sensing reflectance values (n × 6 matrix) at the following wavelengths:  
  412, 443, 490, 510, 560, 665 nm.  
- muw — Solar zenith angle (ρ) in degrees (n × 1 vector).  

### Output
- $$a_{ph}$$ ($\lambda$) — Estimated aph values (n × 6 vector).  
- $$a_{dg}$$ ($\lambda$) — Estimated adg values (n × 6 vector).  
- $$a_{nw}$$ ($\lambda$) — Estimated anw values (n × 6 vector).
- $$bb_{p}$$ ($\lambda$) — Estimated bbp values (n × 6 vector). 
- $$K_{d}$$ ($\lambda$)  — Estimated Kd values (n × 6 vector).  

---

## ⚙️ Requirements

- MATLAB R2020a or newer.  

---

## ▶️ How to Run

1. Clone this repository:

```matlab   
git clone https://github.com/DanielSFJorge-LOG/3SAA
cd 3SAA
```
3. Add the folder to your MATLAB path:
```matlab
addpath(genpath('3SAA'));
```
4. Prepare your inputs:
% Example input
```matlab
Rrs = xlsread('IOCCG_dataset.xlsx','Feuil1','I2:P1501');
Rrs=Rrs(1:500,:);%Select the first 500 points with asol equal to 0
Rrs=Rrs(:,[2 3 4 5 6 8]);%Select the 6 OLCI bands used for 3SAA [412 443 490 510 560 665]
asol00(1:500)=0;

%Rrs              % Reflectance for 200 samples × 11 wavelengths
%asol00              % Solar zenith angle in degrees

```
6. Run the function:
```matlab
[aphy_3SAA,adg_3SAA,ANW,BBP,KD]=Run_3SAA(Rrs,asol00,[],4,1,4,0,0,[],[],[],0,[],0,[]);
```


## 📂 File Structure

- Run_3SAA.m  — Main function to estimate Kd values.  
- IOCCG_dataset.xlsx — Example data to test the code.  
- LUT       — Directory with all the look up tables.
- Function  — Directory with all the sub function.
---

## 📖 References

Jorge, Daniel SF, et al. "A three-step semi analytical algorithm (3SAA) for estimating inherent optical properties over oceanic, coastal, and inland waters from remote sensing reflectance." Remote Sensing of Environment 263 (2021): 112537.
https://doi.org/10.1016/j.rse.2021.112537
