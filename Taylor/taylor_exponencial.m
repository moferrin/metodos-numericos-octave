function resp=taylor
  A=input("ingrese A: ");
  B=input("ingrese B: ");
  #ingreso el punto alrededor del cual calculo
  x=input("Ingrese un punto alrededor quiere calcular el polinomio: ");
  #punto a evaluar
  y=input("ingrese en que punto desea evaluar el polinomio y la funcion: ");

  #evaluo en funcion original el punto alrededor del cual voy a calcular
  d0=e^(sqrt(A*x-B));
  #evaluo en primera derivada
  d1=(A*e^sqrt(A*x-B))/(2*sqrt(A*x-B));
  #evaluo en segunda derivada
  d2=(A^2*((A*x-B)^(3/2)-A*x+B)*e^sqrt(A*x-B))/(4*(A*x-B)^(5/2));
  #evaluo en tercera derivada
  d3=(A^3*((A*x-B)^(3/2)-A*x+B)*e^sqrt(A*x-B))/(8*(A*x-B)^3)-(5*A^3*((A*x-B)^(3/2)-A*x+B)*e^sqrt(A*x-B))/(8*(A*x-B)^(7/2))+(A^2*((3*A*sqrt(A*x-B))/2-A)*e^sqrt(A*x-B))/(4*(A*x-B)^(5/2));
  #evaluo en cuarta derivada
  d4=(A^4*((A*x-B)^(3/2)-A*x+B)*e^sqrt(A*x-B))/(16*(A*x-B)^(7/2))-(11*A^4*((A*x-B)^(3/2)-A*x+B)*e^sqrt(A*x-B))/(16*(A*x-B)^4)+(35*A^4*((A*x-B)^(3/2)-A*x+B)*e^sqrt(A*x-B))/(16*(A*x-B)^(9/2))+(A^3*((3*A*sqrt(A*x-B))/2-A)*e^sqrt(A*x-B))/(4*(A*x-B)^3)-(5*A^3*((3*A*sqrt(A*x-B))/2-A)*e^sqrt(A*x-B))/(4*(A*x-B)^(7/2))+(3*A^4*e^sqrt(A*x-B))/(16*(A*x-B)^3);


  #calculo el punto a evaluar en el polinomio
  sol=d0+(d1)*(y-x) + ((d2/2)*(y-x)^2) + ((d3/6)*(y-x)^3) + ((d4/24)*(y-x)^4 );
  #calcular el punto en la funcion original
  real=e^(sqrt(A*y-B));

  #muestro las respuestas
  display("Polinomio de taylor:")
  display(sol);
  display("Funcion original: ")
  display(real)

  if B<x
    m=B+1:0.0001:x+7;
  endif
  if x<B
    m=x+1:0.0001:B+7;
  endif
  #grafico
  hold on
  grid on
  grid minor
  plot(m,d0+(d1)*(m-x) + ((d2/2)*(m-x).^2) + ((d3/6)*(m-x).^3) + ( (d4/24)*(m-x).^4 ))
  plot(m,d0+(d1)*(m-x) + ((d2/2)*(m-x).^2) + ((d3/6)*(m-x).^3))
  plot(m,d0+(d1)*(m-x) + ((d2/2)*(m-x).^2))
  plot(m,d0+(d1)*(m-x))
  plot(m,e.^(sqrt(A.*m-B)))
  legenda=legend('f','p4','p3','p2','p1');
  set(legenda, "fontsize", 16);

  #calculo el eror relativo
  relativo=100*abs((real-sol))/real;
  #muestro el error relativo
  display(["El error relativo es: ",num2str(relativo),"%"])

endfunction
