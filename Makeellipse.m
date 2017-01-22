function [P]=Makeellipse(range,pixel,r)

%[P,xi,eta,dxi]=Makepupil(range,num_pixel,r)
%makes a Pupil function of radius r
%returns P=Pupil, xi,eta=vector of object plane, dxi=dimension of a pixel




[XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
if max(size(r))==2
    u1=(XI./r(1)).^2+(ETA./r(2)).^2<=1;
else
    u1=XI.^2+ETA.^2<=r.^2; %creates Pupil 
end
%figure, imagesc(xi,xi,u1),axis square;%axis([-range range -range range]) ; %shows Pupil
P.field=u1;

P.dxi=dxi;
P.DXI=range;
P.diameter=2*r;

