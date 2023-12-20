clc
display(" ");
display(" ");
display(" ");
display("f(x)=sin(pi*x)")
f=@(x)sin(pi.*x);
a=0;
b=5;
printf('%s',"                    |      ");
printf('%s',"Regla de los trapecios");
printf('%s',"           |     ");
printf('%s',"Regla de Simpson");
printf('%s',"       |   ");
printf('%s',"Cuadratura Gaussiana   |\n");
display("-----------------------------------------------------------------------------------------------------------------")
printf('%s',"       ");
printf('%s',"h");
printf('%s',"      |  ");
printf('%s',"L");
printf('%s',"  |     ");
printf('%s',"Q_2");
printf('%s',"    |  ");
printf('%s',"Err_Trap");
printf('%s',"  | ");
printf('%s',"Err_TrapL/2");
printf('%s',"  |     ");
printf('%s',"Q_3");
printf('%s',"    |  ");
printf('%s',"Err_Simp");
printf('%s'," | ");
printf('%s',"Err_SimpL/2  |   ");
printf('%s',"Res   |\n");
("---------------------------------------------------------------------------------------------------")
nT=2;
nS=3;
L=2;
for n=1 : 12
  h=1/L;
  printf('%e',h);
  printf('%s',"  |  ");
  printf('%u',L);
  printf('%s',"  |  ");
  Q2=intNCcompuesta(f,a,b,L,nT);
  printf('%f',Q2);
  printf('%s',"  |  ");
  Etrap=abs(((2/pi)-Q2));
  printf('%f',Etrap);
  printf('%s'," |  ");
  L=L/2;
  if n==1
    printf('%s',"    -   ");
  else 
    Q2_2=intNCcompuesta(f,a,b,L,nT);
    Etrap2=Q2_2/Q2;  
    printf('%f',abs(Etrap2));
  endif
  printf('%s',"   | ");
  L=2*L;
  Q3=intNCcompuesta(f,a,b,L,nS);
  printf('%f',Q3);
  printf('%s',"  |  ");
  Esimp=((2/pi)-Q3);
  printf('%f',Esimp);
  printf('%s',"  |  ");
  L=L/2;
  if n==1
    printf('%s',"-");
  else 
    Q3_3=intNCcompuesta(f,a,b,L,nS);
    Etrap2=Q3_3/Q3;  
    printf('%f',Etrap2);
  endif
  printf('%s',"   |   ");
  printf('%f',cuad_gauss_c(f,a,b,L,n));
  printf('%s',"  |");
  printf('%s',"\n")
  L=L*4;
endfor

%---------------------------------------------------------------------------------------------
display(" ");
display(" ");
display(" ");
display("f(x)=1/1+x^2")
a=-5;
b=5;
f=@(x)1./(1+x.^(2));
printf('%s',"                    |      ");
printf('%s',"Regla de los trapecios");
printf('%s',"           |     ");
printf('%s',"Regla de Simpson");
printf('%s',"       |   ");
printf('%s',"Cuadratura Gaussiana   |\n");
display("-----------------------------------------------------------------------------------------------------------------")
printf('%s',"       ");
printf('%s',"h");
printf('%s',"      |  ");
printf('%s',"L");
printf('%s',"  |     ");
printf('%s',"Q_2");
printf('%s',"    |  ");
printf('%s',"Err_Trap");
printf('%s',"  | ");
printf('%s',"Err_TrapL/2");
printf('%s',"  |     ");
printf('%s',"Q_3");
printf('%s',"    |  ");
printf('%s',"Err_Simp");
printf('%s'," | ");
printf('%s',"Err_SimpL/2  |   ");
printf('%s',"Res   |\n");
("-------------------------------------------------------------------------------------------")
nT=2;
nS=3;
L=2;
for n=1 : 12
  h=1/L;
  printf('%e',h);
  printf('%s',"  |  ");
  printf('%u',L);
  printf('%s',"  |  ");
  Q2=intNCcompuesta(f,a,b,L,nT);
  printf('%f',Q2);
  printf('%s',"  |  ");
  Etrap=abs(((2/pi)-Q2));
  printf('%f',Etrap);
  printf('%s'," |  ");
  L=L/2;
  if n==1
    printf('%s',"    -   ");
  else 
    Q2_2=intNCcompuesta(f,a,b,L,nT);
    Etrap2=Q2_2/Q2;  
    printf('%f',abs(Etrap2));
  endif
  printf('%s',"   | ");
  L=2*L;
  Q3=intNCcompuesta(f,a,b,L,nS);
  printf('%f',Q3);
  printf('%s',"  |  ");
  Esimp=((2/pi)-Q3);
  printf('%f',Esimp);
  printf('%s',"  |  ");
  L=L/2;
  if n==1
    printf('%s',"-");
  else 
    Q3_3=intNCcompuesta(f,a,b,L,nS);
    Etrap2=Q3_3/Q3;  
    printf('%f',Etrap2);
  endif
  printf('%s',"   |   ");
  printf('%f',cuad_gauss_c(f,a,b,L,n));
  printf('%s',"  |");
  printf('%s',"\n")
  L=L*4;
