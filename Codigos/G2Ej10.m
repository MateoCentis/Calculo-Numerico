A = [80 -50 30 0; -50 100 -10 -25; -30 -10 65 -20; 0 -25 -20 100];
b = [120 0 0 0 ];

auxA = A;

#[L, U] = fact_doolitle(A)
#y = sust_adel(L, b);
#x = sust_atras(U, y)

#(auxA - (L*U))

[A,L,U,P,Z,Z1] = Doolitle_p(A)
y = sust_adel(L, b);
x = sust_atras(U, y)

(P*auxA) - (L*U)