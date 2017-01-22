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
w=0.004;
m=0.5;
pixel=100;
% distance=7e-5;
lambda=633;
freq=30000;
iterations=250;
% w=1e-2;
P=Makepupil(w,2999,2e-3);
x=linspace((-w./2),(w./2),3000);
[X,Y]=meshgrid(x);
SIN=0.5+0.5.*sin(2.*pi.*freq.*X);
P.field=SIN;
% pix=round((distance./P.dxi)./2);
% P.field(1500,1500-pix)=1;
% P.field(1500,1500+pix)=1;
% fmin=4.*pi.*w.*P.dxi./(lambda.*1e-9);
fmin=240e-3;


fmicro=4e-3;
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
rayleigh2=1.22.*(500e-9).*b./(M.lens_diameter);
if def==0
    [SIN1,image1]=Pleno20_SIN(P,L,M,fmin,fmin,a,b,lambda,iterations,500,'y',freq);
else
    [PS,POINT]=Pleno20_PS(P,L,M,fmin+def,fmin,a,b,633);
end
    
    [S,rad]=LightField(SIN1.field, sqrt(M.num_lenslet));  
pitch=M.pixel.*m;
sez1=sez_rad(rad);
N=max(size(image1));
x=[(-P.dxi.*(N-1))./2:P.dxi:(P.dxi.*(N-1))./2];
NAm=M.lens_diameter./(b)
cutoff=NAm./(lambda.*1e-9);
p1=zeros(1,N);
for i=1000:2000
    
    buffer=image1(i,:);
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
saveas(figure(1),strcat(date,'image',num2str(m),'-',num2str(freq)),format);
saveas(figure(2),strcat(date,'renderfi',num2str(m),'-',num2str(freq)),format);

figure, imagesc(x,x,image1),map;
xlabel('position (m)');
ylabel('position (m)');
title('Main Lens Image');
saveas(figure(3),strcat('mainimg',num2str(freq)),'fig');
saveas(figure(3),strcat('mainimg',num2str(freq)),format);

figure, imagesc(x,x,img),map;
xlabel('position (m)');
ylabel('direction (m)');
title('rendered Image');
saveas(figure(4),strcat('renderimg',num2str(freq)),'fig');
saveas(figure(4),strcat('renderimg',num2str(freq)),format);
DATA=freq_analisys_sum1(image1,IMG,P.dxi, cutoff,m);

