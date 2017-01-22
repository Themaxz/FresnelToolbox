function IMG=render20_mask(raw,P,pix,mask,offset)
%IMG=render_sub(raw,P,pix); 
%this function renders a plenoptic 2.0 images from raw data in an array view
%parametrization.
if ~exist('offset')
    offset=[0 0];
end
MSK=ones(1,1000);
if exist('mask') %#ok<EXIST>
    k=1;
    
    sz=size(mask);
    MSK=zeros(1,sz(1).*sz(2));
    for i=1:sz(1)
        for j=1:sz(2)
            MSK(k)=mask(i,j);
            k=k+1;
        end
    end
end
[S,num]=subimages(raw,pix,offset); %creating stack of elemental images
% kmax=size(S,3);
inf=round((pix./2)-(P./2));
sup=inf+P-1;
k=1;
IMG=zeros(num.*P);
res_img=size(IMG);
for i=1:P:res_img(1)
    for j=1:P:res_img(2)
       if MSK(k)==0
                
           IMG(i:i+P-1,j:j+P-1)=zeros(P);
      
       else
        
            IMG(i:i+P-1,j:j+P-1)=rot90(S(inf:sup,inf:sup,k),2); %tiling subimages together
%         figure, imagesc(IMG);
            
        end
        k=k+1;
    end
end