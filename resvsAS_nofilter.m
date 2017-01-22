%load usaf.mat
%z = 120e-3;
w = 1e-2;
res  = [1000 1500 2000 2500 3000 3500 4000 4500 5000];
time = zeros(1,size(res,2));
Psnr = cell(1,1,size(res,2));
cutoff = zeros(1,size(res,2));
h = cell(1,size(res,2));
dx = zeros(1,size(res,2));
SNR = zeros(1,size(res,2));
for i = 1:size(res,2)
    display(strcat('iteration: ',num2str(i)));
    load usaf.mat
    scale = res(i)./2000;
    usaf = imresize(usaf,scale);
    P = Makepupil(w,res(i),1e-3);
%cutoff = w./((633e-9).*z);
dz = getzeta(P,633);
f = dz.*2;
P.field = usaf;
L = Makelens(f,w,2.5e-3,res(i),633);


z = 2.*f;
f_num = ((2.*f)./(5e-3));
%cutoff = w./((633e-9).*z);
cutoff(i) = (res(i).*P.dxi)./((633e-9).*z);
%Psnr = cell(1,1,size(z,2));
tic

[P1,b,H] = AngularBL_nofilter(P,z,633);
P2 = throughlens(P1,L,633);
[P3,b1,H1] = AngularBL_nofilter(P2,z,633);
time(i) =toc;

%dx(i) = buffer.dxi;
h{i} = atan2(imag(H(:,end./2)),real(H(:,end./2)));
field = abs(P3.field./max(P3.field(:)));
Psnr{i} = field;
noise(i) = var(abs(field(:)));
band(i) = b;
field = 1-field;

SNR(i) = 20*log( mean(abs(field(:)))./(var(abs(field(:)))));
end