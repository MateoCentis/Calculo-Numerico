%utilizar la cuad de Gauss para n=3 y comparar con Simpson para un solo intervalo.
a=0;
b=2;
n=3;
L=1;
format long
f=@(x)((2.*pi).*((20.*x)-(x.^3)./(5)).*sqrt(1+(-((3.*(x.^2))./5)+20).^2));
disp("Un solo intervalo");
printf('%s',"Cuadratura Gauss= ");
printf('%f',cuad_gauss_c(f,a,b,L,n));
disp(" ");
printf('%s',"Simpson= ");
printf('%f',intNCcompuesta(f,a,b,L,n));

disp(" ");
disp(" ");

%Luego usando trapecio y Simpson para L=5, comparando con la funcion quad().
L=5;
disp("L=5");
printf('%s',"Trapecio= ");
printf('%f',intNCcompuesta(f,a,b,L,2));
disp(" ");
printf('%s',"Simpson= ");
printf('%f',intNCcompuesta(f,a,b,L,n));
disp(" ");
printf('%s',"Función Quad= ");
printf('%f',quad(f,a,b));
disp(" ");
