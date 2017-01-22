close all
k=1;
pitch=[1:1:90];
clear SNR
clear N_rms
clear s
for i=1:size(pitch,2)
    buffer=field(:,:,7);
IMG2=render20_sys3(buffer,pitch(i),grid,93);
% figure, imagesc(IMG2), map, title(num2str(i));
% figure, plot(IMG2(size(IMG2,1)./2-50:size(IMG2,1)./2+50,size(IMG2,1)./2)), title(num2str(i));
IMG=IMG2./max(IMG2(:));
IMG2=1-IMG2;
edges=size(IMG2,1)./4;
 figure, imagesc(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges)), title(num2str(pitch(i))), map;
BOX=(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges));
BOX=BOX-mean(BOX(:));
prof=sum(BOX,1);
xx=[-size(BOX,1)./2:1:(size(BOX,1)./2)-1].*dx;
%signal to noise ratio
sigma(i)=var(abs(BOX(:)));
s(i)=mean(abs(BOX(:)));

%figure, plot(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2)+10), title(num2str(i));
%figure, plot(prof), title(num2str(pitch(i)));
%spectral desity

X=ft0(BOX).*conj(ft0(BOX));
df=1./dx;
f=1./(xx);
xp(i) = libpointer('doublePtr',X);
rms(i)=(1./2*pi).*sum(X(:));
%rms noise
N_rms(i) = mean(BOX(:).^2-(mean(BOX(:))).^2); %autocorrelation of the noise
SNR(i)=20.*log(s(i)./sqrt(N_rms(i)));
Rxx0(i) = mean(BOX(:).^2);% aoutocorrelation of the signal for t=0;

