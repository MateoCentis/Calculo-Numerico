f=@(t,y)-y+sin(t)+cos(t);
y0=0;
b=2;
%y(2)?.
%n=;
%euler(f,y0,b,y0,n);
ezplot(f,[0,2]);
fSol=@(x)sin(x);
figure(1)

title('Solucion del problema');

%Determinamos los subintervalos de la variable t
r=2; j=[1:6];
c=10;
L=c.*r.^(j)';
h=1/L;
N=length(L);
weuler=zeros(size(N));
W1RK2=zeros(size(N));
W2RK4=zeros(size(N));

for i=1:N
  [t,W]=euler(f,[0,2],y0,L(i));
  Weuler(i) =
endfor

format long g
Sol=[L Weuler W1RK2 W2RK4];