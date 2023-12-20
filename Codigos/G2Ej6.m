A1 = [8 4 1; 2 6 2; 2 4 8];
A2 = [5e-2 5.57e2 -4e-2; 1.98 1.94e2 -3e-3; 2.74e2 3.11 7.5e-2];
A3 = [1 2 -1; 2 4 0; 0 1 -1];

b = [1 2 3]';
#disp("Matriz A1");
#disp("Doolittle sin pivoteo");
auxA = A3;
#[L, U] = fact_doolitle(A3)
#y = sust_adel(L, b)
#x = sust_atras(U, y) 
#auxA - (L * U)

#disp("Doolittle con pivoteo");

[A,L,U,P,Z,Z1] = Doolitle_p(A3)

y = sust_adel(L, b)
x = sust_atras(U, y) 

(P*auxA) - (L * U)