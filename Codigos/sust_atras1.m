function [x] = sust_atras1(A)
  x=A(:,end);%X es el vector que contiene los valores de la última columna
  n=length(x);%definimos n por ser una variable local
  x(n)=A(n,n+1)/A(n,n);%El primero, es decir, el valor correspondiente a la última fila y columna se divide por el pivote, y se van guardando en el mismo vector.
  %Ahora se van a ir despejando y guardando los términos
  for i=n-1:-1:1%va desde n-1 es decir hasta 1 bajando de a -1.
    s=A(i,n+1);%s es el iésimo valor de la última columna
    for j=i+1:n%j va desde i+1 hasta n
      s-=A(i,j)*x(j);%Le resto a s el valor
    endfor
    x(i)=s/A(i,i);%Divido por el pivor y los voy guardando en el vector 
  endfor
