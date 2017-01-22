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

format='png';

def=0;
w=0.005;
m=0.25;
pixel=100;
% distance=(6.9480e-5)./2;
lambda=633;

% w=1e-2;
P=Makepupil(w,3000,2e-3);
P.field = zeros(3000);

% fmin=4.*pi.*w.*P.dxi./(lambda.*1e-9);
fmin=240e-3;


fmicro=8e-3;
M=Makearray_p(fmicro,pixel,w,3000,633);

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
L=Makelens(fmin./2,w,radius,3000,633);
F1=fmin./(2.*L.radius);
rayleigh2=1.22.*(633e-9).*b./(M.lens_diameter);
P.field=zeros(3000);
distance=rayleigh2;
pix=round((distance./P.dxi)./2);
P1 = Makepupil_ray(w,3000,20e-6,rayleigh2./1.5);
P2 = Makepupil_ray(w,3000,20e-6,-rayleigh2./1.5);
P.field = P1.field+P2.field;
if def==0
    [PS,POINT]=Pleno20_PS(P,L,M,fmin,fmin,a,b,633);
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
p1 = p1./max(p1(:));
IMG=render(rad,pitch);
Mi=max(size(IMG));

img=imresize(IMG,N./Mi);
p2=zeros(1,N);
for i=1000:2000
    
    buffer=img(i,:);
    p2=p2+buffer;

end    

p2 = p2./max(p2(:));

figure, plot(x,p1,'b');
legend('image');
%legend('image');
axis([-1e-3,1e-3,0,1])
figure, plot(x,p2,'r');
legend('rendered');
axis([-1e-3,1e-3,0,1])
saveas(figure(1),strcat('image',num2str(m),'.png'),'png');
saveas(figure(2),strcat('renderfi',num2str(m),'.png'),'png');

figure, imagesc(x,x,POINT),map;
xlabel('position (m)');
ylabel('position (m)');
title(strcat('Main Lens Image, Magnification: ',num2str(m)));
axis([-1e-3,1e-3,-1e-3,1e-3])
saveas(figure(3),'mainimg','fig');
saveas(figure(3),strcat('mainimg',num2str(m),'.png'),'png');

figure, imagesc(x,x,img),map;
xlabel('position (m)');
ylabel('direction (m)');
axis([-1e-3,1e-3,-1e-3,1e-3])
title(strcat('Rendered Image, Magnification: ',num2str(m)));
saveas(figure(4),'renderimg','fig');
saveas(figure(4),strcat('renderimg',num2str(m),'.png'),'png');

