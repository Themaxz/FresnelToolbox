clear all
close all

load('C:\Users\Massimo\Documents\MATLAB\loremab1e-0700.mat')
raw_ref=LIa.field;
clear LIa
[Z,gr,center1]=dist_grid_rect(res,pix,b,z1);
load('C:\Users\Massimo\Documents\MATLAB\loremab1e-0722.mat')
raw_ab=LIa.field;
k=1;
load filter

filterbin=im2bw(filter,.95);

vp1=linspace(-20,20,3);
vp2=vp1;

for i=1:3
    for j=1:3
    
    VP=[vp1(i) vp2(j)];
    IMGa=render20_sys_view(raw_ref,m,gr,pix,VP);
    IMGa=abs(ift0(filterbin.*ft0(IMGa)));
    imga(:,:,k)=IMGa(501:1500,501:1500);
    IMGb=render20_sys_view(raw_ab,m,gr,pix,VP);
    IMGb=abs(ift0(filterbin.*ft0(IMGb)));
    imgb(:,:,k)=IMGb(501:1500,501:1500);
    res1=size(imgb(:,:,k));
    result=abs(ift0(ft0(imga(:,:,k)).*conj(ft0(imgb(:,:,k)))));
    [a b]=find(result==max(max(result)));
    map_x(i,j)=a;
    map_y(i,j)=b;
    shift(:,k)=(res1./2)-[a b];
    k=k+1;

    end
end