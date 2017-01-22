function IMG=render20_sys3(raw,patch_size,gr,pix)
%IMG=render_sub(raw,P,pix); 
%this function renders a plenoptic 2.0 images from raw data in an array view
%parametrization.
if ~exist('offset')
    offset=[0 0];
end
res=(size(raw));

% [Z,grid,center]=dist_grid(res,pix,b,z1);
[S,num,pix]=subimages_sys(raw,pix,gr);
P=patch_size;

k=1;
%  IMG=zeros(num.*P);
% res_img=(num.*P);

res_img=[num(1) num(2)].*(P+1);
% IMG=zeros(4000);
for i=1:P+1:res_img(1)
    for j=1:P+1:res_img(2)
        if pix(k)<20
            break;
        end
        inf=round((pix(k)./2)-(P./2));
        sup=inf+P-1;
        s = S{k};
        if(size(s,1)<sup-inf)
            break;
        end
         if(size(s,2)<sup-inf)
            break;
        end
       %k;
       try
        crop = s(inf:sup, inf:sup);
        IMG(i:i+P-1,j:j+P-1)=rot90(crop,2); %tiling subimages together
%         figure, imagesc(IMG);
       catch ME
            display(strcat('inf: ', num2str(inf),' sup: ', num2str(sup), 'subimage: ', num2str(size(s))))
            inf=round((size(s,1)./2)-(P./2));
            sup=inf+P-1;
            crop = s(inf:sup, inf:sup);
            IMG(i:i+P-1,j:j+P-1)=rot90(crop,2);
            
       end
        k=k+1;
    end
end
% fig2=imagesc(raw); colormap gray;
% saveas(fig2,strcat('raw image',num2str(m),'.png'),'png');

% saveas(fig,strcat('rendered image',num2str(m),'.png'),'png');
