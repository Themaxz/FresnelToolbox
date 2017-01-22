close all
clear all

lambda=633e-9;
m=[0.05:.05:1];

f=5.2e-3;
b=get_b(f,m);%distance MLA sensor
pitch=150e-6;%lenslet pitch
a=LensLaw(f,b);%distanc main lens image MLA
figure, plot(m,b,'*'),title('distance MLA - sensor vs Magnification');
xlabel('Magnification');
ylabel('distance (m)');
export_fig('MLA1.eps','-transparent','-eps');
figure, plot(m,a,'*'),title('distance main lens image - MLA vs Magnification');
xlabel('Magnification');
ylabel('distance (m)');
export_fig('MLA2.eps','-transparent','-eps');
NA=(pitch./2)./b;%numerical aperture lenslet
f_num=(b./pitch);%f munber MLA
figure, plot(m,NA,'*'),title('Numerical aperture vs magnification');
xlabel('Magnification');
ylabel('NA)');
export_fig('MLA3.eps','-transparent','-eps');
v=1./(lambda.*f_num);%cutoff frequency
figure, plot(m,v),title('cutoff frequency vs magnification');
xlabel('Magnification');
ylabel('cutoff frequency(1/m)');
export_fig('MLA4.eps','-transparent','-eps');
lat_res=(1./m).*(lambda./(2.*pi.*NA));
figure, plot(m,lat_res),title('lateral resolution vs magnification');
xlabel('Magnification');
ylabel('Resolution(m)');
export_fig('MLA5.eps','-transparent','-eps');

Airy = 2.44.*lambda.*(b./pitch);
% filename='microscope_x.xlsx';
% C=cat(2,m',a',b',NA',f_num',v');
% Db=max(b)-min(b);
% Da=max(a)-min(a);
% f_micro=5.2e-3; %focal lenght
% f_lens=60e-3;
% z1=120e-3;
% z2=120e-3;
% radius=150e-6./2;
% dx=1.67e-6; %pixel size
% [v dz volume]=minimum_depth(dx,a,b,radius,z1,z2,f_micro,f_lens);
% figure, plot(m,dz),title('axial resolution vs magnification');
%  xlswrite(filename,C);
% 
%     