clear all
close all
clc

%global variables
w=[4.584e-3 6.413e-3];
res=[2748 3840];
pix_size=1.67e-6;
focal=60e-3;
focal_micro=5.2e-3;
pitch=150e-6;
virtual=0;
iterations=0;
m=0.5;
b=get_b(focal_micro,m);
f_num=b./pitch;
d1=120e-3;
d2=120e-3;
aperture=d2./f_num;
lambda=633;
a=LensLaw(focal_micro,b);
offset=[200 100]; 
%lens and lenslets
pix=round(pitch./pix_size);

M=Makearray_p(focal_micro,pix,w,res,lambda);
L=Makelens(focal,w,aperture./2,res,lambda);
%object field
P=Makepupil(w,res,20e-6);
%P.field=ones(res-offset);

%propagation
[raw,IMG]=Pleno20_VL(P,L,M,d1,d2,a,b,lambda,virtual,iterations);


