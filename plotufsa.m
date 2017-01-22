n = [1 5 20 50 100 200 300 500];
x = linspace(-w(1)./2,w(1)./2,res(1));
[X,Y] = meshgrid(x);
SNR = zeros(6,1);
noise = zeros(6,1);
signal = zeros(6,1);
upper = round(res./2+500);
lower = round(res./2-500);
for i = 1:8
  %  I{i} = render20_sys3(field(:,:,13),i,grid,93);
  image = field(lower:upper,lower:upper,i);
  figure,h =  imagesc(x,x,image);
  map, title(strcat('Number of sources: ',num2str(coherence(i))));
  saveas(h,strcat('USAF param',num2str((coherence(i)))),'png');
  noise(i,1)=std(image(:));
  signal(i,1)=mean(image(:));
  SNR (i,1) = 20.*log(signal(i,1)./noise(i,1));
  
end
%figure,pl =  plot(n,SNR,'*');
%title('SNR(dB) vs Number of Sources');
%hold on
% p0 = polyfit(n,SNR',8);
% p1 = polyval(p0,n);
% plot(n,p1,'r');
% hold off
f = fit(coherence',SNR,'smoothingspline');
figure,pl = plot(f,coherence,SNR);
title('SNR(dB) vs Number of Sources');
axis([0,500,15,20])
saveas(pl,'SNR_sources','png');
