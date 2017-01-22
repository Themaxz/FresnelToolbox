grid95
I = cell(21,1,1);
for i = 1:21
    I{i} = render20_sys3(field(:,:,i),patchsize(i),grid,93);
end
