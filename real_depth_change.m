function [dz v dzmicro numDepth volume] = real_depth_change(a,b,f,amicro,bmicro,fmicro,px,rmicro)

v = (px.*bmicro)./(rmicro-px);

dzmicro = (fmicro.*bmicro+fmicro.*v-amicro.*bmicro-v.*amicro+fmicro.*amicro)./(fmicro-v-bmicro);

dz = (f.*b+f.*dzmicro-a.*b-dzmicro.*a+f.*a)./(f-dzmicro-b);

numDepth = rmicro./px;

volume = numDepth.*dz;