function LogaritmicoLineal
  clc;
  g = input("1. Metodo Logaritmico \n2. Metodo Lineal: ");
  switch (g)
    case 1
      display('Regresion Logaritmica')
      X = input("Ingrese los valores de las X en forma ordenada ascendente: ")
      Y = input("Ingrese los valores de las Y: ")
      nX=length(X);
      nY=length(Y);    
      if (nX ~= nY)
        display('xi debe contenr la misma cantidad de valores que yi')
        return;
      end
      
      for c=1:nX
        if (X(c)<= 0)
          display('X no puede contener valores menores o iguales a 0 para regresion logaritmica')
          return;
        end
      end
      
      slnX=0;
      sY=0;
      sPYlnX=0;
      slnXC=0;

      for j=1:nX
        sY=sY + Y(j);
        slnX = slnX+log(X(j));
        slnXC = slnXC + (log(X(j)))^2;
        sPYlnX = sPYlnX + (Y(j)*log(X(j)));
      end
      
      a1=((-slnX*sPYlnX)+(sY*slnXC))/((-slnX*slnX)+(nX*slnXC))
      a2=((sPYlnX-(slnX*(a1)))/slnXC)
      
      display(["El modelo es: y=",num2str(a1),"+(",num2str(a2),"ln(x))"])
      %Grafico la funcion
      rang=min(X)-0.1:0.1:max(X)+0.1;
      res=a1+(a2*log(rang));
      plot(X,Y,'*',rang,res,'k','LineWidth',0.5)
      grid on;
      grid minor;
      
    case 2

      display('Regresion Lineal')
      X = input("Ingrese los valores de las X: ")
      Y = input("Ingrese los valores de las Y: ")
      nX=length(X);
      nY=length(Y);    
      if (nX ~= nY)
        display('xi debe contenr la misma cantidad de valores que yi')
        return;
      end
      
      sX=0;
      sY=0;
      sXC=0; %sumatoria de X al cuadrado
      sXY=0; %sumatoria de X por Y
      for i=1:nX
        sX=sX+X(i);
        sY=sY+Y(i);
        sXC=sXC+(X(i)*X(i));
        sXY=sXY+(X(i)*Y(i));
      endfor
      
      a1=((-sX*sXY)+(sY*sXC))/((-sX*sX)+(nX*sXC));
      a2=((sXY-(sX*(a1)))/sXC);

      display(['El modelo encontrado es: y=',num2str(a1),'+ (',num2str(a2),')X'])
      X1=min(X)-0.1:0.1:max(X)+0.1;
      Y1=a1+a2.*X1;
      plot(X,Y,'*',X1,Y1,'g','LineWidth',0.5)
      grid on;
      grid minor;
      
    otherwise
      display("Sleccione 1 o 2");
  endswitch
  
endfunction