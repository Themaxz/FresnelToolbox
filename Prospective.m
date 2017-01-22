function [U,F]=Prospective(S)
dim=size(S);
res=sqrt(dim(3));
U=zeros(res,res,dim(1));
for h=1:(dim(1))  %#ok<BDSCA>
    k=1;
    for i=1:res
        for j=1:res
        
            U(i,j,h)=sum(sum(S(:,h,k)));
            k=k+1;
        
        end
    end
end   
for k=1:dim(1)
imagesc(U(:,:,k)),colormap jet;
F(k)=getframe;
end