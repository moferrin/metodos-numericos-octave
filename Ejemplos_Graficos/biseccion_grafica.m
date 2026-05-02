function biseccion
  display("Metodo de la biseccion")
  display("La forma es: A*sen(x)*cos(x)*x^2+B*e^x")
  A=input("Ingrese A: ");
  B=input("Ingrese B: ");
  %Rango donde se va a graficar
  x=-3:0.0001:1;
  %Una grafica se sobreponga sobre la otra
  hold on;
  %Graficar mi funcion
  plot(x,A.*sin(x).*cos(x).*x.^2+B*e.^x,'g')
  %Mostrar cuadricula
  grid on;
  %Mostrar cuadricula mas chiquita
  grid minor;

  %Ingreso de los puntos
  xkm1=input("Ingrese x0: ");
  xk=input("Ingrese x1: ");
  %Los dos puntos ingresados deben ser diferentes
  if xkm1==xk
    display("x1 y x2 no pueden ser iguales, saliendo del programa...")
    return
  endif

  op = input("Seleccione:\n 1. Error Relativo \n 2. Error absoluto \n");

  switch (op)
  case 1
    %Ingreso el error para comparar
  errU=input("Ingrese el error para comparar y detener: ");
     %Condicional para el while, tiene un valor de 1 para que entre en
      %el while
      b=1;
      %Contar las iteraciones
      i=1;

      pmed=(xk+xkm1)/2;
      %Evaluar en mi x sub 0 (x sub k menos 1)
      fxkm1=A*sin(xkm1)*cos(xkm1)*xkm1^2+B*e^xkm1;
      %Evaluar en mi punto medio
      fpmed=A*sin(pmed)*cos(pmed)*pmed^2+B*e^pmed;
      if(fpmed==0)
        display(["La raiz es", num2str(pmed)])
        return
      end

      % Actualizar los límites del intervalo
      if(fpmed*fxkm1) > 0
        xkm1 = pmed;
      else
        xk = pmed;
      end

      display("\n")
      display(["iteracion: ",num2str(i)])
      display(["raiz: ",num2str(pmed)])

      while (b)
        raizAnt=pmed;
        %Aumentar la iteracion
        i=i+1;
        %Aplico la formula de punto medio

        pmed=(xk+xkm1)/2;
        %Evaluar en mi x sub 0 (x sub k menos 1)
        fxkm1=A*sin(xkm1)*cos(xkm1)*xkm1^2+B*e^xkm1;
        %Evaluar en mi punto medio
        fpmed=A*sin(pmed)*cos(pmed)*pmed^2+B*e^pmed;

        if(fpmed==0)
          display(["La raiz es", num2str(pmed)])
          b=0;
        end

        % Actualizar los límites del intervalo
        if(fpmed*fxkm1) > 0
          xkm1 = pmed;
        else
          xk = pmed;
        end

        %Calculo el error
        err=abs((pmed-raizAnt)/pmed);
        %Si el error encontrado es menor al ingresado por
        %el usuario, entonces me detengo y hago que b valga
        % 0 para que no vuelva a entrar al while
        if err < errU
          b=0;
        endif

        display("\n")
        display(["iteracion: ",num2str(i)])
        display(["raiz: ",num2str(pmed)])
        display(["error: ",num2str(err)])

      endwhile

      %Graficar el punto (la raiz encontrada)
      plot(pmed,A.*sin(pmed).*cos(pmed).*pmed.^2+B*e.^pmed,'or')

      case 2
      %Ingreso el error para comparar
  errU=input("Ingrese el error para comparar y detener: ");
     %Condicional para el while, tiene un valor de 1 para que entre en
      %el while
      b=1;
      %Contar las iteraciones
      i=1;

      pmed=(xk+xkm1)/2;
      %Evaluar en mi x sub 0 (x sub k menos 1)
      fxkm1=A*sin(xkm1)*cos(xkm1)*xkm1^2+B*e^xkm1;
      %Evaluar en mi punto medio
      fpmed=A*sin(pmed)*cos(pmed)*pmed^2+B*e^pmed;
      if(fpmed==0)
        display(["La raiz es", num2str(pmed)])
        return
      end

      % Actualizar los límites del intervalo
      if(fpmed*fxkm1) > 0
        xkm1 = pmed;
      else
        xk = pmed;
      end

      display("\n")
      display(["iteracion: ",num2str(i)])
      display(["raiz: ",num2str(pmed)])

      while (b)
        raizAnt=pmed;
        %Aumentar la iteracion
        i=i+1;
        %Aplico la formula de punto medio

        pmed=(xk+xkm1)/2;
        %Evaluar en mi x sub 0 (x sub k menos 1)
        fxkm1=A*sin(xkm1)*cos(xkm1)*xkm1^2+B*e^xkm1;
        %Evaluar en mi punto medio
        fpmed=A*sin(pmed)*cos(pmed)*pmed^2+B*e^pmed;

        if(fpmed==0)
          display(["La raiz es", num2str(pmed)])
          b=0;
        end

        % Actualizar los límites del intervalo
        if(fpmed*fxkm1) > 0
          xkm1 = pmed;
        else
          xk = pmed;
        end

        %Calculo el error
        err=abs(pmed-raizAnt);
        %Si el error encontrado es menor al ingresado por
        %el usuario, entonces me detengo y hago que b valga
        % 0 para que no vuelva a entrar al while
        if err < errU
          b=0;
        endif

        display("\n")
        display(["iteracion: ",num2str(i)])
        display(["raiz: ",num2str(pmed)])
        display(["error: ",num2str(err)])

      endwhile

      %Graficar el punto (la raiz encontrada)
      plot(pmed,A.*sin(pmed).*cos(pmed).*pmed.^2+B*e.^pmed,'or')
    otherwise
      display("No selecciono una opcion valida");
    endswitch
 endfunction
