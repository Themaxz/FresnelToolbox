function z=ft0(a);
% FT Fourier Transform a 2D matrix by taking fftshift before and after
% transforming and imaging the modulus of the transform

z=ifftshift(a);
z=fft2(z);
z=fftshift(z);
%figure;
%colormap(gray);
%imagesc(sqrt(z.*conj(z)));