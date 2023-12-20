# Calculo Octave solucion ODE
#Ej5TP7
%Consistencia:condicion necesaria y suficiente para que el metodo multipaso dado sea consistente es que se cumpla
%suma(a_j)de o a p sea = 1 y -suma(j*a_j) de 0 a p + suma(b_j) de -1 a p sea = 1.
%Orden: para que el metodo multipaso sea O(h^m) es necesario y suficiente que además de las 
%ecuaciones anteriores se verifique [suma((-j)^k*a_j) de 0 a p + suma((-j)^(k+1)*b_j)]=1
%condicion raiz: Analiza las raíces del polinomio característico 
%p(r)=r^(p+1)-suma(a_j*r^(p-j)) de 0 ap. 
%si sus raices (no necesariamente distintas) cumplen |r_i| <=1 para cada i y si todas las raices 
%con valor absoluto igual a 1 son SIMPLES, se dice que el metodo cumple con la condicion de raiz.
%Estabilidad: (a)Fuerte estables: cumplen cond. raiz y r=1 es su unica raiz con valor abs 1, (b)debil estable: cumplen
%cond. raiz. pero tienen mas de una raiz cuyo valor absoluto es igual a uno, inestable: no cumplen cond. raiz.
%metodo multipaso es estable si y solo si cumple la condicion de la raiz, si es consistente entonces sera estable si y
%solo si es convergente.
clear all
clc;clf
inter = [0,1];
h = 0.05;
L = (inter(2)-inter(1))/h;
t = linspace(inter(1),inter(2),L+1)';
format long g
% planteamos el PVI
f = @(t,y) t*exp(3*t) - 2*y;
y0 = 0; # valor inicial
%============================================================
# Solución analitica o Exacta
fex=@(t) (t.*exp(3*t))/5 - (exp(3*t))/25 + (exp(-2*t))/25;
fex = fex(t);
fex21=fex(21);
disp('Valor en el punto final-Solucion Exacta:')
disp(fex21)

# graficamos la exacta
figure(1)
grid on
hold on
plot(t,fex,'k-d')
%============================================================
% Solucion numerica con RK4
[trk,yrk]=rungeKutta4(f,0,1,y0,L);

plot(trk,yrk,'b-o')
grid on
grid minor
% valor al final 
yrk21=yrk(21);
disp('Valor en el punto final-Runge Kutta4:')
disp(yrk21)

%============================================================
%[tAB, yAB] = AdamsBashford_Ord2(f,0, 1, y0, L);
%[tAB, yAB] = AdamsBashford_Ord3(f,0, 1, y0, L);
# Orden 4
%tAB, yAB] = AdamsBashford_Ord4(f,0, 1, y0, L);
%[tAM, yAM] = AdamsMoulton_Ord4(f, x0, xn, y0, N);
%============================================================
% Vamos al calculo Predictor-Corrector (AdamsBashford_Ord4 y AdamsMoulton_Ord4)
%[tPC, yPC] = Predictor_Corrector(f,0, 1, y0, L);
[tPC,yPC] = PredictorCorrectorAdams(f,0,1,y0,L);

plot(tPC,yPC,'r-*')
hold off

% valor al final 
yPC21=yPC(21);
disp('Valor en el punto final-Predictor-Corrector:')
disp(yPC21)

disp('Soluciones en el punto Final')
disp('Exacta RK4 Pred-Corrector')
Soluciones=[fex21 yrk21 yPC21]