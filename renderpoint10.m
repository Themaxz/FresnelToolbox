for i = 1:5
    [S,LF] = LightField(RAW{i},sqrt(M.num_lenslet));
    IMG{i} = integIMG(LF);
    IMG1{i} = integIMG(shear_a(LF,alpha(i)));
end