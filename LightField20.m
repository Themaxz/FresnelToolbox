function [S,L]=LightField20(U,num_microlens)
dim=max(size(U));
passo=round(dim./num_microlens);
k=1;
%S=zeros(passo,passo,(num_microlens.^2));
% %keyboard
% U=zeros(passo+1,1);
% V=zeros(1,passo+1);

h=1;
for i=1:passo:dim-1
    
    for j=1:passo:dim-1
%         keyboard
        
      
       
%        s=floor(i./passo)+1;
%        t=floor(j./passo)+1;
       
%        for u=1:passo
%            
%            for v=1:passo
               
               L(i,j,:,:)=U(i:i+passo-1,j:j+passo-1);
               
%            end
%        end
       j
    end
end

        
