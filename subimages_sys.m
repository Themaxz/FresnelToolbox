function [STACK num pix]=subimages_sys(raw,pix,gr)
%STACK=subimages(raw,pix,offset) creates a stack of the elemental images in
%the raw data
res=size(raw);
% remains=mod(res,pix);
% 
% num_lenslets=(res-remains)./pix;

% for i=1+offset(1):pix:res(1)-offset(1)
%     grid(i,:)=1;
% end
% 
% for j=1+offset(2):pix:res(2)-offset(2)
%     grid(:,j)=1;
% end
% pad=size(raw)-size(grid);
% g1=padarray(grid,pad,'post');
%  figure, imagesc(raw+(g1*30));
k=1;
% radius=round(pix./2);

% start=min(find(center>=0));
% finish=max(find(center<=max(res)));
x=find(gr(:,2)==1);
y=find(gr(2,:)==1);
s1=max(size(x));
s2=max(size(y));
num1=0;
num2=0;
STACK = cell(1,1,s1*s2);
for i=1:s1-1
    for j=1:s2-1
        index1=x(i);
        index2=y(j);
       pix(k) = x(i+1)-x(i);
         STACK{k}=raw(index1:index1+pix,index2:index2+pix); %#ok<AGROW>
         k=k+1;
         num1=num1+1;
        
    end
    num2=num2+1;
end
 STACK=STACK;
 num=[s1-1 s2-1];
%   num_lenslets=max(size(center))-start-(max(size(center))-finish);
%   num_lenslets=[num_lenslets num_lenslets];
% for i=1+offset(1):pix:res(1)-offset(1)-remains(1)
%     for j=1+offset(2):pix:res(2)-offset(2)-remains(2)
% 
%         STACK(:,:,k)=raw(i:i+pix-1,j:j+pix-1); %#ok<AGROW>
%     k=k+1;
%     end
% end
%     