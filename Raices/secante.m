function secante
  %para mostrar mas decimales
  format long

  display("METODO DE LA SECANTE")
  display("De La forma: x^3*A*sin(B*x)")

  A=input("Ingrese variable A: ");
  B=input("Ingrese variable B: ");

  %Rango donde se va a graficar
  x=-4:0.0001:2;
  %Una grafica se sobreponga sobre la otra
  hold on;
  %Graficar mi funcion
  plot(x,x.^3 .*A.*sin(B.*x),'r')

  %Mostrar cuadricula
  grid on;
  %Mostrar cuadricula mas chiquita
  grid minor;

  %Ingresar los puntos
  x0=input("Ingrese x0: ");
  x1=input("Ingrese x1: ");

  %Ingreso el error
  errU=input("Ingresar el error para comparar y detener: ");

  %Los dos puntos ingresados deben ser diferentes
  if x0==x1
    display("x1 y x2 no pueden ser iguales, saliendo del programa...")
    return
  endif
  %Condicional para el while, tiene un valor de 1 para que entre en
  %el while
  b=1;
  %Contar las iteraciones
  i=0;
  while (b)
    %Aumentar la iteracion
    i=i+1;

    %Evaluar en mi x sub 0 (x sub k menos 1)
    fx0=x0^3 *A*sin(B*x0);

    %Evaluar en mi x sub 1 (x sub k)
    fx1=x1^3*A*sin(B*x1);

    %Aplico la formula de la secante y obtengo la raiz
    respx=x1-(fx1*(x1-x0))/(fx1-fx0);


    %Calculo el error
    err=abs((respx-x1)/respx);
    %Si el error encontrado es menor al ingresado por
    %el usuario, entonces me detengo y hago que b valga
    % 0 para que no vuelva a entrar al while
    if err < errU
      b=0;
    endif

    display("")
    display(["iteracion: ",num2str(i)])
    display(["raiz: ",num2str(respx)])
    display(["error: ",num2str(err)])
    %Cambio para volver a calcular la siguiente iteracion
    x0=x1;
    x1=respx;
  endwhile
  %Graficar el punto (la raiz encontrada)
  plot(respx,respx.^3 .*A.*sin(B.*respx),'ob')

endfunction
