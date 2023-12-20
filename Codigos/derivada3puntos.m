function [dx, h]=derivada3puntos(f, x0, exp_min, exp_max)
 h = 10.^[exp_min:exp_max];
 dx = (f(x0+h) - f(x0-h)) ./ (2*h);
 endfunction
