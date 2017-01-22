clear all
close all
clc
% load('E:\point ab\1e-05pointsource0.251e-0720.mat');
load('C:\Users\Massimo\Documents\MATLAB\loremab1e-0700.mat')
raw1=LIa.field;
load('C:\Users\Massimo\Documents\MATLAB\loremab1e-0720.mat')
raw2=LIa.field;
[Z,gr,center1]=dist_grid_rect(res,pix,b,z1);
[S,num]=subimages_sys(raw,pix,gr);
v=(-((num(1)-1)*pitch./2):pitch:((num(1)-1)*pitch./2));

figure, imagesc(v,v,raw1), colormap gray;
axis square;
title('Non aberrated raw image');
axis([-5 5 -5 5].*1e-4);

%set(ax,'XTick',tick,'YTick',tick);

export_fig 'E:\figures\raw5' '-png' '-transparent'
export_fig 'E:\figures\raw5' '-eps' '-transparent'

figure, imagesc(v,v,raw2), colormap gray;
axis square;
title(strcat('Aberrated raw image n=',num2str(n),' m=',num2str(l)));
axis([-5 5 -5 5].*1e-4);

export_fig 'E:\figures\raw205' '-png' '-transparent'
export_fig 'E:\figures\raw205' '-eps' '-transparent'
