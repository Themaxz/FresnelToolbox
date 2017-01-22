




function [P]=sinusoide(range,pixel,freq)

%P=sinusoide(range,num_pixel,freq)
%makes a Pupil function of radius r
%returns P=Pupil, xi,eta=vector of object plane, dxi=dimension of a pixel


[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
%u1=XI.^2+ETA.^2<=r.^2; %creates Pupil 
u1=zeros(pixel+1);

yi=sin(freq.*xi);
u1=meshgrid(yi);

figure, imagesc(xi,xi,u1),axis square;%axis([-range range -range range]) ; %shows Pupil

P.field=u1;
P.xi=xi;
P.XI=XI;
P.ETA=ETA;
P.dxi=dxi;
P.DXI=range;
P.period=1/freq;
