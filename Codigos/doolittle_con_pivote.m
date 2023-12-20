function [M,P]=doolittle_con_pivote(M)
n = length(M); %tama�o de U
ind = [1:n]; % vector de �ndices que va de 1 a n.
for i=1:n %Recorro el vector de indices ' ind'
 [valor, p] = max(abs(M(ind(i:n),i))); ##maximo valor abs
 p += i-1;
 aux = ind(i); %guardo el vector de �ndices en el auxiliar
 ind(i) = ind(p); %modifico el vector de �dices
 ind(p) = aux;
 M(ind(i+1:n),i) = M( ind(i+1:n),i)/M( ind(i),i); %multiplicadores Mji
 %los almaceno debajo de cada pivote utilizando los �ndices
 M(ind(i+1:n),i+1:n) -= M(ind(i+1:n),i)*M( ind(i),i+1:n);
endfor
M = M(ind,:);
P = eye(n)(ind,:);
endfunction