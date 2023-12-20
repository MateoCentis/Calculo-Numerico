A=[10 5 0 0;5 10 -4 0;0 -4 8 -1;0 0 -1 5];
b=[6 25 -11 -11];
x0=zeros(4,1);
omega = 1.25;
tol = 10^-5;
maxit = 500;
[xSor,itSor,r_hSor,tSor] = SOR(A,b,x0,tol,maxit,omega);
