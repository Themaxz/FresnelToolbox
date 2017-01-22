function [S,L]=LightField2(U,num_microlens)
dim=max(size(U));
passo=round(dim./num_microlens);
k=1;
S=zeros(passo-1,passo-1,(num_microlens.^2));
% %keyboard
% U=zeros(passo+1,1);
% V=zeros(1,passo+1);

h=1;
for i=1:passo:dim-1
    
    for j=1:passo:dim-1
%         keyboard
        
        S(:,:,k)=U(i:i+passo-2,j:j+passo-2);
       
       s=floor(i./passo)+1;
       t=floor(j./passo)+1;
       
       for u=1:passo-1
           
           for v=1:passo-1
               
               L(s,t,u,v)=S(u,v,k);
               
           end
       end
       if k<num_microlens.^2
            k=k+1;
        end
    end
end

        
