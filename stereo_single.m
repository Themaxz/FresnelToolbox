function U=stereo_single(S,u,v)
%function U=stereo(S,direction)

num=size(S);


max_num=num(3);
res=sqrt(max_num);
U=zeros(res);
% keyboard

% buffer=zeros(round(num(1)./2),(num(2)./2),num(3));
    
    
  
    k=1;
    for i=1:res
        for j=1:res
        
             U(i,j)=sum(sum(S(u,v,k)));
            k=k+1;
            imagesc(U);
        end
    end
   
    
