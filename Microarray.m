function A=Microarray(dim,f,pixel_lenslet,lambda)
%
% Creates a microlens array dimension dim, 10x10 microlenses, each lenslet of focal lenght f
% diameter dim_lenslet
% lambda is in nanometers
% A=Microarray(dim,f,dim_lenslet,pixel,lambda)
%A=zeros(pixel);
lambda=lambda.*1e-9;
% num_lens=dim./dim_lenslet;
% total=num_lens.^2;
% num_lens=round(num_lens);
% pixellens=round(pixel./num_lens)
%L=zeros(dim,dim,total);
dim_lenslet=dim./10;
r=dim./2;
L=Makelenslet(f,dim_lenslet,r,pixel_lenslet,lambda);
A1=cat(1,L,L,L,L,L);  
A=cat(2,A1,A1,A1,A1,A1);
% for k=1:num_lens
% 
%     A(k+pixellens:k+2.*pixellens,k+pixellens:k+2.*pixellens)=L;
% 
% end
figure,imagesc(atan2(imag(A),real(A)));    
        
    
    
    

