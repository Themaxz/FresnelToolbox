function z=ift0(a);
% IFT Inverse Fourier Transform a 2D matrix by taking fftshift before and after
% transforming and imaging the real part of the resultant image

z=ifftshift(a);
z=ifft2(z);
z=fftshift(z);
%figure;
%colormap(gray);
%imagesc(abs(z));