function filter=Notch(resolution,frequency1,frequency2,sigma,depth)
%filter=Notch(resolution,frequency1,frequency2,sigma,depth)
%frequency 1 and 2 in pixel, position of the frequency to kill
%resolution is the dimention of the Notch filter
%sigma is the sigma of the gaussian filter to be convolved with the field
%depth is the size of the gaussian filter to be convolved with the field
if mod(depth,2)~=0
    depth=depth+1;
end
filter=zeros(resolution-depth+1);
N=resolution-depth;
filter(frequency1-(depth./2),frequency2-(depth./2))=1;
g=fspecial('gaussian',depth,sigma);
g=g./max(max(g));
M=resolution;
% filter1=conv2(filter,g);
 %keyboard
if mod(N,2)~=0
    N=N+1;
end
 if frequency1<=round(M./2)
    
    F1=filter(1:N/2,1:N/2);
    F2=fliplr(F1);
    F2=flipud(F2);
    filter(N/2+1:N,N/2+1:N)=F2;

else
   
    F3=filter(N/2:N,1:N/2);
    F4=fliplr(F3);
    F4=flipud(F4);
%      keyboard
    filter(1:N/2+1,N/2+1:N)=F4;
    
end
filter1=conv2(filter,g);
S=max(size(filter1));
for i=1:S
    for j=1:S
        if filter1(i,j)==0
            filter1(i,j)=1;
        else
            filter1(i,j)=1-filter1(i,j);
        end
    end
end
filter=filter1;
            
