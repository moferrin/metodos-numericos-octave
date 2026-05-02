function grupo2taylor
  clc;
  display("Programa que aproxima la funcion cos(sqrt(x+1)) mediante polinomio de taylor");
  x=input("x= ");
  xm=input("x̄= ");

  #controlo que no sea raiz de numeros negativos
  if x<-1 || xm<-1
    display("x o x̄= no pueden ser menores a -1")
    return;
  endif

  fx=cos(sqrt(x+1));
  dfx=-sin(sqrt(x+1))/(2*sqrt(x+1));
  ddfx=sin(sqrt(x+1))/(4*(x+1)^(3/2)) - cos(sqrt(x+1))/(4*(x+1));
  dddfx= sin(sqrt(x+1))/(8*(x+1)^(3/2)) - 3*sin(sqrt(x+1))/(8*(x+1)^(5/2)) + 3*cos(sqrt(x+1))/(8*(x+1)^2);
  d4fx=-((12*(x+1)^(5/2)+ sqrt(x+1)*(-x^3 +3*x +2))*cos(sqrt(x+1)) + (6*x^3+ 3*x^2- 12*x- 9)*sin(sqrt(x+1)))/(16*(x+1)^(11/2));

  if x<xm || x==xm
    rango=-1:0.001:xm+1;
  endif

  if x>xm
    rango=-1:0.001:x+1;
  endif

  #Grafica
  plot(rango,fx+(dfx)*(rango-x) + ((ddfx/2)*(rango-x).^2) + ((dddfx/6)*(rango-x).^3) + ( (d4fx/24)*(rango-x).^4 ),'linewidth',1.5, rango,fx+(dfx)*(rango-x) + ((ddfx/2)*(rango-x).^2) + ((dddfx/6)*(rango-x).^3),'linewidth',0.5,rango,fx+(dfx)*(rango-x) + ((ddfx/2)*(rango-x).^2),'linewidth',0.5,rango,fx+(dfx)*(rango-x),'linewidth',0.5,rango,cos(sqrt(rango+1)),'linewidth',0.5)
  legend('grado 4','grado 3','grado 2','grado 1','funcion original')
  hold on
  grid on
  grid minor
  xlabel('EJE X');
  ylabel('EJE Y');
  title('APROXIMACION cos(sqrt(x+1))');
  format long

  ypol=fx+(dfx)*(xm-x) + ((ddfx/2)*(xm-x)^2) + ((dddfx/6)*(xm-x)^3) + ( (d4fx/24)*(xm-x)^4 );
  display(["Respuesta por taylor: ",num2str(ypol)])

  yfx=cos(sqrt(xm+1));
  display(["Respuesta de la funcion original: ", num2str(yfx)])

  errRelativo=100*abs((yfx-ypol)/yfx);
  display(["Error relativo: ",num2str(errRelativo),'%'])

endfunction
