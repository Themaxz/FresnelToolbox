function IMG=render20_rect(raw,P,b,z1,pix,offset)
%IMG=render_sub(raw,P,pix); 
%this function renders a plenoptic 2.0 images from raw data in an array view
%parametrization.
if ~exist('offset')
    offset=[0 0];
end
res=(size(raw));
[Z,grid,center]=dist_grid_rect(res,pix,b,z1);
[S,num]=subimages(raw,pix,center,grid,offset); %creating stack of elemental images
% kmax=size(S,3);
inf=round((pix./2)-(P./2));
sup=inf+P-1;
k=1;
 IMG=zeros(num.*P);
res_img=(num.*P);


for i=1:P:res_img(1)
    for j=1:P:res_img(2)
        IMG(i:i+P,j:j+P)=rot90(S(inf:sup+1,inf:sup+1,k),2); %tiling subimages together
%         figure, imagesc(IMG);
            
        k=k+1;
    end
end