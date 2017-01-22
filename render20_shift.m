function IMG=render20_shift(raw,P,pix,offset,shift_x,shift_y)
%IMG=render_sub(raw,P,pix); 
%this function renders a plenoptic 2.0 images from raw data in an array view
%parametrization.
if ~exist('offset')
    offset=[0 0];
end
[S,num]=subimages(raw,pix,offset); %creating stack of elemental images


inf=round((pix./2)-(P./2));
sup=inf+P-1;
k=1;
IMG=zeros(num.*P);
res_img=size(IMG);
%shifting of the subimages
for m=1:num(1)
    for n=1:num(2)
        FS=ft0(S(inf:sup,inf:sup,k)); %fourier transform of the elem   elemental image
        FS=FS.*exp(1i.*(shift_x(m)+shift_y(n)));
        S1(:,:,k)=ift0(FS);
        k=k+1;
    end
end
k=1;
for i=1:P:res_img(1)
    for j=1:P:res_img(2)
        
        
        
        IMG(i:i+P-1,j:j+P-1)=rot90(S1(:,:,k),2); %tiling subimages together
%         figure, imagesc(IMG);
        k=k+1;
    end
end