

r_micro=.075e-3;
b_micro=7.8e-3;
f_micro=5.2e-3;
a_micro = 15.6e-3;
b = 120e-3;
a=b;
f=60e-3;

dp=1.67e-6;
dx=[-10:10].*dp;
% v=(dx.*b_micro)./(r_micro-dx);
% %figure, plot(dx./(1.67e-6),v), title('virtual depht vs pixel shift (m)');
% b1=b_micro+v;
% a1=LensLaw(f_micro,b1);
% % figure, plot(dx,a1);
% v1 = a_micro-a1;
% b2 = b+v1;
% a2=LensLaw(f,b2);
% %figure, plot(dx,a2), title('distance of the focal planes from the main lens');
% v2= a-a2;
% %figure, plot(dx,v2), title('axial resolution');

[v z]=minumum_depth(dx,a_micro,b_micro,r_micro,a,b,f_micro,f);
%[dz v1 dzmicro numDepth volume] = real_depth_change(a,b,f,a_micro,b_micro,f_micro,dx,r_micro);
filename='virtual_depth_parameters.xlsx';
N=dx./dp;%shift in pixels
figure, plot(N,z),title('axial resolution vs pixel shift');
saveas(figure(1),'axial res line.png','png');
figure, plot(N,z,'*'),title('axial resolution vs pixel shift');
saveas(figure(2),'axial res dot.png','png');
figure, plot(N,v,'*'),title('virtual depth vs pixel shift');
saveas(figure(3),'axial res dot.png','png');
figure, plot(v,z,'*'),title('virtual depth vs ral depth');
saveas(figure(4),'axial res dot.png','png');
b_z=b_micro+z;
a_z=LensLaw(f_micro,b_z);
magnification_z=b_z./a_z;
patch_theory = magnification_z.*90;
figure, plot(z,patch_theory),title('axial resolution vs theoretical patch size');
figure, plot(z,magnification_z),title('axial resolution vs theoretical patch size');
C=cat(2,z',v',N');
xlswrite(filename,C);

