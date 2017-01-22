function sez1=sez_rad20(rad,m)
s=size(rad);
pitch=s(3).*m;
inf=round(pitch.*m);
sup=inf+pitch;
for i=1:s(1)
    k=1;
    for j=inf:sup
        
        sez1(k,i)=rad(i,round(s(2)./2),j,round(s(4)./2));
        k=k+1;
    end
    
end

    