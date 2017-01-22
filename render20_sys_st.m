function IMG=render20_sys_st(raw,m,gr,pix)
%IMG=render_sub(raw,P,pix); 
%this function renders a plenoptic 2.0 images from raw data in an array view
%parametrization.
if ~exist('offset')
    offset=[0 0];
end
res=max(size(raw));
P=floor(pix.*m);
% [Z,grid,center]=dist_grid(res,pix,b,z1);
[S,num, pix]=crop_subimages_sys(raw,pix,gr);
in=round((pix./2)-(P./2));
sup=in+P-1;
k=1;
%  IMG=zeros(num.*P);
% res_img=(num.*P);

res_img=[num(1) num(2)].*(P+1);
% IMG=zeros(4000);
for i=1:P+1:res_img(1)
    for j=1:P+1:res_img(2)
        IMG(i:i+P,j:j+P)=S(in:sup+1,in:sup+1,k); %tiling subimages together
%         figure, imagesc(IMG);
            
        k=k+1;
    end
end
fig2=imagesc(raw); colormap gray;
saveas(fig2,strcat('raw image',num2str(m),'.png'),'png');
fig=imagesc(IMG); colormap gray;
saveas(fig,strcat('rendered image',num2str(m),'.png'),'png');
