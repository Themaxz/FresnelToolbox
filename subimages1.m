function [STACK,num_lenslets]=subimages1(raw,pix,center,grid,offset)
%STACK=subimages(raw,pix,offset) creates a stack of the elemental images in
%the raw data
res=size(raw);
remains=mod(res,pix);

num_lenslets1=(res-remains)./pix;
if ~exist('offset') %#ok<EXIST>
        offset=[0 0];
end
% for i=1+offset(1):pix:res(1)-offset(1)
%     grid(i,:)=1;
% end
% 
% for j=1+offset(2):pix:res(2)-offset(2)
%     grid(:,j)=1;
% end
pad=size(raw)-size(grid);
g1=padarray(grid,pad,'post');
 figure, imagesc(raw+(g1*30));
k=1;
radius=round(pix./2);
start=min(find(center>=0));
finish=max(find(center<=4500));

for i=1:finish
    for j=1:finish %#ok<BDSCI>
        if i<start || j<start
            STACK(:,:,k)=zeros(pix); %#ok<AGROW>
            k=k+1;
        else
                            
        index1=center(i);
        index2=center(j);
       
         STACK(:,:,k)=raw(index1-radius+1:index1+radius,index2-radius+1:index2+radius); %#ok<AGROW>
         
         
         k=k+1;
        end
    end
end
for i=finish:num_lenslets1
    for j=finish:num_lenslets1
        
            STACK(:,:,k)=zeros(pix);
    end
end
    num_lenslets=max(size(center))-start-(max(size(center))-finish);
  num_lenslets=[num_lenslets num_lenslets];
% for i=1+offset(1):pix:res(1)-offset(1)-remains(1)
%     for j=1+offset(2):pix:res(2)-offset(2)-remains(2)
% 
%         STACK(:,:,k)=raw(i:i+pix-1,j:j+pix-1); %#ok<AGROW>
%     k=k+1;
%     end
% end
%     