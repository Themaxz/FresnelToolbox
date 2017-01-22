function [y,k]=countvalues(a,value)
%counts the number of pixel in a vector or array equal to value
[m,k]=size(a);
n=0;
for i=1:m
    for j=1:k
        if (a(i,j) == value)
            n=n+1;
         
        end
    end
end
y=n;
k=j;
        
    