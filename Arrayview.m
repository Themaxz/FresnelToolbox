function [A,sub]=Arrayview(S)
dim=size(S);

 sub=re_sort(S);
k=1;
s=size(sub);
%A=zeros(pixel);
% for j=1:dim(2)
%     A(1:s(1),1:s(2))=sub(:,:,1);
% end
for i=1:dim(1)
    for j=1:dim(2)
       
        A(i.*s(1):(i+1).*s(1)-1,j.*s(2):(j+1).*s(2)-1)=sub(:,:,k);
         k=k+1;
    end           
end
pixel=max(size(A));
A=A(s(1):pixel,s(2):pixel);