s=size(DX);
H=zeros(s(1),s(2),3);
%
for k = 1:3
    switch k
        case 1
            H(:,:,k)=DX; 
        case 2
             H(:,:,k)=A;
        case 2        
            H(:,:,k)=SX; 
        end
% 	M(k) = getframe(h,gca);
end
h=plenomovie(H,3);
%mov=immovie(H,jet);