function IMG=aperture(L,alpha)
s=size(L);
IMG=zeros(s(1));
for u=alpha:s(3)-alpha
    for v=alpha:s(4)-alpha
        IMG=IMG+L(:,:,u,v);
    end
end
IMG=IMG./(s(3).^2);
