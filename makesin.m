


function [P]=makesin(range,num_pixel,freqx)

%[P]=makesin(range,num_pixel,freqx,freqy)
%makes a sinusoidal pattern

[XI,ETA,dxi]=Objectplane(range,num_pixel); %creates xi,eta and return pixel dim
%u1=XI.^2+ETA.^2<=r.^2; %creates Pupil 
u1=0.5+0.5.*sin(2.*pi.*freqx.*XI);

% figure, imagesc(xi,xi,u1),axis square; %shows Pupil

P.field=u1;
P.dxi=dxi;
P.DXI=range;
P.fx=freqx;


