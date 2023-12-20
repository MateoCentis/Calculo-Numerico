function[x1,x2] = resolvente(vec)
a = vec(1);
b = vec(2);
c = vec(3);
disc = b^2 - 4*a*c;
if(disc > 0)
disp("Existen dos soluciones")
x1 = (-b+(b^2-disc)^1/2)/2*a;
x2 = (-b-(b^2-disc)^1/2)/2*a;
endif
if(disc == 0)
disp("Existe una única solución");
x1 = -b/2*a;
x2 = null;
endif
if(disc < 0)
disp("No existen soluciones reales");
endif
endfunction
