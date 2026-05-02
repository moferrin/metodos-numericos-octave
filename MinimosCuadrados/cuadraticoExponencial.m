function cuadraticolExponencial
clc;
opcion=input(" Seleccione: \n 1 Regresion cuatratica \n 2 Regresion exponenencial \n");

switch(opcion)
  case 1

    x=input("Ingrese el vector con las xi: ");

    y=input("Ingrese el vector con las yi: ");

    N=length(x);
    NYi=length(y);
    %compruebo que existe el mismo numero de x y y
    if N!=NYi
      display("xi debe contener la misma cantidad de valores que yi")
      return
    endif

      sumX=0;
      sumY=0;
      sumX2=0;
      sumX3=0;
      sumX4=0;
      sumXY=0;
      sumX2Y=0;

      for i=1:N
        sumX=sumX+x(i);
        sumY=sumY+y(i);
        sumX2=sumX2+(x(i))^2;
        sumX3=sumX3+(x(i))^3;
        sumX4=sumX4+(x(i))^4;
        sumXY = sumXY + (x(i)*y(i));
        sumX2Y = sumX2Y + ((x(i)^2)*y(i));
      endfor

      A=[N sumX sumX2; sumX sumX2 sumX3; sumX2 sumX3 sumX4];

      b=[sumY; sumXY; sumX2Y];

      n=3;
      %display("La ampliada")
      amp=[A eye(n)];
      for j=1:n %recorro columna
        for i=1:n %recorro fila
          %hacemos 1
          if i==j
            amp(i,:)=amp(i,:)/amp(i,j);
          endif
          %caso contrario hago 0
          if i!=j
            amp(i,:)=amp(i,:)-(amp(i,j)/amp(j,j))*amp(j,:);
          endif
        endfor
      endfor


      ainv=amp(:,n+1:n*2);
      X=ainv*b;

      a1=X(1);
      a2=X(2);
      a3=X(3);

      display(['El modelo encontrado es: y=',num2str(a1),'+(',num2str(a2),'x)+(',num2str(a3),'x^2)'])

      %Grafico la funcion
      x1=min(x)-0.1:0.1:max(x)+0.1;
      y1=a1+a2.*x1 + a3.*x1.^2;
      plot(x,y,'*',x1,y1,'g','LineWidth',0.5)
      grid on;
      grid minor;

  case 2
      Xi=input("Ingrese el vector con las xi: ");

      Yi=input("Ingrese el vector con las yi: ");


      N=length(Xi);
      NYi=length(Yi);
      %compruebo que existe el mismo numero de x y y
      if N!=NYi
        display("xi debe contener la misma cantidad de valores que yi")
        return
      endif

      %verifico que no haya menores o iguales a 0 a causa del logaritmo
      for c=1:N
        if Yi(c)<= 0
          display('yi no puede contener valores menores o iguales a 0 para regresion exponencial')
          return;
        end
      endfor

      %realizo las operaciones para la tabla
      logYi=log10(Yi);
      prodXilogYi=Xi.*logYi;
      XiCuad=Xi.^2;

      sumXi=0;
      sumYi=0;
      sumXiCuad=0;
      sumLogYi=0;
      sumProdXilogYi=0;

      % realizo las sumatorias
      for j=1:N
        sumXi = sumXi+Xi(j);
        sumYi = sumYi+Yi(j);
        sumXiCuad = sumXiCuad + XiCuad(j);
        sumLogYi = sumLogYi + logYi(j);
        sumProdXilogYi = sumProdXilogYi + prodXilogYi(j);
      endfor

      display(sumXi)
      display(sumYi)
      display(sumXiCuad)
      display(sumLogYi)
      display(sumProdXilogYi)

      %resuelvo por gauss el sistema de ecuaciones
      sistema=[N sumXi sumLogYi; sumXi sumXiCuad sumProdXilogYi]

      %hago 0 en la segunda fila
      sistema(2,:) = sistema(2,:)-(sistema(2,1)/sistema(1,1))*sistema(1,:);

      logDa2=sistema(2,3)/sistema(2,2);

      logDa1=(sistema(1,3)-(sistema(1,2)*logDa2))/sistema(1,1);

      %Encuentro mi a1 y a2
      a1=10^logDa1

      a2=10^logDa2

      %Grafico la funcion
      x2=min(Xi)-0.2:0.1:max(Xi)+0.2;
      y2=a1*(a2.^x2);
      plot(Xi,Yi,'*',x2,y2,'k','LineWidth',0.5)
      grid on;
      grid minor;

      %muestro la ecuacion
      display(["La ecuacion exponencial que se asemeja es: ","y=",num2str(a1),"(",num2str(a2),")^x"])

    otherwise
      display("Opcion incorrecta")
endswitch

endfunction
