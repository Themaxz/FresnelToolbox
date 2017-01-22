function a_i = Zern_coeff(W, Z_i)
% Calculates the coefficient a_i representing the Zernike compnent Z_i in
% wavefront W. from W = SIGMA a_i * Z_i
% Usage: a_i = Zern_coeff(W, Z_i)

a_i = sum(sum(W.*Z_i)) / sum(sum(Z_i.^2));