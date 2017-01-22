clear all
close all
%loading parameters and image to filter

load('C:\Users\Massimo\Documents\MATLAB\loremab1e-0700.mat')
%loading white image
load PW05
%rendering images
[Z,gr,center1]=dist_grid_rect(res,pix,b,z1);
IMG=render20_sys(LIa.field,m,gr,pix);
img1=render20_sys(raw,m,gr,pix);

fimg=ft0(IMG);
filter=abs(ft0(img1));
filter=-filter;
filter=filter-min(filter(:));
filter=filter./max(filter(:));
filterbin=im2bw(filter,.95);
fimg1=filterbin.*fimg;
IMG1=abs(ift0(filterbin.*fimg));
