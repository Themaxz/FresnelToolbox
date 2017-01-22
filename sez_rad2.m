function sez1=sez_rad2(rad)
s=size(rad);
for i=1:s(1)
    for j=1:s(3)
        sez1(i,j)=rad(i,s(2)./2,j,s(4)./2);
    end
end

    