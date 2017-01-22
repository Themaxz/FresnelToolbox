close all
clear all

lambda=633e-9;
m=[0.05:.05:1];

f=5.2e-3;
b=get_b(f,m);%distance MLA sensor
pitch=150e-6;%lenslet pitch
a=LensLaw(f,b);%distanc main lens image MLA
figure, plot(m,b,'*'),title('distance MLA-sensor vs Magnification');
figure, plot(m,a,'*'),title('distance main lens image-MLA vs Magnification');
NA=(pitch./2)./b;%numerical aperture lenslet
f_num=(b./pitch);%f munber MLA
figure, plot(m,NA,'*'),title('Numerical aperture vs magnification');
v=m.*(1./(lambda.*f_num));%cutoff frequency
figure, plot(m,v,'*'),title('cutoff frequency');
xlabel('Magnification');
ylabel('Spatial frequency (1/m)');
export_fig('spatial.eps','-eps','-transparent');
lat_res=(1./m).*(lambda./(2.*NA));
figure, plot(m,lat_res,'*'),title('lateral resolution');
xlabel('Magnification');
ylabel('resolution (m)');
export_fig('res.eps','-eps','-transparent');
rayleigh2=1.22.*(633e-9).*b./pitch;
figure, plot(m,rayleigh2,'*'),title('lateral resolution');
xlabel('Magnification');
ylabel('resolution (m)');
export_fig('res.eps','-eps','-transparent');
rayleigh3=(1./m).*1.22.*(633e-9).*b./pitch;
figure, plot(m,rayleigh3,'*'),title('lateral resolution');
xlabel('Magnification');
ylabel('resolution (m)');
export_fig('res.eps','-eps','-transparent');

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