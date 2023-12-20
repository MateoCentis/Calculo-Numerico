function w = tDPWMinimo (A)

[L D U] = descomponerMatriz(A)

rhoTJ = max(abs(eig(-inv(D)*(L+U))));

w = 2/(1+sqrt(1-rhoTJ.^2));

endfunction

%A*b*b'