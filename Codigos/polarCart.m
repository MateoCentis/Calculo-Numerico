function[x,y] = polarCart(r,t)
%Conversion de coordenadas polares a cartesianas
x=r*cos(t)
y=r*sent(t)
endfunction
