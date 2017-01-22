%iota = coherence./res(1);
close all
x = linspace(-w(1)./2,w(1)./2,res(1));
k = 1;
for i = 1:32
    
    %ax = axis;
    
    %h(k) = subplot(12,2,k,ax);
    figure, h(i) = imagesc(x,x,field(:,:,i)), map;
   axis([-1 1 -1 1].*1e-3);
    title(strcat('iterations = ',num2str(n(i))));
    
   str = strcat('iter',num2str(n(i)),'.eps');
    export_fig(str,'-eps','-transparent');
    
end
    
    