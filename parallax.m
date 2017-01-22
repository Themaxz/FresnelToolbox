function U=parallax(S,direction)

    
num=size(S);
if direction=='l'
    index=round(num(2)./2);
    U=zeros(num(1));
    
    for k=1:num(3)
        S(:,index:num(2),k)=0;
        U=U+S(:,:,k);
    end
end
if direction=='r'
    index=round(num(2)./2);
    U=zeros(num(1));
    
    for k=1:num(3)
        S(:,1:index,k)=0;
        U=U+S(:,:,k);
    end
end
% U=zeros(num(1));
% for k=1:num(3)
%     U=U+S(:,:,k);
% end