clc
s=zeros(100,100,36);
k=1;
for i=1:100:600
    for j=1:100:600
        s(:,:,k)=nab(i:i+99,j:j+99);
    end
    k=k+1;
end