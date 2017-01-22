function U=plane9(range,num_pixel)
pixel=num_pixel;

[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim

u1=zeros(pixel+1);

u1(490:510,490:510)=1;%/3600;

% u1(300:435,300:435)=1;%/18225;
 %u1(800:1200,800:1200)=1;
 
 %u1(880:980,880:980)=1;

figure, imagesc(xi,xi,u1),axis square;%axis([-range range -range range]) ; %shows Pupil
U.field=u1;
U.xi=xi;
U.XI=XI;
U.ETA=ETA;
U.dxi=dxi;
U.DXI=range;
U.lens_on=0;