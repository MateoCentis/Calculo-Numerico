# Resolucion del ejercicio 9

A = [1 1+0.5e-15 3; 2 2 20; 3 6 4];
cond(A)
auxA = A;
disp("Sin pivoteo");
[L, U] = fact_doolitle(A);
(A - (L*U))

[A,L,U,P,Z,Z1] = Doolitle_p(A);

disp("Con pivoteo");

(P*auxA) - (L*U)
