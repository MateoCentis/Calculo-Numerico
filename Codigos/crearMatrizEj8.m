function [A,b,x0] = crearMatrizEj8(n)
% Ej8-TP03
% Creamos la matriz y el vector del lado derecho

A = zeros(n,n) + diag(2*[1:n],0) + diag(0.5*[3:n],-2) + diag(0.5*[1:n-2],2) + diag(0.25*[5:n],-4) + diag(0.25*[1:n-4],4);

b = pi*ones(n,1);

x0 = zeros(n,1);

endfunction
