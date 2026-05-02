function resp=taylor
  #Primero ingreso el punto alrededor y luego
  #el punto a evaluar
  x=input("Ingrese un punto alrededor quiere calcular el polinomio: ");
  y=input("ingrese en que punto desea evaluar el polinomio y la funcion: ");
  
  #aqui controlo que no sea 0, ya que la funcion no
  #esta definifa en ese punto  indeterminacion (1/0)
  if x==0 || y==0
    display("La funcion no esta definida en ese punto")
    return;
  endif
  
  #aqui evaluo en el primer termino del polinomio
  d0=cos(x^-2);
  #aqui evaluo en el segundo termino del polinomio
  d1=2*(sin(1/x^2))/x^3;
  #aqui evaluo en el tercer termino del polinomio
  d2=-(2*(2*cos(1/x^2)+3*sin(1/x^2)*x^2))/x^6;
  #aqui evaluo en el cuarto termino del polinomio
  d3=(2*( (12*sin(1/x^2)*x^4) - (4*sin(1/x^2)) + (18*cos(1/x^2)*x^2) ))/x^9;
  #aqui evaluo en el quinto termino del polinomio
  d4=2*( -(60*sin(1/x^2)*x^6) -(150*cos(1/x^2)*x^4) +(72*sin(1/x^2)*x^2) +(8*cos(1/x^2)) )/x^12;

  #calcular el punto a evaluar en el polinomio
  sol=d0+(d1)*(y-x) + ((d2/2)*(y-x)^2) + ((d3/6)*(y-x)^3) + ( (d4/24)*(y-x)^4 );
  #calcular el punto en la funcion original
  real=cos(y^-2);
  
  #muestro las respuestas
  display("La solución en el punto mediante el polinomio es:")
  display(sol);
  display("La solución en el punto en la funcion original el: ")
  display(real)

  #defino un rango de valores para hacer la grafica
  #comienza desde el punto donde hago mi polinomio hasta el punto a evaluar
  #controlo que vaya graficando desde el punto menor hasta el mayor
  if x<y || x==y
    m=x-1:0.0001:y+1;
  endif
  
  if x>y
    m=y-2:0.0001:x+2;
  endif
  #hago las graficas 
  hold on
  grid on
  plot(m,d0+(d1)*(m-x) + ((d2/2)*(m-x).^2) + ((d3/6)*(m-x).^3) + ( (d4/24)*(m-x).^4 ))
  plot(m,d0+(d1)*(m-x) + ((d2/2)*(m-x).^2) + ((d3/6)*(m-x).^3))
  plot(m,d0+(d1)*(m-x) + ((d2/2)*(m-x).^2))
  plot(m,d0+(d1)*(m-x))
  plot(m,cos(m.^-2))
  legend('f','p4','p3','p2','p1')
  
  #calculo el eror relativo
  errRelativo=100*abs((real-sol))/real;
  #muestro el error relativo
  display("El error relativo porcentual es: ")
  display(errRelativo)
  
endfunction