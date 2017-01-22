% clear all
close all

coherence_degree=500;
iterations=150;
c=1e-7;
def=0;
w=0.005;
m=0.3;
pixel=100;
distance=(6.9480e-5)./2;
lambda=633;
% n=1;
% l=1;
res=3499;
W=c.*Zernike(n,l,res);

load lena3500pad.mat
P=Makepupil(w,res,2e-3);
P.field=padlena;


% fmin=4.*pi.*w.*P.dxi./(lambda.*1e-9);
fmin=240e-3;
fmicro=8e-3;
M=Makearray_p(fmicro,pixel,w,res,633);

switch m
    case 1
        b=2.*(M.focus);
        
    case 0.5
        
        b=(3./2).*(M.focus);
    case 0.3
        b=(4./3).*M.focus;
    case 0.25
        b=(5./4).*M.focus;
    otherwise
        error('wrong magnification input')
end
F2=b./(M.lens_diameter);
a=LensLaw(M.focus,b);
radius=fmin./(2.*F2);
L=Makelens(fmin./2,w,radius,res,633);
L.lens=L.lens.*exp(-1i.*(2.*pi./(lambda.*1e-9)).*W);
rayleigh1=1.22.*(633e-9).*fmin./(2.*L.radius);
airypixel=rayleigh1./P.dxi;
% rayleigh1=1.22.*(lambda.*1e-9).*fmin./(radius.*2);
% airypixel=rayleigh1./P.dxi;

F1=fmin./(2.*L.radius);
if def==0
    [PS,POINT]=Pleno20_LENA(P,L,M,fmin,fmin,a,b,633,iterations,coherence_degree);
else
    [PS,POINT]=Pleno20_PS(P,L,M,fmin+def,fmin,a,b,633);
end
    
    [S,rad]=LightField(PS.field, sqrt(M.num_lenslet));  
pitch=M.pixel.*m;
sez1=sez_rad(rad);
IMG=render(rad,pitch);
%  DATA=freq_analisys_sum1(POINT,IMG,P.dxi,20000,0.5);
%  raw=abs(PS.field).^2;
 raw_ab=abs(PS.field).^2;
%  load phase0.mat
save(strcat('phase_ab',num2str(n),num2str(l),'_',num2str(c),'.mat'),'P', 'POINT','raw_ab');