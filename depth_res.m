function [magnification patchsize]=depth_res(dz, f,fmicro,a,b,amicro,bmicro,dx,pix);
a1=a+dz;
b1=LensLaw(f,a1);
dz1=b+b1;
a2=amicro-dz1;
b2=LensLaw(fmicro,a2);
magnification=b2./a2;
patchsize=pix.*magnification;
figure, plot(dz,magnification);