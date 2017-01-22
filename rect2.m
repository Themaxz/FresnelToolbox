function r=rect2(val,dim)
if size(val)==1
    val=[val val];
end
N=dim;
r=zeros(dim);
val=round(val./2);
r(round(end/2)-val(1):round(end/2)+val(1),round(end/2)-val(2):round(end/2)+val(2))=1;

% dx=range./dim;
% x=[-(N(2)-1).*dx(2)./2:dx(2):(N(2)-1).*dx(2)./2]; %#ok<*BDSCA,*BDSCI>
% y=[-(N(1)-1).*dx(1)./2:dx(1):(N(1)-1).*dx(1)./2];
% 
% r(abs(x)<=val(2)./2 & abs(y)<=val(1)./2) = 1;

% for i=1:dim(1)
%     
%     for j=1:dim(2)
%         
%         if abs(x(j))<=val(2)./2 && abs(y(i))<=val(1)./2
%             r(i,j)=1;
%         
%         end
%         
%     end
%     
% end


