function U=Makedgerect(dim,x,y)
%E=edge(range,pixel)
%[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim

xi=linspace(-dim./2,dim/2,x);
eta=linspace(-dim./2,dim/2,y);
dxi=dim./(x-1);
dyi=dim./(y-1);
e=zeros(x,y);
for k=1:x+1
    for h=1:y+1
        if h>=y./3 %&& k>=pixel./2
            e(k,h)=1;
        end
    end
end
figure, imagesc(xi,eta,e);%axis([-range range -range range]) ; %shows Pupil
U.field=e;
U.xi=xi;
U.dyi=dyi;
% U.XI=XI;
% U.ETA=ETA;
U.dxi=dxi;
U.DXI=dim;
            
     