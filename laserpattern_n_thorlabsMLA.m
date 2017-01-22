clear all
close all
clc

load('C:\Users\Massimo\Documents\MATLAB\thorlabs_singleML.mat')
imm = Icrop;
figure, imshow(imm,[]);

L=Makelens(5200e-6,500e-6,(146e-6)./2,2999,633);

P=Makepupil(500e-6,2999,200e-6);

P1=throughlens(P,L,633);
f=5.2e-3;
start = 5;
finish = 50;
steps = 1;
n=(finish-start)/steps;
field=zeros(3000,3000,n);
i=0;
for j=start:steps:finish
    i = i+1;
    z=f+(f*j*0.1);
    P2=AngularBLn(P1,z,633);
    field(:,:,i)=abs(P2.field);
    %figure, imagesc(P.xi,P.xi,field(:,:,i)),title(num2str(z)),colormap gray;
    Z(i)=z;
    
    mask = im2bw(field(:,:,i),graythresh(field(:,:,i)));
    stats = regionprops(mask,'all');
    Statistics(:,:,i) = stats(1,1);
    resized(:,:,i) = imresize(double(field(stats(1,1).BoundingBox(1,1):stats(1,1).BoundingBox(1,3)+stats(1,1).BoundingBox(1,1),stats(1,1).BoundingBox(1,2):stats(1,1).BoundingBox(1,4)+stats(1,1).BoundingBox(1,2),i)),[151,151]);
    figure, imshow(resized(:,:,i),[]),title(num2str(z));

    
    score1(:,:,i) = xcorr2(imm,resized(:,:,i));
    totals(i) = sum(sum(score1(:,:,i)));
end

Statistics = squeeze(Statistics);
[c,place] = max(totals);

bestCorrelation = place*(f+(f*j*0.1));