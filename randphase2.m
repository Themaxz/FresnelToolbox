function Y=randphase2(incoherence_degree,dimension)
%Y=randphase(dim)Y=randphase(coherence_degree,dimension)
%makes a marix of random phases exp(i.*PHI)
%coherence_degree=1 coherent case
scaling=round(dimension./1000);

if incoherence_degree==0
    
    c=1;
else
    incoherence_degree=incoherence_degree./scaling;
    c=round(incoherence_degree.*dimension);
end
%y=ones(c);
%keyboard
PHI=rand(c);%.*2.*pi;
%PHI=rand(c);
% keyboard
%buffer=zeros(c);
scale=dimension./c;
Y=imresize(PHI,scale);
Y=Y./max(max(Y));
buffer=zeros(dimension);
PHI=Y.*2.*pi;
%keyboard

% for j=1:dimension
%     for k=1:dimension
%         
%         %buffer(j,k)=y(j,k).*exp(1i.*PHI(j,k));
%          buffer(j,k)=exp(1i.*PHI(j,k));
%     
%     end
% end
Y=exp(1i.*PHI);
% scale=dimension./c;
% % keyboard
% Y=imresize(buffer,scale);
% Y=Y./max(max(Y));


