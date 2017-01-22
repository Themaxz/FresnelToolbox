function padding=GetPadding(res,zeta,lambda,dim)
padding=res.*((res.*lambda.*zeta./(dim.^2))-1);
