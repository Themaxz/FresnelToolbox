function U=Makedge(range,pixel)
%E=edge(range,pixel)
[xi,XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
e=zeros(pixel);
for k=1:pixel
    for h=1:pixel
        if h>=pixel./3 %&& k>=pixel./2
            e(h,k)=1;
        end
    end
end
figure, imagesc(xi,xi,e),axis square;%axis([-range range -range range]) ; %shows Pupil
U.field=e;
U.xi=xi;

U.dxi=dxi;
U.DXI=range;
            
     