function xi=coord(dim,dx)
DX=dim.*dx;
xi=linspace(-DX./2,DX./2,dim);
