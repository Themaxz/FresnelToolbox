function IMG=film(L)
s=size(L);
k=1;
IMG=zeros(s(1),s(2),s(3).*s(4));
for u=1:s(3)
    for v=1:s(4)
        IMG(:,:,k)=L(:,:,u,v);
        k=k+1;
    end
end

