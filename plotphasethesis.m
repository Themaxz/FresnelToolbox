PHASE = cell(6,1,1);

x = linspace(-w(1)./2,w(1)./2,res(1));
x = meshgrid(x);
for i = 2:6
    PHASE{i} = randphase_sources(coherence(i), res(1));
    h = imagesc(x,x,atan2(imag(PHASE{i}),real(PHASE{i}))), colorbar, axis square;
    title(strcat('Number of sources: ',num2str(coherence(i))));
    saveas(h,strcat('sources ',num2str(coherence(i))),'png');
end