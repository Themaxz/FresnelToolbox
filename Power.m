function a=Power(P);
[m,k]=size(P.field);
n=0;
for i=1:m
    for j=1:k
        if (P.field(i,j) ~= 0)
            n=n+(P.field(i,j)).^2;
         
        end
    end
end
a=1/(max(max(P.XI))).*n;
k=j;