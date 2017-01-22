clear all
load('C:\Users\Massimo\Documents\MATLAB\lorem0.5.mat');
raw=LI.field;
z1=120e-3;
m=.5;
f=5.2e-3;
pitch=150e-6;
pix=90;
dx=1.67e-6; %pixel size
b=get_b(f,m);
res=[2748 3840]; %sensor resolution
res1=4500;
center=(floor(res1./2));
raw_r=raw(center-((res(1)-1)./2):center+((res(1)-1)./2),center-((res(2)-1)./2):center+((res(2)-1)./2));
% raw_r=raw_r(1:(res(1)-2),1:(res(2)-2));
[Z,grid,center1]=dist_grid_rect(res,pix,b,z1);
[S,num]=subimages_sys(raw_r,pix,grid);
raw_r=raw;
save reference.mat S num raw_r
clear all
close all
pitch=150e-6;
T=.68;%treshold for the location of the grid
folder='C:\Users\Massimo\Documents\MATLAB\USAF2\';
% folder='E:\calibration\';

% raw_point=im2double(imread(strcat(folder,'PW05.png')));%loading calibration raw data
raw_point=im2double(imread(strcat('C:\Users\Massimo\Documents\MATLAB\calibration\calibration05.png')));
% raw2=im2double(imread('USAFm05.png'));
%system parameters
z1=120e-3;
MLAfocal=5.2e-3;
m=.5;
b=get_b(MLAfocal,m);
dx=1.67e-6; %pixel size
%threshold
thresh=50;
os=[-33 -10];
res=size(raw_point); %size raw data
pix=90; %size subimages
%find the center of the raw image
raw1=raw_point;
% raw_point=im2bw(raw_point,.4);
ref=1-raw1(1,:);
% ref=im2bw(ref);
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
% x=find(gr(:,1)==1);
% y=find(gr(1,:)==1);
% sx=max(size(x));
% sy=max(size(y));
% k=x-(pix./2);
% k2=y-(pix./2);
% start1=find(k>=0, 1 );
% start2=find(k2>=0, 1 );
% rawn=raw1(:,1:3600);
% Z=zeros(size(raw1));
[S1,num1]=subimages_sys(raw1,pix,gr);
load('reference.mat');


threshold=10;
finish=max(size(S));
k=1;
for i=1:num1(1)-1
    for j=1:num1(2)-1
   
    index1=i;
    index2=j;
    
    result=xcorr2(S(:,:,k),S1(:,:,k));
%     pitch=w./num_lenslet;
%     dx=pitch./pix;
    shift=[-pitch:dx:pitch];
%     figure, imagesc(shift,shift,result), map;
    [a b]=find(result==max(max(result)));
    val=max(max(result));
    shift_x=b-pix-1;
    shift_y=a-pix-1;
    if val>threshold
%         lens_position_x(k)=index1;
%         lens_position_y(k)=index2;
%         x_shift(index1,index2)=shift(b); %#ok<SAGROW>
%         y_shift(index1,index2)=shift(a);
        value(k)=max(max(result));
       
        k=k+1;
        pos(k)=k;
        
        pix_x(index1,index2)=shift_x;
        pix_y(index1,index2)=shift_y;
        
%         total(index1,index2)=sqrt(shift(a).^2+shift(b).^2);
        
        value(index1,index2)=val;
%         figure, imagesc(lens_position_x,lens_position_y,map_x);
    else
        map_x(index1,index2)=0;
        map_y(index1,index2)=0;
        value(index1,index2)=0;
        pix_x(index1,index2)=0;
        pix_y(index1,index2)=0;
    end
    end
end
%shift in meters
% v=linspace(-((n-1)*pitch./2),((n-1)*pitch./2),max(size(map_x)));
vx=[pix./2:pix:((num1(1)-1)*pix)];
vy=[pix./2:pix:((num1(2)-1)*pix)];
[Vx,Vy]=meshgrid(vy,vx);
% tick=[vx(1)-(pitch./2):pitch:vx(end)-(pitch./2)];
map_x=pix_x.*dx;
map_y=pix_y.*dx;
MAP=map_x+map_y;
ax=gca;
siz=round(size(result)./2);

% pix_x=pix_x-siz(1);
% pix_y=pix_y-siz(2);
% pix_x(find(pix_x==-siz(1)))=0;
% pix_y(find(pix_y==-siz(2)))=0;
 h=quiver(Vx,Vy,pix_x,pix_y,0.5);

% set(ax,'XTick',tick,'YTick',tick);
% grid on;
figure, imagesc(map_x);
figure, imagesc(map_y);
figure, imagesc(pix_x);
figure, imagesc(pix_y);


