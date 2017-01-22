function sub=makestack(IMG,pix,num)
s=size(IMG);
pitch=round(pix.*num);
elements=s./pitch;
el=elements(1).*elements(2);
sub=zeros(pitch,pitch,el);
k=1;
for i=1:pitch:s(1)-pitch
    for j=1:pitch:s(2)-pitch
        sub(:,:,k)=IMG(i:i+pitch-1,j:j+pitch-1);
        k=k+1;
    end
end

        
        
        