endfor

 %------------------------------------------------------------------------------------------------
display(" ");
display(" ");
display(" ");
display("f(x)=|x|^3/2")
a=-0;
b=5;
f=@(x)abs(x).^(3/2);
printf('%s',"                    |      ");
printf('%s',"Regla de los trapecios");
printf('%s',"           |     ");
printf('%s',"Regla de Simpson");
printf('%s',"       |   ");
printf('%s',"Cuadratura Gaussiana   |\n");
display("-----------------------------------------------------------------------------------------------------------------")
printf('%s',"       ");
printf('%s',"h");
printf('%s',"      |  ");
printf('%s',"L");
printf('%s',"  |     ");
printf('%s',"Q_2");
printf('%s',"    |  ");
printf('%s',"Err_Trap");
printf('%s',"  | ");
printf('%s',"Err_TrapL/2");
printf('%s',"  |     ");
printf('%s',"Q_3");
printf('%s',"    |  ");
printf('%s',"Err_Simp");
printf('%s'," | ");
printf('%s',"Err_SimpL/2  |   ");
printf('%s',"Res   |\n");
("-------------------------------------------------------------------------------------------")
nT=2;
nS=3;
L=2;
for n=1 : 12
  h=1/L;
  printf('%e',h);
  printf('%s',"  |  ");
  printf('%u',L);
  printf('%s',"  |  ");
  Q2=intNCcompuesta(f,a,b,L,nT);
  printf('%f',Q2);
  printf('%s',"  |  ");
  Etrap=abs(((2/pi)-Q2));
  printf('%f',Etrap);
  printf('%s'," |  ");
  L=L/2;
  if n==1
    printf('%s',"    -   ");
  else 
    Q2_2=intNCcompuesta(f,a,b,L,nT);
    Etrap2=Q2_2/Q2;  
    printf('%f',abs(Etrap2));
  endif
  printf('%s',"   | ");
  L=2*L;
  Q3=intNCcompuesta(f,a,b,L,nS);
  printf('%f',Q3);
  printf('%s',"  |  ");
  Esimp=((2/pi)-Q3);
  printf('%f',Esimp);
  printf('%s',"  |  ");
  L=L/2;
  if n==1
    printf('%s',"-");
  else 
    Q3_3=intNCcompuesta(f,a,b,L,nS);
    Etrap2=Q3_3/Q3;  
    printf('%f',Etrap2);
  endif
  printf('%s',"   |   ");
  printf('%f',cuad_gauss_c(f,a,b,L,n));
  printf('%s',"  |");
  printf('%s',"\n")
  L=L*4;
  endfor
 