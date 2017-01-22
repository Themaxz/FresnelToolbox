function s=re_sort(S)
%function U=stereo(S,direction)

U=size(S,1); %#ok<NASGU>
V=size(S,2);

x=size(S,3);
max_num=sqrt(size(S,3));

Q=zeros(max_num);
% keyboard
s=zeros(max_num,max_num,U.^2);
% buffer=zeros(round(num(1)./2),(num(2)./2),num(3));
    
  h=1;  
  while h~=U.^2+1
  
      for u=1:U
      
      
          for v=1:V
   
        
              for k=1:x;
                                     
                  Q(k)=S(u,v,k);
                  
               
              end
              
              s(:,:,h)=Q;
             
              h=h+1; 
          end
      end
      

     
   
  end   