clc
%clear all
% close all
% prompt='enter magnification:';
% m=input(prompt);
% prompt='enter subimage size:';
% pixel=input(prompt);
% prompt='enter defocus';
% def=input(prompt);
res=2000;
def=0;
% w=0.005;
%m=[0.1 0.25 0.3 0.4 0.5];
dx=1.67e-6;
w=res.*dx;
pixel=150e-6./dx;
distance=(6.9480e-5)./2;
lambda=633;
pix = pixel;

P=Makepupil(w,res,2e-3);
P.field=zeros(res);
P.field((res/2),(res)./2)=1;
% fmin=4.*pi.*w.*P.dxi./(lambda.*1e-9);
fmin=120e-3;
fmicro=5.2e-3;
M=Makearray_p(fmicro,pixel,w,res,633);

% switch m
%     case 1
%         b=2.*(M.focus);
%         
%     case 0.5
%         
%         b=(3./2).*(M.focus);
%     case 0.3
%         b=(4./3).*M.focus;
%     case 0.25
%         b=(5./4).*M.focus;
%     otherwise
%         error('wrong magnification input')
% end
b=get_b(fmicro,m);
F2=b./(M.lens_diameter);
a=LensLaw(M.focus,b);
radius=fmin./(2.*F2);
L=Makelens(fmin./2,w,radius,res,633);
rayleigh1=1.22.*(633e-9).*fmin./(2.*L.radius);
airypixel=rayleigh1./P.dxi;
% rayleigh1=1.22.*(lambda.*1e-9).*fmin./(radius.*2);
% airypixel=rayleigh1./P.dxi;

F1=fmin./(2.*L.radius);
if def==0
    [PS,POINT]=Pleno20_PS(P,L,M,fmin,fmin,a,b,633);
else
    [PS,POINT]=Pleno20_PS(P,L,M,fmin+def,fmin,a,b,633);
end
figure, imagesc(PS.field),map;
set(gca,'yticklabel',[])
set(gca,'xticklabel',[])
raw = PS.field;
z1  = fmin;
    %[S,rad]=LightField(PS.field, sqrt(M.num_lenslet));  
%IMG=render(rad,pitch);
 %DATA=freq_analisys_sum1(POINT,IMG,P.dxi,20000,0.5);
