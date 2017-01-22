clear all
close all
clc
format='png';
def=0.02;
w=0.005;
%lens

L=Makelens(120e-3,0.005,0.002,2999,633);
%microarray
M=Makearray_p(2e-3,40,0.002,2999,633);
%Airy disk dimention
[pix,lenght]=AiryPattern(M.lens_diameter,M.focus,633,M.res);
%Axial resolution
dz=(2+M.pixel).*633e-9./((2.*M.NA).^2);
z=-0.1:dz:0.1;
x=linspace(-w./2,w./2,sqrt(M.num_lenslet));
[X,Y,Z]=meshgrid(x,x,z);

%point source
P=Makepupil(w,2999,0.001);
P.field=zeros(3000);
P.field(1500,1500)=1;
 
%propagation distances
z1=L.focal.*2;
z2=z1;
 z1=z1+def;
z3=M.focus;
dx=M.res;
dp=M.NA./M.pixel;

%Fresnel propagation
P1=AngularBL(P,z1,633);
P2=throughlens(P1,L,633);
P3=AngularBL(P2,z2,633);
image=abs(P3.field).^2;
P3.field=P3.field.*M.field;
P4=AngularBL(P3,z3,633);
raw=abs(P4.field).^2;

%Light Field
[S,rad]=LightField(raw,sqrt(M.num_lenslet));
IMG=integIMG(rad);
sez=sez_rad(rad);
pp=linspace(-L.NA./2,L.NA./2,40);
figure, imagesc(x,x,IMG),map;
xlabel('position (m)');
ylabel('position (m)');
title('Rendered Image');
saveas(figure(1),'defocused','fig');
saveas(figure(1),'defocused',format);
figure, imagesc(x,pp,sez),map;
xlabel('position (m)');
ylabel('direction (rad)');
title('Epipolar Image');
saveas(figure(2),'defocused_epi','fig');
saveas(figure(2),'defocused_epi',format);
t=get_T((z2./2),0.05);
rad1=shear2(rad,w,L.NA,t);
IMG1=integIMG(rad1);
sez1=sez_rad(rad1);
figure, imagesc(x,x,IMG1),map;
xlabel('position (m)');
ylabel('position (m)');
title('Rendered Image');
saveas(figure(3),'refocused','fig');
saveas(figure(3),'refocused',format);
figure, imagesc(x,pp,sez1),map;
xlabel('position (m)');
ylabel('direction (rad)');
title('Epipolar Image');
saveas(figure(4),'refocused_epi','fig');
saveas(figure(4),'refocused_epi',format);

% %focal stack
% MAX=max(size(z));
% N=sqrt(M.num_lenslet);
% FS=zeros(N,N,MAX);
% for i=1:MAX
%     FS(:,:,N)=integIMG(shear(
% 




 
 
 
 