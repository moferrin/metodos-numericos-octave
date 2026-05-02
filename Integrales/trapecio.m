function grupo2IntegralTrapecio
  warning('off','all');
  pkg load symbolic;
  syms x;
  clc;
  selec=input("\n Formula normal(1) \n Formula extendida(2) \n");
  switch (selec)
    case 1
      funAInt=input('Escriba la funcion a integrar: ');
      limSupe=input('Ingrese el limite superior: ');
      limInfe=input('Ingrese el limite inferior: ');
      h=(limSupe - limInfe)
      display("La solucion integral exacta evaluada es : \n")
      resultado = eval(int(funAInt,x,limInfe,limSupe))
      
      display("La solucion de la integral mediante el trapedio es: ");
      total = h*(1/2)*eval(subs(funAInt,x,limSupe)+subs(funAInt,x,limInfe))
      
      display("El error absoludo encontrado es: ");
      errorAbsoluto=abs(resultado-total)
     
    case 2
      funAInt=input('Escriba la funcion a integrar: ');
      limSupe=input('Ingrese el limite superior: ');
      limInfe=input('Ingrese el limite inferior: ');
      errorV=input('Ingrese el error: ');
      n=input('Ingrese n: ');
      display("La solucion integral exacta evaluada es : \n")
      resultado = eval(int(funAInt,x,limInfe,limSupe))
      
      h=(limSupe - limInfe)/n
      xi = limInfe:h:limSupe;
      
      MM = (1/2)* eval(subs(funAInt,x,limInfe) + subs(funAInt,x,limSupe));
      respu = 0;
      %la sumatoria
      for i=2:n
        respu = respu + eval(subs(funAInt,x,xi(i)));
      end
       display("La solucion de la integral mediante el trapedio extendido es: ");
      total = h*(MM + respu)

      display("El error absoludo encontrado es: ");
      errorAbsoluto=abs(resultado-total)
      
      while (errorAbsoluto>errorV)
        n=n+1;
        h=(limSupe - limInfe)/n
        xi = limInfe:h:limSupe;
        MM = (1/2)* eval(subs(funAInt,x,limInfe) + subs(funAInt,x,limSupe));
        respu = 0;
        for i=2:n
          respu = respu + eval(subs(funAInt,x,xi(i)));
        end
        display("La solucion de la integral mediante el trapedio extendido es: ");
        total = h*(MM + respu)

        display("El error absoludo encontrado es: ");
        errorAbsoluto=abs(resultado-total)
        
      endwhile
      
    otherwise
      display("Opcion incorrecta")
  endswitch 
end