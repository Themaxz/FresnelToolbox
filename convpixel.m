function U=convpixel(S,D)
num=size(S);

max_num=num(3);
res=sqrt(max_num);
U=zeros(res);
% keyboard
k=1;
for i=1:res
    for j=1:res
        
        U(i,j)=conv2(S(:,:,k),D);
        k=k+1;
    end
end
