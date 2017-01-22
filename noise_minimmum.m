for i=1:size(field,3)
p0 = polyfit(pitch,N_rms(i,:),12);
f0 = polyval(p0,pitch);
figure, plot(pitch,f0), title(strcat('autocorrelation of the noise fit',num2str(z(i))));
hold on;
plot(pitch,N_rms(i,:));
[minimum(i) patch1(i)] = min(f0);
end
