function IMG1=filter_IMG(IMG,IMGref,N,sigma)
%evaluation of artifacts frequency
res=size(IMGref);
fIMG=ft0(IMGref);
g=fspecial('gaussian',res,10);
g=g./max(max(g));
buffer=abs(fIMG);
buffer=buffer./max(max(buffer));
buffer=buffer.*(1-g);
buffer=buffer./max(max(buffer));

[i,j]=find(buffer>0);

fIMG=ft0(IMG);
fIMG(i,j)=0;
IMG1=abs(ift0(fIMG));
% K=res-N;
% i=round(i-(N./2));
% j=round(j-(N./2));
% 
% filter=zeros(K+1);
% filter(i,j)=1;
% g=fspecial('gaussian',N,sigma);
% g=g./max(max(g));
% filter=conv2(g,filter);
% filter=filter./max(max(filter));
% g=fspecial('gaussian',res,10);
% g=g./max(max(g));
% filter=filter.*(1-g);
% 
% 
% fIMG=ft0(IMG);
% fIMG+
% 
% % IMG1=abs(ift0(fIMG.*(1-filter)));
