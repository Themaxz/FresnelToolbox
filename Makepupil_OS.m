function P=Makepupil_OS(range,pixel,r,os)

[XI,ETA,dxi]=Objectplane(range,pixel); %creates xi,eta and return pixel dim
if max(size(r))==2
    u1=((XI+os(1))./r(1)).^2+((ETA+os(2))./r(2)).^2<=1;
else
    u1=((XI+os)./r).^2+((ETA+os)./r).^2<=1;
end
P=u1;