%figure, plot(X), title(num2str(pitch(i)));
k=k+1;
end
% for i=1:size(pitch,2)
% IMG3=render20_sys3(PWb.field,pitch(i),grid,93);
% % figure, imagesc(IMG2), map, title(num2str(i));
% % figure, plot(IMG2(size(IMG2,1)./2-50:size(IMG2,1)./2+50,size(IMG2,1)./2)), title(num2str(i));
% IMG=IMG3./max(IMG3(:));
% IMG3=1-IMG3;
% edges=size(IMG3,1)./4;
% % figure, imagesc(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges)), title(num2str(pitch(i))), map;
% BOX=(IMG3(size(IMG3,1)./2-edges:size(IMG3,1)./2+edges,size(IMG3,1)./2-edges:size(IMG3,1)./2+edges));
% BOX=BOX-mean(BOX(:));
% prof=sum(BOX,1);
% xx=[-size(BOX,1)./2:1:(size(BOX,1)./2)-1].*dx;
% %signal to noise ratio
% sigma(i)=var(abs(BOX(:)));
% s(i)=mean(abs(BOX(:)));
% SNR1(i)=20.*log(s(i)./sqrt(sigma(i)));
% %figure, plot(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2)+10), title(num2str(i));
% %figure, plot(prof), title(num2str(pitch(i)));
% %spectral desity
% 
% X1=ft0(BOX).*conj(ft0(BOX));
% df=1./dx;
% f=1./(xx);
% xp1(i) = libpointer('doublePtr',X);
% rms1(i)=(1./2*pi).*sum(X(:));
% %rms noise
% N_rms1(i) = mean(BOX(:).^2)-(mean(BOX(:))).^2; %autocorrelation of the noise
% 
% Rxx01(i) = mean(BOX(:).^2);% aoutocorrelation of the signal for t=0;
% 
% %figure, plot(X), title(num2str(pitch(i)));
% k=k+1;
% end
% for i=1:size(pitch,2)
% IMG2=render20_sys3(PWc.field,pitch(i),grid,93);
% % figure, imagesc(IMG2), map, title(num2str(i));
% % figure, plot(IMG2(size(IMG2,1)./2-50:size(IMG2,1)./2+50,size(IMG2,1)./2)), title(num2str(i));
% IMG=IMG2./max(IMG2(:));
% IMG2=1-IMG2;
% edges=size(IMG2,1)./4;
% % figure, imagesc(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges)), title(num2str(pitch(i))), map;
% BOX=(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges));
% BOX=BOX-mean(BOX(:));
% prof=sum(BOX,1);
% xx=[-size(BOX,1)./2:1:(size(BOX,1)./2)-1].*dx;
% %signal to noise ratio
% sigma(i)=var(abs(BOX(:)));
% s(i)=mean(abs(BOX(:)));
% SNR2(i)=20.*log(s(i)./sqrt(sigma(i)));
% %figure, plot(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2)+10), title(num2str(i));
% %figure, plot(prof), title(num2str(pitch(i)));
% %spectral desity
% 
% X=ft0(BOX).*conj(ft0(BOX));
% df=1./dx;
% f=1./(xx);
% xp(i) = libpointer('doublePtr',X);
% rms(i)=(1./2*pi).*sum(X(:));
% %rms noise
% N_rms2(i) = mean(BOX(:).^2)-(mean(BOX(:))).^2; %autocorrelation of the noise
% 
% Rxx0(i) = mean(BOX(:).^2);% aoutocorrelation of the signal for t=0;
% 
% %figure, plot(X), title(num2str(pitch(i)));
% k=k+1;
% end
% for i=1:size(pitch,2)
% IMG2=render20_sys3(PWd.field,pitch(i),grid,93);
% % figure, imagesc(IMG2), map, title(num2str(i));
% % figure, plot(IMG2(size(IMG2,1)./2-50:size(IMG2,1)./2+50,size(IMG2,1)./2)), title(num2str(i));
% IMG=IMG2./max(IMG2(:));
% IMG2=1-IMG2;
% edges=size(IMG2,1)./4;
% % figure, imagesc(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges)), title(num2str(pitch(i))), map;
% BOX=(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges));
% BOX=BOX-mean(BOX(:));
% prof=sum(BOX,1);
% xx=[-size(BOX,1)./2:1:(size(BOX,1)./2)-1].*dx;
% %signal to noise ratio
% sigma(i)=var(abs(BOX(:)));
% s(i)=mean(abs(BOX(:)));
% SNR3(i)=20.*log(s(i)./sqrt(sigma(i)));
% %figure, plot(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2)+10), title(num2str(i));
% %figure, plot(prof), title(num2str(pitch(i)));
% %spectral desity
% 
% X=ft0(BOX).*conj(ft0(BOX));
% df=1./dx;
% f=1./(xx);
% xp(i) = libpointer('doublePtr',X);
% rms(i)=(1./2*pi).*sum(X(:));
% %rms noise
% N_rms3(i) = mean(BOX(:).^2)-(mean(BOX(:))).^2; %autocorrelation of the noise
% 
% Rxx0(i) = mean(BOX(:).^2);% aoutocorrelation of the signal for t=0;
% 
% %figure, plot(X), title(num2str(pitch(i)));
% k=k+1;
% end
% for i=1:size(pitch,2)
% IMG2=render20_sys3(PWe.field,pitch(i),grid,93);
% % figure, imagesc(IMG2), map, title(num2str(i));
% % figure, plot(IMG2(size(IMG2,1)./2-50:size(IMG2,1)./2+50,size(IMG2,1)./2)), title(num2str(i));
% IMG=IMG2./max(IMG2(:));
% IMG2=1-IMG2;
% edges=size(IMG2,1)./4;
% % figure, imagesc(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges)), title(num2str(pitch(i))), map;
% BOX=(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2-edges:size(IMG2,1)./2+edges));
% BOX=BOX-mean(BOX(:));
% prof=sum(BOX,1);
% xx=[-size(BOX,1)./2:1:(size(BOX,1)./2)-1].*dx;
% %signal to noise ratio
% sigma(i)=var(abs(BOX(:)));
% s(i)=mean(abs(BOX(:)));
% SNR4(i)=20.*log(s(i)./sqrt(sigma(i)));
% %figure, plot(IMG2(size(IMG2,1)./2-edges:size(IMG2,1)./2+edges,size(IMG2,1)./2)+10), title(num2str(i));
% %figure, plot(prof), title(num2str(pitch(i)));
% %spectral desity
% 
% X=ft0(BOX).*conj(ft0(BOX));
% df=1./dx;
% f=1./(xx);
% xp(i) = libpointer('doublePtr',X);
% rms(i)=(1./2*pi).*sum(X(:));
% %rms noise
% N_rms4(i) = mean(BOX(:).^2)-(mean(BOX(:))).^2; %autocorrelation of the noise
% 
% Rxx0(i) = mean(BOX(:).^2);% aoutocorrelation of the signal for t=0;
% 
% %figure, plot(X), title(num2str(pitch(i)));
% k=k+1;
% end
figure, plot(pitch,SNR,'*'), title('SNR (dB)');
figure, plot(pitch,N_rms./max(N_rms(:)),'b'), title('autocorrelation of the noise');


p0 = polyfit(pitch,N_rms,12);
f0 = polyval(p0,pitch);
figure, plot(pitch,f0), title('autocorrelation of the noise fit');;
hold on;
plot(pitch,N_rms);
[minimum patch] = min(f0)

% hold
% plot(pitch,N_rms1./max(N_rms1(:)),'r');
% 
% plot(pitch,N_rms2./max(N_rms2(:)),'g');
% 
% plot(pitch,N_rms3./max(N_rms3(:)),'c');
% 
% plot(pitch,N_rms4./max(N_rms4(:)),'y');
% k=1;
% [minimum(k),patch_size(k)]=min(N_rms(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms1(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms2(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms3(:));
% k=k+1;
% [minimum(k),patch_size(k)]=min(N_rms4(:));

