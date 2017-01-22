function Phase=Makephase(phi,w,dim,res)
Phase=ones(res);
x=linspace(-w/2,w/2,res);
dx=w./res;
pix=dim./dx;
Phase((res/2)-(pix/2):(res/2)+(pix/2),(res/2)-(pix/2):(res/2)+(pix/2))=exp(1i.*phi);

