function [P]=Makephasepupil(range,num_pixel,r,phi)

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
u1=ones(pixel);
[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
u2=XI.^2+ETA.^2<=r.^2;

for i=1:pixel
    for j=1:pixel
        if u2(i,j)==1;
        u1(i,j)=u1(i,j).*exp(1i.*phi);
        end
    end
end
%figure, imagesc(xi,xi,u1),axis square;%axis([-range range -range range]) ; %shows Pupil
P=u1;

