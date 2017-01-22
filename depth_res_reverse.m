function [dz, patchsize]=depth_res_reverse(f,f_micro,a,b,a_micro,pix)
m=[0.1:.05:1];
b_test=get_b(f_micro,m);
a_test=LensLaw(f_micro,b_test);
dz=a_test-a_micro;
blens=b+dz;
alens=lensLaw(f,blens);
dz=alens-a;
patchsize=pix.*m;



