res = [1000 2000 3000 4000 5000];
P1 = cell(1,1,5);
z = 10e-2;
time = zeros(1,5);
P2 = P1;
P3 = P1;
for i = 1:5
    tic
P = Makepupil(1e-2,res(i),1e-3);
buffer = Fresnel(P,z,633);
P1{i} = buffer.field;
time(i) = toc;
end
figure, p1 = plot(res,time), title('Computational time');
saveas(p1,'computationaltimefres.png','png');



clear P
clear buffer
Pang = P1;
timeang = zeros(1,size(res,2));
for i=1:size(res,2)
    
    tic
   P = Makepupil(1e-2,res(i),1e-3);
buffer = AngularBL(P,z,633);
Pang{i} = buffer.field;
timeang(i) = toc; 
end
figure, p2 = plot(res,timeang), title('Computational time');
saveas(p2,'computationaltimeang.png','png');

clear P
clear buffer
Pmulti = P1;
timemulti = zeros(1,size(res,2));
for i=1:size(res,2)
    tic
    P = Makepupil(1e-2,res(i),1e-3);
    buffer = Propagater(P,z,633);
    Pang{i} = buffer.field;
    timemulti(i) = toc; 
end
figure, p3 = plot(res,timemulti), title('Computational time');
saveas(p2,'computationaltimemulti.png','png');



z = [1 2 3 4 5 6 7 8 9].*10e-2;

res  = 2000;
time2 = time;
P = Makepupil(1e-2,res,1e-3);
dx = zeros(1,9);
SNR = zeros(1,size(z,2));
Psnr = cell(1,1,size(z,2));
for i = 1:9
%P = Makepupil(1e-2,res,1e-3);
buffer = Fresnel(P,z(i),633);
Psnr{i} = buffer.field;
dx(i) = buffer.dxi;
SNR(i) = 20*log( mean(buffer.field(:))./(var(buffer.field(:))));
%time2(i) = toc;
end
figure,  plot(z,SNR), title('SNR');
clear P
clear buffer
%z1 = [1 2 3 4 5 6 7 8 9].*100e-2;
z1 = linspace(10e-2,100e-2,100);

res  = 2000;
time3 = time;
P = Makepupil(1e-2,res,1e-3);
for i = 1:size(z1,2)
%P = Makepupil(1e-2,res,1e-3);
buffer = Fresnel(P,z1(i),633);
P3{i} = buffer.field;
dx1(i) = buffer.dxi;
time3(i) = toc;
end