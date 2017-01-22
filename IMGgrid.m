function grid=IMGgrid(res,pix)
grid=zeros(res);
for i=pix:pix:res(1)
    grid(i,:)=1;
end
for j=pix:pix:res(2)
    grid(:,j)=1;
end
