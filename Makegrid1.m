function G=Makegrid1(pixel,n)
G=zeros(pixel);
step=round(pixel./n);
for k=1:step:pixel
          
    for j=1:step:pixel
    
            G(:,j)=1;
            
            G(:,j+1)=1;
            
    end
    G(k,:)=1;
            
            G(k+1,:)=1;
            
end
