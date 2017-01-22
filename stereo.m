function U=stereo(S,direction)
%function U=stereo(S,direction)
%gives stereoscopic prospective. Direction:
%'l'=left
%'r'=right   
%'u'=up
%'d'=down
num=size(S);


max_num=num(3);
res=sqrt(max_num);
U=zeros(res);
% keyboard

% buffer=zeros(round(num(1)./2),(num(2)./2),num(3));
if direction=='l'
    index=round(num(2)./2);
    
  
    k=1;
    for i=1:res
        for j=1:res
        
            U(i,j)=sum(sum(S(:,1:index,k)));
            k=k+1;
            
        end
    end
   
    
end
if direction=='r'
    index=round(num(2)./2);
    
  
    k=1;
    for i=1:res
        for j=1:res
        
            U(i,j)=sum(sum(S(:,index:num(2),k)));
            k=k+1;
        end
    end
   
    
end

if direction=='u'
    index=round(num(2)./2);
    
  
    k=1;
    for i=1:res
        for j=1:res
        
            U(i,j)=sum(sum(S(1:index,:,k)));
            k=k+1;
        end
    end
   
    
end
if direction=='d'
    index=round(num(2)./2);
    
  
    k=1;
    for i=1:res
        for j=1:res
        
            U(i,j)=sum(sum(S(index:num(2),:,k)));
            k=k+1;
        end
    end
   
    
end

% U=zeros(num(1));
% for k=1:num(3)
%     U=U+S(:,:,k);
% end