%n = [1 5 20 50 100 200 300 500];
x = linspace(-w(1)./2,w(1)./2,res(1));
[X,Y] = meshgrid(x);
SNR = zeros(6,1);
noise = zeros(6,1);
signal = zeros(6,1);
upper = round(res./2+500);
lower = round(res./2-500);
for i = 1:size(n,2)
  %  I{i} = render20_sys3(field(:,:,13),i,grid,93);
  image = field(lower:upper,lower:upper,i);
%   figure,h =  imagesc(x,x,image);
%   map, title(strcat('Number of iterations: ',num2str(n(i))));
%   saveas(h,strcat('tUSAF param',num2str((n(i)))),'png');
  noise(i,1)=std(image(:));
  signal(i,1)=mean(image(:));
  SNR (i,1) = 20.*log(signal(i,1)./noise(i,1));
  if (i>5)
     V(i-5) = var(SNR(i-5:i)); 
     if (V(i-5)>0.01)
         line = i;
        %continue
     end
  end
end
%figure,pl =  plot(n,SNR,'*');
%title('SNR(dB) vs Number of Sources');
%hold on
% p0 = polyfit(n,SNR',8);
% p1 = polyval(p0,n);
% plot(n,p1,'r');
% hold off
f = fit(n',SNR,'smoothingspline');
figure,pl = plot(f,n,SNR);
y1=get(gca,'ylim');
hold on
plot([n(line) n(line)],y1);
hold off
title('SNR(dB) vs Number of Sources');
%axis([0,500,9,20])
%saveas(pl,'SNR_sources','png');
export_fig 