function w = calcularWsor(A,b,x0)
  
  wsor = linspace(0.8,1.1,20);
  vit = [];
  kmax = 15000;
  tol = 10e-10;
  for j=1:length(wsor)
    [x,it,r_h,t]=SOR(A,b,x0,tol,kmax,wsor(j));
    vit(j) = it;
  endfor
  
  dato = [wsor; vit]';
  [val pos] =min(dato(:,2));
  w = wsor(pos);
  
  figure(1)
  plot(wsor,vit,'-*r');
  grid on;
  grid minor;
  
  
endfunction