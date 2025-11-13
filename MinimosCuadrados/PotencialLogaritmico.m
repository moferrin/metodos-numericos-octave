function PotencialLogaritmico
  clc;
  op = input("1. Potencial \n2. Logaritmico: ");
  switch (op)
    case 1
      display('Modelo Potencial')
      xs = input("Ingrese los valores de las X de manera ordenada: ")
      ys = input("Ingrese los valores de las Y de manera ordenada: ")
      nx=length(xs);
      ny=length(ys);    
      if (nx ~= ny)
        display('xi debe contenr la misma cantidad de valores que yi')
        return;
      end
      
      for c=1:nx
        if ((ys(c)<= 0) | (xs(c)<= 0))
          display('X o Y no puede contener valores menores o iguales a 0 para regresion potencial')
          return;
        end
      end
      
      sumlnX=0;
      sumlnY=0;
      sPlnXlnY=0;
      plnXlnY = log(xs).*log(ys);
      sumlnXCuad=0;
      %sumatorias
      for j=1:nx
          sumlnX = sumlnX+log(xs(j));
          sumlnY = sumlnY+log(ys(j));
          sPlnXlnY = sPlnXlnY + plnXlnY(j);
          sumlnXCuad = sumlnXCuad + (log(xs(j)))^2;
      end
      
      A = [nx sumlnX; sumlnX sumlnXCuad]
      b = [sumlnY; sPlnXlnY]
      
      tam=2;
      %armo la matriz ampliada
      AI=[A eye(tam)];
      %hago la inversa
      for j=1:tam %recorro columna
        for i=1:tam % recorro fila
          %si estoy en la posicion diagonal se debe dividir para ese nuumero
          %para hacer 1
          
          if i==j 
            %hago 1 dividiendo para el valor en esa posicion
            AI(i,:)=AI(i,:)/AI(i,j);
          endif
            
          %si no estoy en la diagonal, tengo que hacer los 0
          if i!=j
            %Aqui hago la operacion para tener 0 en las demas posiciones
            %la fila actual es igual a la misma fila menos la fila por un valor para hacer 0
            AI(i,:)=AI(i,:)-(AI(i,j)/AI(j,j))*AI(j,:);
          endif
        endfor
      endfor
      
      %guardo unicamente la inversa
      AI=AI(:,tam+1:tam*2);
      %multiplico para la solucion
      sol=AI*b;
      
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
      xs = input("Ingrese los valores de las X de manera ordenada: ")
      ys = input("Ingrese los valores de las Y de manera ordenada: ")
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
      
      sumlnX=0;
      sumys=0;
      sPyslnX=0;
      sumlnXCuad=0;
      %sumatorias
      for j=1:nx
        sumys=sumys + ys(j);
        sumlnX = sumlnX+log(xs(j));
        sumlnXCuad = sumlnXCuad + (log(xs(j)))^2;
        sPyslnX = sPyslnX + (ys(j)*log(xs(j)));
      end
      
      A = [nx sumlnX; sumlnX sumlnXCuad]
      b = [sumys; sPyslnX]

      tam=2;
      AI=[A eye(tam)];
      for j=1:tam 
        for i=1:tam 
            if i==j 
            AI(i,:)=AI(i,:)/AI(i,j);
          endif
          if i!=j
            AI(i,:)=AI(i,:)-(AI(i,j)/AI(j,j))*AI(j,:);
          endif
        endfor
      endfor
      
      AI=AI(:,tam+1:tam*2);

      sol=AI*b;
      
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