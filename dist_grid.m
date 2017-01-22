 function [Z,grid,center]=dist_grid(res,pix,b,z1)
num=(round(res./pix)); %number of lenslets
os=pix./2;
n=[-(pix*(num./2)):pix:pix*(num./2)];
index=n+(res./2);
n1=round(n.*(b./z1));
center=n1+index;
% pad=max(max(center))-res;

pad=max(max(center))-res;
Z=zeros(res);

start=min(find(center>=0));
finish=max(find(center<=max(res)));
edges=center+(pix./2);

for i=start:finish
    for j=start:finish
        index1=center(i);
        index2=center(j);
        Z(index1,index2)=1;
        index3=edges(j);
        grid(:,index3)=1; %#ok<AGROW>
    end
    index4=edges(i);
    grid(index3,:)=1; %#ok<AGROW>
end


%  Z1=padarray(Z,[93 93],'post');
% minimask=Makepupil(150e-6,90,75e-6);
% minimask=double(minimask.field);
% MASK=conv2(Z1,minimask);
% for j=start+45:finish
% Z(:,center(j))=1;
% end