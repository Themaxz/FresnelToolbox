function U=stereo_single1(S,x)
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
    index=round(num(2)./2);
    
  
    k=1;
    for i=1:res
        for j=1:res
        
            U(i,j)=sum(sum(S(x,:,k)));
            k=k+1;
        end
    end
   
    
