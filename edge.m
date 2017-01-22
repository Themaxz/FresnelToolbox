function U=edge(range,pixel)
%E=edge(range,pixel)
[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
e=zeros(pixel+1);
for k=1:pixel+1
    for h=1:pixel+1
        if h>=pixel./3 %&& k>=pixel./2
            e(h,k)=1;
        end
    end
end
figure, imagesc(xi,xi,e),axis square;%axis([-range range -range range]) ; %shows Pupil
U.field=e;
U.xi=xi;
U.XI=XI;
U.ETA=ETA;
U.dxi=dxi;
U.DXI=range;
            
     