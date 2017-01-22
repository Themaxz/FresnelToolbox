function Y=randphase(incoherence_degree,dimension)
%Y=randphase(dim)Y=randphase(coherence_degree,dimension)
%makes a marix of random phases exp(i.*PHI)
%coherence_degree=1 coherent case
if incoherence_degree==0
    c=1;
else
    c=round(incoherence_degree.*dimension);
end
%y=ones(c);
%keyboard
PHI=rand(c).*2.*pi;
%PHI=rand(c);
% keyboard
buffer=zeros(c);
for j=1:c
    for k=1:c
        
        %buffer(j,k)=y(j,k).*exp(1i.*PHI(j,k));
         buffer(j,k)=exp(1i.*PHI(j,k));
    
    end
end
scale=dimension./c;
% keyboard
Y=imresize(buffer,scale);
Y=Y./max(max(Y));


