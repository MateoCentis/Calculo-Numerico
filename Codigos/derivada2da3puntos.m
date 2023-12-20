function [ddx, h]=derivada2da3puntos(f, x0, exp_min, exp_max)
 h = 10.^[exp_min:exp_max];
 fx0 = f(x0);
 ddx = (f(x0+h) - 2.*fx0 + f(x0-h))./ (h.^2);

 endfunction
