clear all
close all
clc
% prompt='enter magnification:';
% m=input(prompt);
% prompt='enter subimage size:';
% pixel=input(prompt);
% prompt='enter defocus:';
% def=input(prompt);
% prompt='enter point sources distance: ';
% distance=input(prompt);
iterations=1;
format='bmp';

def=0;
w=0.005;
m=0.5;
pixel=100;
% distance=(6.9480e-5)./2;
lambda=633;

% w=1e-2;
P=Makepupil(w,2999,2e-3);

% fmin=4.*pi.*w.*P.dxi./(lambda.*1e-9);
fmin=240e-3;


fmicro=8e-3;
M=Makearray_p(fmicro,pixel,w,2999,633);

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
L=Makelens(fmin./2,w,radius,2999,633);
F1=fmin./(2.*L.radius);
rayleigh2=1.22.*(633e-9).*b./(M.lens_diameter);
P.field=zeros(3000);
distance=rayleigh2;
pix=round((distance./P.dxi)./2);
P.field(1500,1500-pix)=1;
P.field(1500,1500+pix)=1;
if def==0
%     [PS,POINT]=Pleno20_PS(P,L,M,fmin,fmin,a,b,633);
[PS,POINT]=Pleno20_PSinc(P,L,M,fmin,fmin,a,b,633,iterations,500,'n','none');
else
    [PS,POINT]=Pleno20_PS(P,L,M,fmin+def,fmin,a,b,633);
end
    
    [S,rad]=LightField(PS.field, sqrt(M.num_lenslet));  
pitch=M.pixel.*m;
sez1=sez_rad(rad);
N=max(size(POINT));
x=[(-P.dxi.*(N-1))./2:P.dxi:(P.dxi.*(N-1))./2];

delta=0.61.*(lambda.*1e-9).*(fmin./(L.radius.*2));
p1=zeros(1,N);
for i=1000:2000
    
    buffer=POINT(i,:);
    p1=p1+buffer;

end
IMG=render(rad,pitch);
Mi=max(size(IMG));

img=imresize(IMG,N./Mi);
p2=zeros(1,N);
for i=1000:2000
    
    buffer=img(i,:);
    p2=p2+buffer;

end    

figure, plot(x,p1,'b');
legend('image','rendered');
%legend('image');

figure, plot(x,p2,'r');
legend('image','rendered');
saveas(figure(1),strcat(date,'image',num2str(m),'-',num2str(distance)),format);
saveas(figure(2),strcat(date,'renderfi',num2str(m),'-',num2str(distance)),format);

figure, imagesc(x,x,POINT),map;
xlabel('position (m)');
ylabel('position (m)');
title('Main Lens Image');
saveas(figure(3),'mainimg','fig');
saveas(figure(3),'mainimg',format);

figure, imagesc(x,x,img),map;
xlabel('position (m)');
ylabel('direction (m)');
title('rendered Image');
saveas(figure(4),'renderimg','fig');
saveas(figure(4),'renderimg',format);

