function IMG=render_new(raw,P,array_size)

if size(array_size)==1
    array_size=[array_size array_size];
end
IMG=zeros(array_size.*P);
pix=round(size(raw)./array_size);
pix=max(max(pix));
t=1;

for i=1:array_size(1)-1
    s=1;
    for j=1:array_size(2)-1
       
            inf=round((pix-P)./2);
            sup=inf+P;
            sub=select_sub(raw,i,j,pix);
            sub1=sub(inf:sup-1,inf:sup-1);
                 
            IMG(t:t+P-1,s:s+P-1)=rot90(sub1,2);
%             IMG(t:t+P-1,s:s+P-1)=flipud(sub1);
           s=s+P;

        
    end
t=t+P;    
end

    
    



