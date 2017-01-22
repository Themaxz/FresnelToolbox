function Phase=Makephase_circle(phi,w,dim,res)
P=Makepupil(w,res+1,dim);
% x=linspace(-w/2,w/2,res);
% dx=w./res;
% pix=dim./dx;
% Phase((res/2)-(pix/2):(res/2)+(pix/2),(res/2)-(pix/2):(res/2)+(pix/2))=exp(1i.*phi);

P.field=P.field.*exp(1i.*phi);
for i=1:res
    for j=1:res

        
        if abs(P.field(i,j))==0
    
            P.field(i,j)=1;

        end
        
    end
end

% P.field=P.field./max(max(P.field));
Phase=P.field;