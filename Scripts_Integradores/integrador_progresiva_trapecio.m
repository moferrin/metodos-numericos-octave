function derivadaProgresivaIntegralTrapecio2
  warning('off','all');
  pkg load symbolic;
  syms x;
  clc;
  m=input("Derivadas \n 1. Primera Derivada \n 2. Segunda Derivada  \nIntegrales \n 3. Trapecio normal \n 4. Trapecio extendido  \n");
  switch (m)
    case 1
      X0=input('X0: ');
      h=input('h: ');
      erUsu=input('Error a comparar: ');
      func=input('Funcion: ');
      display("La derivada mediante calculo es : \n")
      %Derivo la funcion ingresada
      der=diff(func,x);

      valDerExac = eval(subs(der,x,X0))

      %progresiva
      arg = (X0+0*h);
      arg2 = (X0+1*h);
      arg3 = (X0+2*h);
      %evaluar la funcion en los puntos
      ter1 = func(arg);
      ter2 = func(arg2);
      ter3 = func(arg3);

      display("\nLa primera derivada numerica progresiva es : ");
      valDerAprox = (-3*ter1+4*ter2-ter3)/(2*h)

      err=abs((valDerAprox-valDerExac)/valDerExac)*100;
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      while (err>erUsu)
          h=h/10
          arg = (X0+0*h);
          arg2 = (X0+1*h);
          arg3 = (X0+2*h);
          ter1 = func(arg);
          ter2 = func(arg2);
          ter3 = func(arg3);
          display("La primera derivada numerica progresiva es : ");
          valDerAprox = (-3*ter1+4*ter2-ter3)/(2*h)
          err=abs((valDerAprox-valDerExac)/valDerExac)*100;
          display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      endwhile

    case 2
      display("Segunda Derivada");
      X0=input('X0: ');
      h=input('h: ');
      func=input('Funcion: ');
      erUsu=input('Error a comparar: ');
      display("La segunda derivada mediante calculo es : ")
      %Derivo la funcion ingresada
      der=diff(func, x);
      %Derivo la funcion ingresada nuevamente
      der2=diff(der, x);
      valDerExac = eval(subs(der2,x,X0))

      %progresiva
      arg = (X0+0*h);
      arg2 = (X0+1*h);
      arg3 = (X0+2*h);
      arg4 = (X0+3*h);

      %evaluar la funcion en los puntos
      ter1 = func(arg);
      ter2 = func(arg2);
      ter3 = func(arg3);
      ter4 = func(arg4);

      display("\nLa segunda derivada numerica progresiva es : ");
      valDerAprox = (2*ter1-5*ter2+4*ter3-ter4)/(h^2)

      err=abs((valDerAprox-valDerExac)/valDerExac)*100;
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      while (err>erUsu)
          h=h/10
          arg = (X0+0*h);
          arg2 = (X0+1*h);
          arg3 = (X0+2*h);
          arg4 = (X0+3*h);

          ter1 = func(arg);
          ter2 = func(arg2);
          ter3 = func(arg3);
          ter4 = func(arg4);

          display("La segunda derivada numerica progresiva es : ");
          valDerAprox = (2*ter1-5*ter2+4*ter3-ter4)/(h^2)
          err=abs((valDerAprox-valDerExac)/valDerExac)*100;
          display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      endwhile

    case 3
      funAInt=input('Escriba la funcion a integrar: ');
      limSupe=input('Ingrese el limite superior: ');
      limInfe=input('Ingrese el limite inferior: ');
      h=(limSupe - limInfe)
      display("La solucion integral exacta evaluada es : \n")
      resultado = integral(funAInt,limInfe,limSupe)

      display("La solucion de la integral mediante el trapecio es: ");
      total = h*(1/2)*(funAInt(limSupe)+funAInt(limInfe))


      err=abs((resultado-total)/resultado)*100
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])

    case 4
      funAInt=input('Escriba la funcion a integrar: ');
      limSupe=input('Ingrese el limite superior: ');
      limInfe=input('Ingrese el limite inferior: ');
      errorV=input('Ingrese el error: ');
      n=input('Ingrese n: ');
      display("La solucion integral exacta evaluada es : \n")
      resultado = integral(funAInt,limInfe,limSupe)

      h=(limSupe - limInfe)/n
      xi = limInfe:h:limSupe;

      MM = (1/2)* (funAInt(limInfe) + funAInt(limSupe));
      respu = 0;
      %la sumatoria
      for i=2:n
        respu = respu + funAInt(xi(i));
      end
       display("La solucion de la integral mediante el trapedio extendido es: ");
      total = h*(MM + respu)

      err=abs((resultado-total)/resultado)*100;
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      while (err>errorV)
        n=n+1;
        h=(limSupe - limInfe)/n
        xi = limInfe:h:limSupe;
        MM = (1/2)* (funAInt(limInfe) + funAInt(limSupe));
        respu = 0;
        for i=2:n
          respu = respu + funAInt(xi(i));
        end
        display("La solucion de la integral mediante el trapedio extendido es: ");
        total = h*(MM + respu)

        err=abs((resultado-total)/resultado)*100;
        display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      endwhile

    otherwise
      display("Opcion incorrecta")
  endswitch
end
