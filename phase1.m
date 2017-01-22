close all
% clc
% clear all
%thin lens phase
r=.5e-2;
f=120e-3;
x=linspace(-r,r,3000);
dx=max(x)./3000;
lambda=633e-9;
a=atan(x./f);
% alpha=[-(r./f):da:(r./f)];
% N=(r./f)./da;
% for i=1:n
%     xn(i)=(N.*dx)./(atan(N.*da));
% end
% da=max(alpha)./1000;
% figure, plot(x,tan(alpha));
%phase along aperture
phi=(2.*pi.*(x.*tan(a))./lambda);
%elemental phase per pixel 
dphi=(2.*pi.*(dx./tan(a))./lambda);
%aliasing limit
u=find(dphi>=pi./2);
%maximum radius
res=(x(min(u)));
%plots
figure, plot(x,(phi./pi)), title('PHI');
figure, plot(x,dphi), title('dPHI');
phase=exp(1i.*phi);
figure, plot(x,atan2(imag(phase),real(phase))), title('PHASE');
[PHASEx,PHASEy]=meshgrid(phi);
 PHASE=exp(-1i.*(PHASEx+PHASEy));
 showphase(PHASE);

