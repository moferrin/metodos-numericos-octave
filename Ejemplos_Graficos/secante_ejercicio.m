function pregunta
  display("Metodo de la secante")
  display("La forma es: A*sen(x)*cos(x)*x^2+B*e^x")
  
  A=input("Ingrese A: ");
  B=input("Ingrese B: ");
  %Ingreso de los puntos
  xkm1=input("Ingrese x0: ");
  xk=input("Ingrese x1: ");
  %Ingreso el error para comparar
  errU=input("Ingrese el error para comparar y detener: ");
  %Los dos puntos ingresados deben ser diferentes
  if xkm1==xk
    display("x1 y x2 no pueden ser iguales, saliendo del programa...1")
    return
  endif
  
  %Condicional para el while, tiene un valor de 1 para que entre en
  %el while
  b=1
  %Contar las iteraciones
  i=1;
  while (b)
    %Aumentar la iteracion
    i=i+1;
    %Evaluar en mi x sub 0 (x sub k menos 1)
    fxkm1=A*sin(xkm1)*cos(xkm1)*xkm1^2+B*e^xkm1;
    %Evaluar en mi x sub 1 (x sub k)
    fxk=A*sin(xk)*cos(xk)*xk^2+B*e^xk;
    
    %Aplico la formula de la secante y obtengo la raiz
    respx=xk-(fxk*(xk-xkm1))/(fxk-fxkm1);
    %Calculo el error
    err=abs(respx-xk);
    %Si el error encontrado es menor al ingresado por
    %el usuario, entonces me detengo y hago que b valga
    % 0 para que no vuelva a entrar al while
    if err < errU
      b=0;
    endif
    
    display("")
    display("iteracion: ")
    display(i)
    display("raiz: ")
    display(respx)
    display("error: ")
    display(err)
    
    %Cambio para volver a calcular la siguiente iteracion
    xkm1=xk;
    xk=respx;
    
  endwhile
  %Rango donde se va a graficar
  x=-3:0.0001:1;
  %Una grafica se sobreponga sobre la otra
  hold on;
  %Graficar mi funcion
  plot(x,A.*sin(x).*cos(x).*x.^2+B*e.^x,'g')
  %Graficar el punto (la raiz encontrada)
  plot(respx,A.*sin(respx).*cos(respx).*respx.^2+B*e.^respx,'or')
  %Mostrar cuadricula
  grid on;
  %Mostrar cuadricula mas chiquita
  grid minor;
  
endfunction