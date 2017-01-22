function [S,L]=LightField_r(U,arraysize)
dim=(size(U));
passo=round(dim./arraysize);
k=1;
%S=zeros(passo,passo,(num_microlens.^2));
% %keyboard
% U=zeros(passo+1,1);
% V=zeros(1,passo+1);

% h=1;
for i=1:passo:dim(2)%-passo
    
    for j=1:passo:dim(1)%-passo
%         keyboard
        
        S(:,:,k)=U(i:i+passo-1,j:j+passo-1);
       
       s=round(i./passo)+1;
       t=round(j./passo)+1;
       
       for u=1:passo
           
           for v=1:passo
               
               L(s,t,u,v)=S(u,v,k);
               
           end
       end
       if k<arraysize(2)
            k=k+1;
        end
    end
end

        
