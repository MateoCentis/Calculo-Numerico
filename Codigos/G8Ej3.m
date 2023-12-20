f=@(x) [-2./x 2./x.^2 sin(log(x))./x.^2];

inter=[1 2];
yc=[1 2];%Valores iniciales en a y b
L=10;
[xd,yd]=dif_fin_dir(f,inter,yc,L);

%Calculo de la solucion exacta
c2=(1/70)*(8-12*sin(log(2))-4*cos(log(2)));
c1=11/10 - c2;
xx=linspace(1,2,L+1);
fexacta=@(x)c1.*x+(c2./x.^2)-3/10.*sin(log(x))-1/10.*cos(log(x));
fex = fexacta(xx)';

error = abs(fex-yd);
figure(1)
plot(xd,yd,'b*-');
grid on;
grid minor;
title('Solución por método de disparo');
xlabel('x');
ylabel('y');

figure(2)
plot(xd,error);
grid on;
grid minor;
title('Error disparo comparado con solución exacto');
xlabel('x');
ylabel('Orden del error');
