%---------------------------------------------------------------------------------------------
%a)
f=@(x)sin(pi.*x);
a=0;
b=5;
n=20;
display("f=sen(pi*x)");
res=zeros(n-1,1);
for i=1:n-1
  printf('%u',i);
  I=intNCcompuesta(f,a,b,1,i+1);
  res(i)=abs((2/pi)-I);
  printf('%s'," | ");
  printf('%f',res(i)); 
  printf('\n')
endfor
%Error
np=[2:n];
x =[1:n-1];
figure(1)
plot(np,res,'r-o','linewidth',3);
grid on
grid minor
xlabel('Nro. Puntos')
ylabel('Error absoluto')

display(" ");
display("f=1/(1+x^2)");
a2=-5;
f2=@(x)1./(1+x.^(2));
res2=zeros(n-1,1);
for i=1:n-1
  printf('%u',i);
  I=intNCcompuesta(f2,a2,b,1,i+1);
  res2(i)=abs((2*atan(5))-I);
  printf('%s'," | ");
  printf('%f',res2(i)); 
  printf('\n')
endfor
%Error 
figure(2)
plot(np,res2,'r-o','linewidth',3);
grid on
grid minor
xlabel('Nro. Puntos')
ylabel('Error absoluto')

%----------------------------------------------------------------------------------------------------
%b)
%Generacion de polinomio segun la cantidad de puntos
ptos = n;
xd = linspace(a,b,ptos);
yd = f(xd);
L=length(xd);
%for i = 1:ptos
 % xd(i) = a + h*(i-1);
 % yd(i) = f(xd(i));
%endfor

% [P, L] = PolIntLagrange(xd, yd);
% pnew = @(x) polyval(P,xd);
% xx = linspace(a,b,201);
% figure(2)
% plot(xx,f(xx),'k','linewidth',2, xx,pnew(xx),'r','linewidth',2)
%grid on
cp = polyfit(xd,yd,ptos-1);
xx = linspace(a,b,201);
pnew = polyval(cp,xx);

figure(3)
plot(xx,f(xx),'k','linewidth',2, xx,pnew,'r-o','linewidth',2)
grid on
grid minor
xlabel('Intervalo en X')
ylabel(' f(x) - p(x)')
le1=sprintf('f(x)');
le2=sprintf('Polinomio de grado: %2i',ptos-1);
legend(le1,le2)