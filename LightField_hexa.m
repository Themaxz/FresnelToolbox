function [S,L]=LightField_hexa(U,num_microlens)
dim=max(size(U));
step=round(dim./num_microlens);
k=1;
%S=zeros(passo,passo,(num_microlens.^2));
% %keyboard
% U=zeros(passo+1,1);
% V=zeros(1,passo+1);

% h=1;
index=0;
for i=1:step:dim%-passo
    index=index+1;   
    
        if mod(index,2)==1
            
        for j=1:step:dim%-passo
%         keyboard
        
        S(:,:,k)=U(i:i+step-1,j:j+step-1);
       
       s=round(i./step)+1;
       t=round(j./step)+1;
       
       for u=1:step
           
           for v=1:step
               
               L(s,t,u,v)=S(u,v,k);
               
           end
       end
       if k<num_microlens.^2
            k=k+1;
        end
        end
        else
        for j=step./2:step:dim-step%-passo
            
             S(:,:,k)=U(i:i+step-1,j:j+step-1);
       
       s=round(i./step)+1;
       t=round(j./step)+1;
       
       for u=1:step
           
           for v=1:step
               
               L(s,t,u,v)=S(u,v,k);
               
           end
       end
       if k<num_microlens.^2
            k=k+1;
        end
        end
        end
end


        
