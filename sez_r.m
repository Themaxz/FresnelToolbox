function [sez1,sez2]=sez_r(rad)
s=size(rad);
for i=1:s(1)
    for j=1:s(3)
        sez1(j,i)=rad(i,round(s(2)./2),j,round(s(4)./2));
    end
end
for i=1:s(2)
    for j=1:s(4)
        sez2(j,i)=rad(round(s(1)./2),i,round(s(3)./2),j);
    end
end
    