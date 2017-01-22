function IMG=viewpoint(L,u,v)
s=size(L);
IMG=zeros(s(1));

IMG=L(:,:,u,v);
    

