function [strStack num newpix]=stretch_subimages_sys(raw,pix,gr,str)

k=1;
x=find(gr(:,1)==1);
y=find(gr(1,:)==1);
s1=max(size(x));
s2=max(size(y));
num1=0;
num2=0;
pix_=str.*pix;
STACK = zeros(str.*pix,str.*pix,s1*s2);
for i=1:s1-1
    for j=1:s2-1
        index1=x(i);
        index1_=x(i)+pix-1;
        index2=y(j);
        index2_=y(j)+pix-1;
         buffer=raw(index1:index1_,index2:index2_);
%          STACK(:,:,k)=;
         STACK(:,:,k)=imresize(buffer(end:-1:1,end:-1:1),str);   
         k=k+1;
         num1=num1+1;
        
    end
    num2=num2+1;
end
%  halfPix = round(pix_/2);
 strStack = STACK;%(end/2 -halfPix/2:end/2 +halfPix/2,end/2 -halfPix/2:end/2 +halfPix/2,:);
 newpix = size(strStack,1);
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