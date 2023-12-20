f=@(x)sin(x);
g=@(x)x-(x.^3)/6+(x.^5)/120;
figure(1)
ezplot(f,[-pi pi]);
hold on
ezplot(g,[-pi pi]);
grid on;
grid minor;