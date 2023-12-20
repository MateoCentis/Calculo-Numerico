function [dx, h]=derivada2puntos(f, x0, exp_min, exp_max)
 h = 10.^[exp_min:exp_max];
 fx0 = f(x0);
 dx = (f(x0+h) - fx0)./ h;

 endfunction
