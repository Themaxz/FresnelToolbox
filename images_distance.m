m=.5;
%SENSOR
% res=[2748 3840]; %sensor resolution
%res=[4500 4500];

w=[3 3].*1e-3;
dx=1.7e-6; %pixel size
res=round(w./dx);
pitch=150e-6;
f_micro=5.2e-3;

% w=[4.589 6.413].*1e-3; %sensor size
% res=[2748 2748]; %sensor resolution
% dx=1.67e-6; %pixel size
% w=[4.589 4.589].*1e-3; %sensor size
% %object point 1
USAF=imread('E:\MATLAB\USAF.jpg');
USAF=rgb2gray(USAF);
USAF=im2double(USAF);
USAF=USAF./max(USAF(:));
resaf=max(size(USAF(:,1)));
USAF=USAF(1:res(1),1:res(2));
USAF=imresize(USAF,res./resaf);

% USAF=n2;
P1=Makepupil(w,res,10e-6);
P1.field=USAF;
% P1.field=zeros(res);
% P1.field(res./2+100:res./2+150,res./2+100:res./2+150)=1;

%object point 2
% P2=Makepupil(w,res,10e-6);
% P2.field=USAF;
% %P2.field(round(res(1)./2)-100:round(res(1)./2)-110,round(res(2)./2)-100:round(res(2)./2)-110)=1;
% P=Makepupil(w,res,10e-6);
% P.field=ones(res);
% %P.field=flipud(fliplr((P1.field)));

%MAIN LENS
f=60e-3; %main lens focal lenght
d1=120e-3;
d2=d1;
DZ=.6578e-3;
%P=Makepupil(w,res,10e-6);
pix=round(pitch./dx); %lenslet size in pixel
M=Makearray_p(f_micro,pix,w,res,633); %lenslet array
b=get_b(f_micro,m);%distance MLA sensor
a=LensLaw(f_micro,b);%distanc main lens image MLA
F_num=b./pitch;

lambda=633;
%MLA
MLA_w=[10 10].*1e-3;
f_micro=5.2e-3; %focal lenght
pitch=150e-6; %pitch

aperture=d2./F_num;
radius=aperture./2;
rad1=w(1);
FL=Makelens(d1,w,w(1),res,lambda);
L=Makelens(f,w,2.*radius,res,lambda);
distance=[-15 -10 -8 -6 -4 -2 -1 0 1 2 4 6 8 10 15].*DZ;
for i=1:size(distance,2);

[PW(:,:,i),image(i)]=Pleno20_SIN_FL(P1,L,FL,M,d1+distance(i),d2,a,b,lambda,500,500,0);
save('DZ_depth.mat');
end
%save(strcat('raw',num2string(i),'.mat')
% end
% [PWb,image2]=Pleno20_SIN_FL(P2,L,FL,M,d1+DZ,d2,a,b,lambda,500,500,0);
% save('target_DZ.mat');
% [PW,image3]=Pleno20_SIN_FL(P,L,FL,M,d1,d2,a,b,lambda,500,500,0);
% save('target_DZ.mat');
