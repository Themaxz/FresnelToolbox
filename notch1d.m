function r=rect(val,dim,range)
N=dim;
r=zeros(dim,1);
dx=range./dim;
x=[-(N-1).*dx./2:dx:(N-1).*dx./2];
for i=1:dim
    if abs(x(i))<=val
        r(i)=1;
    end
end




