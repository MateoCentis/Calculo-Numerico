A1=[8 4 1;2 6 2;2 4 8];
A2=[5.00e-2 5.57e+2 -4.00e-2;1.98 1.94e+2 -3e-3;2.74e+2 3.11 7.50e-2];
A3=[1 2 -1;2 4 0;0 1 -1];
b=[1 2 3]';
%Cálculo sin pivote
[L,U] = doolittle_sin_pivote(A)
[L,U] = doolittle_sin_pivote(A)
[L,U] = doolittle_sin_pivote(A)
%Cálculo con pivote
[A,L1,U1,P1,Z] = Doolitle_p(A1);
[A,L2,U2,P,Z] = Doolitle_p(A2);
[A,L2,U2,P,Z] = Doolitle_p(A3); 