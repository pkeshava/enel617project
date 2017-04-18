% transisto m1 (RF)
clc
clear all

gm_1 = 14.94e-3;
gds_1 = 2.94e-3;
cgs_1 = 9.468e-15;
cgd_1 = 3.613e-15;
cds_1 = 3e-15;


% transistor m2 (LO)

gm_2 = 12.18e-3;
gds_2 = 1.38e-3;
cgs_2 = 8.75e-15;
cgd_2 = 3.216e-15;
z_l = 50;
%z_l = 1000000;
g_l = 1/z_l;

w = 2*pi*80e9;
s = 1i*w;
y_in =  s*cgs_2+gm_2+gds_2 - gds_2*(gds_2+gm_2)/(s*cgd_2+g_l+gds_2);
z_in = 1/y_in;
z_in_eff = z_in*(1/(s*cds_1))/(1/(s*cds_1)+z_in);
z_in2 = 1/(s*cgs_2+gm_2+gds_2-(gm_2+gds_2)*gds_2/(gds_2+gm_2+s*cgd_2));
y_in2 = 1/z_in2;
y_in_eff = 1/z_in_eff;

% 1 and 2 are virtually the same value

% total zin
%Ls = s*65e-12;
Ls = s*65e-12;
B = 1/Ls;
X = (s*cgs_1 + gm_1)/(s*cgs_1+gm_1+B);
Y = (gm_1*X+s*cgd_1+gds_1-gm_1)/(y_in+s*cgd_1+gds_1);

zin_t= 1/(s*cgs_1-X*s*cgs_1+s*cgd_1-Y*s*cgd_1+gds_1-Y*gds_1);

zin_t2 = 1/(s*cgs_1-s*cgs_1*(s*cgs_1+gm_1)/(s*cgs_1+B+gm_1));

cgd_1 = 0; 
gds_1 = 0;
yin = 0;
zin_t3= 1/(s*cgs_1-X*s*cgs_1+s*cgd_1-Y*s*cgd_1+gds_1-Y*gds_1);
