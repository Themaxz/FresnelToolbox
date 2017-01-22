 function [Z,grid,center]=dist_grid_rect(res,pix,b,z1)
if numel(res)==1
    res=[res res];
end
 num=ceil(res./pix); %number of lenslets
os=pix./2;
nx=[-(pix*(num(1)./2)):pix:pix*(num(1)./2)];
ny=[-(pix*(num(2)./2)):pix:pix*(num(2)./2)];

indexx=nx+(res(1)./2);
indexy=ny+(res(2)./2);
n1x=round(nx.*(b./z1));
n1y=round(ny.*(b./z1));
centerx=n1x+indexx;
centery=n1y+indexy;
% pad=max(max(center))-res;

% pad=max(max(center))-res;
Z=zeros(res);
% dist=pad;
grid=zeros(res);
startx=min(find(centerx>=0));
finishx=max(find(centerx<=res(1)));
starty=min(find(centery>=0));
finishy=max(find(centery<=res(2)));

% edgesx=round(centerx+pix./2);
% edgesy=round(centery+pix./2);

for i=startx:finishx
    for j=starty:finishy
        index1=round(centerx(i));
        index2=round(centery(j));
        Z(index1,index2)=1;
%         index3=edgesy(j);
        grid(:,index2)=1; %#ok<AGROW>
    end
%     index4=edgesx(i);
    grid(index1,:)=1; %#ok<AGROW>
end
grid=grid(1:res(1),1:res(2));
center=[centerx centery];
%  Z1=padarray(Z,[93 93],'post');
% minimask=Makepupil(150e-6,90,75e-6);
% minimask=double(minimask.field);
% MASK=conv2(Z1,minimask);
% for j=start+45:finish
% Z(:,center(j))=1;
% end