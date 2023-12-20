%masa barra=> m=int_0^L{p(x).A(x)}
%p densidad, A area, x distancia y L longitud total
x=[0 200 400 600 800 1000 1200];
p=[4 3.95 3.89 3.80 3.60 3.41 3.30];
A=[100 103 106 110 120 133 149.6];
pKg = p/1000;
r = pKg.*A;
y=r;
disp('Cálculo regla trapecio');
w_trap = trapcompNew(x,y)
disp('Cálculo regla Simpson');
w_simp = SimpsonComp(x,y)
