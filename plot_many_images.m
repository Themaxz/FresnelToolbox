pro = cell(90,1);
for i=1:90
figure, imagesc(I{i}),map, title(strcat('Pacth size is: ',num2str(i)));
pro{i} = sum(I{i},1);
%figure,plot(pro{i}), title(strcat('Pacth size is: ',num2str(i)));
end