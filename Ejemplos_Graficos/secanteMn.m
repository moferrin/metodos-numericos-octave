function secanteMn
  display("METODO DE LA SECANTE")
  display("De La forma: x^4*A*sin(x)*B*cos(3^x)")

  A=input("Ingrese variable A: ");
  B=input("Ingrese variable B: ");

  %Rango donde se va a graficar
  x=-1.2:0.0001:1;
  %Una grafica se sobreponga sobre la otra
  hold on;
  %Graficar mi funcion
  plot(x,x.^4 .+A.*sin(x).*B.*cos(e.^x),'r')

  %Mostrar cuadricula
  grid on;
  %Mostrar cuadricula mas chiquita
  grid minor;

  %Ingresar los puntos
  xkm1=input("Ingrese x0: ");
  xk=input("Ingrese x1: ");
  %Ingreso el error
  errU=input("Ingresar el error para comparar y detener: ");
  %Los dos puntos ingresados deben ser diferentes
  if xkm1==xk
  display("x1 y x2 no pueden ser iguales, saliendo del programa...")
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

    fxkm1=xkm1^3 *A*sin(B*xkm1);
    %Evaluar en mi x sub 1 (x sub k)

    fxk=xk^3*A*sin(B*xk);
    %Aplico la formula de la secante y obtengo la raiz

    respx=xk-(fxk*(xk-xkm1))/(fxk-fxkm1);
    %Calculo el error
    err=abs((respx-xk)/respx);
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
    xkm1=xk;
    xk=respx;
  endwhile
  %Graficar el punto (la raiz encontrada)
  plot(respx,respx.^3 .*A.*sin(B.*respx),'og')
endfunction
