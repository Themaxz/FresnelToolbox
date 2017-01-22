function b=get_b(f,m)
i=find(m==0);
b=m.*f.*(1+(1./m));
if i~=0
    b(i)=f;
end
