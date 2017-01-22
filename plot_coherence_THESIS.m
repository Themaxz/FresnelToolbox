close all
clear SNR
clear profile
%load EDGE_THESIS.mat
x=[-w./2:dx:w./2];
x=x(600:1200);
% edge=P.field./sum(P.field(:));
% edge=rot90(edge,2);
edge=rot90(P.field(:,round(end./2)),2);
edge=edge./sum(edge(:));
edge=edge(600:1200);
%n=[5 10 15 20 30 40 50 60 80 100 150 200 300 400 500];
%n=[5 10 15 20 30 40 50 60 80 100 150 200 300 400 500 750 1000];
%n=[5 10 15 20 30 40 50 60 80 90 100 120 150 170 200 220 250 300 320 350 400 450 500 550 650 750 850 950 1000 1100];
%n=[5 10 15 20 30 40 50 60 80 100 150 200 300 400 500 750 1000 90 120 170 220 250 320 350 450 550 650 850 950 1100];

% edge=edge(600:1200);
signal=zeros(size(n));
noise=signal;
%profile=zeros(601,size(n,2));
SNR=signal;
for i=1:size(FIELD,3)
    field1=FIELD(600:1200,600:1200,i);
    %field1=field1./max(field1(:));
    
    field1=field1./sum(field1(:));
    profile(:,i)=sum(field1(1:end,:),2);
   % profile(:,i)=profile(:,i)./sum(profile(:,i));
    %signal(i)=mean(profile(:));
    
    %field1=field1-mean(field1(:));
    buffer=profile(:,i);
    %N_rms(i) = mean(field1(:).^2)-(mean(field1(:))).^2;%autocorrelation of the noise
    signal(i)=mean(buffer(300:500));
    noise(i)=std(buffer(300:500));
    %sigma(i)=sqrt(mean(field1(:)-(s(i).^2)));
    SNR(i)=20.*log(signal(i)./noise(i)); 
   % SNR(i)=20.*log(s(i)./sigma(i)); 
%     figure, plot(sum(field(600:1200,600:1200,i),2)), title(strcat(num2str(n(i)),' iterations'));
   % figure, plot(profile(:,i)), title(strcat(num2str(n(i)),' iterations'));
end
%coherent=FIELD(:,:,1);

coherent=coherent./sum(coherent(:));
coherentp=sum(coherent(600:1200,600:1200),2)./400;
figure, plot(x,edge,'g'), legend('Edge Profile'), title('Coherent and incoherent image of an edge'); 
hold on
plot(x,2.*coherentp,'b'), legend('Coherent image');
plot(x,profile((:,end)./sum(profile(:end),2)),'r'), legend('Incoherent image');
[p0,S] = polyfit(n,SNR, 4);
[p1, delta] = polyval(p0,n, S);
s0 = fit(n',SNR','poly4');%,'Normalize','on','Robust','Bisquare');
figure, plot(n, SNR,'*'),title('SNR (dB)');
hold on
plot(s0,'r'), %axis([ 0 500 10 90]);
figure, plot(n, SNR,'*'),title('SNR (dB)');
hold on
plot(n,p1,'r'), %axis([ 0 500 10 90]);
legend('SNR','fit');
hold off
%figure, plot(n,noise,'*');
% p0 = polyfit(n,SNR,12);
% f0 = polyval(SNR,n);
% figure, plot(n,f0), title('SNR (dB)');