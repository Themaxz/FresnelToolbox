function [P]=PoissonSpot(range,num_pixel,r)

%[P,xi,eta,dxi]=Makepupil(range,num_pixel,r)
%makes a Pupil function of radius r
%returns P=Pupil, xi,eta=vector of object plane, dxi=dimension of a pixel


if ~exist ('range')
    
    range=1000*1e-6;

else
    
    range=range;
end

if ~exist ('r')

    r=450*1e-6;
else
    
    r=r;

end

if ~exist ('num_pixel')
    
    pixel=1000;
else
    
    pixel=num_pixel;
end

[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
u1=XI.^2+ETA.^2>=r.^2; %creates Pupil 
figure, imagesc(xi,xi,u1),axis square;%axis([-range range -range range]) ; %shows Pupil
P.field=u1;
P.xi=xi;
P.XI=XI;
P.ETA=ETA;
P.dxi=dxi;
P.DXI=range;
P.diameter=2*r;
P.lens_on=0;
