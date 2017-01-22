function S=Getst(U,num_microlens)
dim=max(size(U));
passo=round(dim./num_microlens);
k=1;
S=zeros(passo+1,passo+1,(num_microlens.^2));
% %keyboard
% U=zeros(passo+1,1);
% V=zeros(1,passo+1);
for u=1:passo:dim-passo
    
    for v=1:passo:dim-passo
%         keyboard
        S(:,:,k)=U(u:u+passo,v:v+passo);
        if k<num_microlens.^2
            k=k+1;
        end
       %keyboard
    end
end
