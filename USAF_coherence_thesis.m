clear all
close all
clc
lambda=633;
iter=200;
w=[3 3].*1e-3;
dx=1.7e-6; %pixel size
res=round(w./dx);
pitch=150e-6;
f_micro=5.2e-3;
USAF=imread('E:\MATLAB\USAF.jpg');
USAF=rgb2gray(USAF);
USAF=im2double(USAF);
USAF=USAF./max(USAF(:));
resaf=max(size(USAF(:,1)));

% USAF=imread('C:\Users\Massimo\Documents\MATLAB\USAF matlab\UASF.jpg');
% USAF=rgb2gray(USAF);
% USAF=im2double(USAF);
% USAF=USAF./max(USAF(:));
% resaf=max(size(USAF(:,1)));
% %USAF=USAF(1:res(1),1:res(2));
% USAF=imresize(USAF,res);


% P=Makepupil(w,res,10e-6);
% P.field=USAF;
focal=60e-3;
aperture=2e-3;
d1=120e-3;
d2=120e-3;

f_num=d2./aperture;
FL=Makelens(d1,w,w(1),res,lambda);
L=Makelens(focal,w,aperture./2,res,lambda);
n=[200];
%coherence=[1 10 50 100 250 500];
%n=[ 60];
coherence = [5 10 50 100 250 300 500];


%n=500;
for i=1:size(coherence,2);
display(strcat('Loop ',num2str(i)));
 F3=edge_coherence(P,L,FL,d1,d2,lambda,200,coherence(i));
display('Saving...');
field(:,:,i)=F3;
save('USAF_THESIS_sources.mat');
display('Saved !');

end
matlabpool close
display('FINISHED!!! :D');



