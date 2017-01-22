function U=MakeRect(range,num_pixel)
% U=Demo(range,num_pixel)
%U.field=u1;
%U.xi=xi;
%U.XI=XI;
%U.ETA=ETA;
%U.dxi=dxi;
%U.DXI=range;

pixel=num_pixel;

[xi,XI,ETA,dxi]=Objectplane(range,pixel-1); %creates xi,eta and return pixel dim

u1=zeros(pixel);
u1(pixel./4:pixel./4.*3,pixel./4:pixel./4.*3)=1;

 
 %u1(880:980,880:980)=1;

figure, imagesc(xi,xi,u1),axis square;%axis([-range range -range range]) ; %shows Pupil
U.field=u1;
U.xi=xi;
U.XI=XI;
U.ETA=ETA;
U.dxi=dxi;
U.DXI=range;
U.lens_on=0;