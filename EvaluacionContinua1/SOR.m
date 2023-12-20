function[x,it,r_h,t] = SOR(A,b,x0,tol,maxit,omega)
tic();
%Calculo longitud del vector b
n =length(b);
it=1;
error =1;
r_h = [];
x = x0';%Me garantizo que x sea un vector columna
while(it<maxit && error > tol)
%Aplico f�rmula
for i=1:n
  x(i) = omega*(b(i) - A(i,1:i-1)*x(1:i-1) 
  - A(i,i+1:n)*x0(i+1:n))/A(i,i)-(1-omega)*x;%Terminar la f�rmula, |El cambio esta en que ac� utilizo el vector corriente que estoy utilizando
endfor
%C�lculo error 
error = norm(x-x0,inf)/norm(x,inf);
%Truco para guardar errores
r_h = [r_h ; error];
x0 = x;
++it;
endwhile
t = toc();
endfunction
