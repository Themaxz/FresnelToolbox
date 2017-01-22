function IMG=integIMGvp(L,j)
s=size(L);
IMG=zeros(s(1));
for u=1:s(3)
    for v=1:s(4)
        IMG=IMG+L(:,:,u,j);
    end
end
IMG=IMG./(s(3).^2);
