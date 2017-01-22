function [dz,dz1,v m, shift]=depth_resolution(f,f_micro,a,b,a_micro,b_micro,pix,patchsize)
%patchsize=[1:1:pix];
m=patchsize./pix;
%m=[0.1:.05:1];
b_test=get_b(f_micro,m);
v=b_test-b_micro;
a_test=LensLaw(f_micro,b_test);
dz1=a_test-a_micro;
blens=b+dz1;
alens=lensLaw(f,blens);
dz=alens-a;
shift=round(pix./2)-patchsize;
figure, plot(shift,dz);
%patchsize=pix.*m;



