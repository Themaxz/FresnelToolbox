close all
clear all
clc
%variabili globali

r=.5e-2; %aperture radius
f=120e-3; %focal lenght
N=3000; %array size
lambda=633e-9;
k=(2.*pi./lambda);

%quantizzation of aperture and angle
x=linspace(-r,r,N); %space coordinates vector
dx=2.*max(x)./N; %resolution
a=(r./f); %maximum angle i.e. numerical aperture
da=a./(N./2); %elemental angle
P=makepupil(2.*r,N,r);
%phase construction
ang=linspace(-a,a,N);
Y=f./cos(a);
y=f./cos(ang);
phi=(y-f).*cos(ang);
PHI=phi.*k;
PHASE=exp(1i.*PHI);
figure, plot(PHI);
figure, plot(atan2(imag(PHASE),real(PHASE)));

%2D phase profile
[phase_x,phase_y]=meshgrid(PHI);
phase=exp(1i.*((phase_x)+(phase_y)));
phase=phase.*P.field;

u1=phase_x^2+phase_y.^2<=pi;
