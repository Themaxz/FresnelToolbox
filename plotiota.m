iota = coherence./res(1);
x = linspace(-w(1)./2,w(1)./2,res(1));
for i = 1:8
    figure, h(i) = imagesc(x,x,field(:,:,i)), map;
    axis([-1 1 -1 1].*1e-3);
    title(strcat('\iota = ',num2str(iota(i))));
    str = strcat('iota',num2str(iota(i)),'.eps');
    export_fig(str,'-eps','-transparent');
end
    
    
    