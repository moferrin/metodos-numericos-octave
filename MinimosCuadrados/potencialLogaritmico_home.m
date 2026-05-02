function mincuPotencialLogaritmico
  clc;
  op = input("1. Potencial \n2. Logaritmico: ");
  switch (op)
    case 1
      display('Modelo Potencial')
      xs = input("Ingrese los valores de las X de manera ordenada: ");
      ys = input("Ingrese los valores de las Y de manera ordenada: ");
      nx=length(xs);
      ny=length(ys);
      if (nx ~= ny)
        display('xi debe contener la misma cantidad de valores que yi')
        return;
      end

      for c=1:nx
        if ((ys(c)<= 0) || (xs(c)<= 0))
          display('X o Y no puede contener valores menores o iguales a 0 para regresion potencial')
          return;
        end
      end



      plnXlnY = log(xs).*log(ys);

      %sumatorias
      sumlnX=cumsum(log(xs))(nx);
      sumlnY=cumsum(log(ys))(nx);
      sPlnXlnY=cumsum(plnXlnY)(nx);
      sumlnXCuad=cumsum((log(xs)).^2)(nx);

      A = [nx sumlnX; sumlnX sumlnXCuad];
      b = [sumlnY; sPlnXlnY];


      sol=inv(A)*b;

      a1=e^sol(1)
      a2=sol(2)

      display(["El modelo es: y=",num2str(a1),"x^",num2str(a2)])
      %Grafico la funcion
      rang=min(xs)-0.1:0.1:max(xs)+0.1;
      res=a1*rang.^a2;
      plot(xs,ys,'*',rang,res,'k','LineWidth',0.5)
      grid on;
      grid minor;

    case 2
      display('Modelo Logaritmico')
      xs = input("Ingrese los valores de las X de manera ordenada: ");
      ys = input("Ingrese los valores de las Y de manera ordenada: ");
      nx=length(xs);
      ny=length(ys);
      if (nx ~= ny)
        display('xi debe contenr la misma cantidad de valores que yi')
        return;
      end

      for c=1:nx
        if (xs(c)<= 0)
          display('X no puede contener valores menores o iguales a 0 para regresion logaritmica')
          return;
        end
      end

      %sumatorias
      sumys=cumsum(ys)(nx);
      sumlnX = cumsum(log(xs))(nx);
      sumlnXCuad = cumsum((log(xs)).^2)(nx);
      sPyslnX = cumsum((ys.*log(xs)))(nx);

      A = [nx sumlnX; sumlnX sumlnXCuad]
      b = [sumys; sPyslnX]

      sol=inv(A)*b;;

      a1=sol(1)
      a2=sol(2)

      display(["El modelo es: y=",num2str(a1),"+(",num2str(a2),"ln(x))"])
      %Grafico la funcion
      rang=min(xs)-0.1:0.1:max(xs)+0.1;
      res=a1+(a2*log(rang));
      plot(xs,ys,'*',rang,res,'k','LineWidth',0.5)
      grid on;
      grid minor;

    otherwise
      display("Opcion incorrecta");
  endswitch
end
