n = 10000;
a = zeros(1,n);
b = zeros(1,n);
t = 0;
suma = 0;
s2=  0;
tic();
for s = 1:n        
  a(s) = randi([1 10],1,1);
  b(s) = randi([1 10],1,1);
endfor 

for i=1:length(a)
  for j=1:i
    suma = suma + b(j);
  endfor      
  s2 = s2 +a(i)*suma;
  suma = 0;
endfor
t = toc;
disp('El vector de tiempo es de: \n');
disp(t);