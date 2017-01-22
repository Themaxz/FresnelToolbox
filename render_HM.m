close all
clear all
clc


T=.68;%treshold for the location of the grid
folder='C:\Users\Massimo\Documents\MATLAB\aberrazioni HM\-1\';
% folder='E:\calibration\';
raw_point=im2double(imread(strcat(folder,'calibration.png')));%loading calibration raw data
raw2=im2double(imread(strcat(folder,'1.png')));
%system parameters
z1=120e-3;
MLAfocal=5.2e-3;
m=.5;
b=get_b(MLAfocal,m);
dx=1.67e-6; %pixel size
%threshold
thresh=50;
os=[-22 50];
res=size(raw_point); %size raw data
pix=90; %size subimages
%find the center of the raw image
raw1=raw_point;
% raw_point=im2bw(raw_point,.4);
ref=1-raw1(1,:);
% raw_point=im2bw(raw_point,.5);
% [index1,index2]=find((raw_point(1,:)==0));
index2=find(ref>=T);
% coordinates of the estimated center
lim=max(size(index2));
k=1;
for i=1:lim-1
    comp=index2(i+1)-index2(i);
    if comp>1
        ind(k)=index2(i); %#ok<SAGROW>
         k=k+1;
    end
   
end
lim=max(size(ind));
k=1;
for i=1:lim-1
    comp=ind(i+1)-ind(i);
    if comp>=50
        ind1(k)=ind(i); %#ok<SAGROW>
         k=k+1;
    end
   
end
% gr=zeros(res(1));
 start=find(ind1>=0, 1 );
finish=find(ind1<=res(1), 1, 'last' );
% starty=min(find(centery>=0));
% finishy=max(find(centery<=res(2)))
gr=zeros(res);
for i=start:finish
    for j=start:max(size(ind1))
        index1=round(ind1(i))+os(1);
        index2=round(ind1(j))+os(2);
        gr(:,index2)=1;
    end
    gr(index1,:)=1;
end
x=find(gr(:,1)==1);
y=find(gr(1,:)==1);
sx=max(size(x));
sy=max(size(y));
k=x-(pix./2);
k2=y-(pix./2);
start1=find(k>=0, 1 );
start2=find(k2>=0, 1 );
rawn=raw1(:,1:3600);
Z=zeros(size(raw1));
for i=start1:finish
    for j=start2:max(size(y))
        index1=round(x(i))-(pix./2);
        index2=round(y(j))-(pix./2);
        Z(index1,index2)=1;
    end
%     gr(index1,:)=1;
end
IMG=render20_sys_st(raw2,m,gr,pix);

% rawn=raw1(:,1:3600);

% s1=size(index1,1);
% s2=size(index2,1);
% % index1=index1(round(s1./2));
% % index2=index2(round(s2./2));
% index1=round(mean(index1));
% index2=round(mean(index2));
% 
% 
% 
% 
% res1=2.*[index1 index2]; %define roi simmetric to thje center of the grid
% if res1(1)>=res(1)
%     res1(1)=res(1);
% end
% if res1(2)>=res(2)
%     res1(2)=res(2);
% end
% num_lenslet=(res./pix); %number of lenslet in the ROI
% %define ROI
% inf1=index1-(res1(1)/2)+1;
% sup1=index1+(res1(1)/2)-1;
% 
% inf2=index2-(res1(2)/2)+1;
% sup2=index2+(res1(2)/2)-1;
% ROI=raw1(inf1:sup1,inf2:sup2);
% 
% [Z,grid,center]=dist_grid_rect(res1-1,pix,b,z1);
% figure, imagesc(ROI+grid);
% 

