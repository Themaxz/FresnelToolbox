function [S,L]=LightField3(U,num_microlens)
dim=max(size(U));
passo=floor(dim./num_microlens);
k=1;
%S=zeros(passo,passo,(num_microlens.^2));
% %keyboard
% U=zeros(passo+1,1);
% V=zeros(1,passo+1);

% h=1;
i=1;
j=1;
while(i+passo<dim)
%         keyboard
        
        S(:,:,k)=U(i:i+passo-1,j:j+passo-1);
       
       s=floor(i./passo)+1;
       t=floor(j./passo)+1;
       i=i+passo-1;
       j=i;
       
       for u=1:passo
           
           for v=1:passo
               
               L(s,t,u,v)=S(u,v,k);
               
           end
       end
       if k<num_microlens.^2
            k=k+1;
        end
    end
end

        
