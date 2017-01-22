function sez1=sez_rad(rad)
s=size(rad);
for i=1:s(1)
    for j=1:s(3)
        sez1(j,i)=rad(i,round(s(2)./2),j,round(s(4)./2));
    end
end

    