function H = hermit(x0,y0,dy0,x1,y1,dy1)
% para obtener los coef. de Hermite para un conjunto de múltiples
%subintervalos.
A = [x0^3 x0^2 x0 1; x1^3 x1^2 x1 1;3*x0^2 2*x0 1 0; 3*x1^2 2*x1 1 0];
b = [y0 y1 dy0 dy1]'; %
H = (A\b)'