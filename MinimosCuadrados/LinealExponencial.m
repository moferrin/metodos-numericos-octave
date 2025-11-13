function LinealExponencial
  clc;
  opcion=input(" Seleccione: \n 1 Regresion lineal \n 2 Regresion exponenencial \n");

  switch(opcion)
  case 1
    
    Xi=input("Ingrese el vector con las xi: ") 
    
    Yi=input("Ingrese el vector con las yi: ")
    
    N=length(Xi);
    NYi=length(Yi);
    %compruebo que existe el mismo numero de x y y
    if N!=NYi
      display("xi debe contener la misma cantidad de valores que yi")
      return
    endif
    
    %realizo las operaciones para la tabla
    prodXiYi=Xi.*Yi;
    XiCuad=Xi.^2;

    sumXi=0;
    sumYi=0;
    sumProdXiYi=0;
    sumXiCuad=0;

    % realizo las sumatorias
    for j=1:N
      sumXi = sumXi+Xi(j);
      sumYi = sumYi+Yi(j);
      sumProdXiYi = sumProdXiYi + prodXiYi(j);
      sumXiCuad = sumXiCuad + XiCuad(j);
    end
    
    %muestro las sumatorias
    display(sumXi)
    display(sumYi)
    display(sumProdXiYi)
    display(sumXiCuad)
    
    %resuelvo por gauss el sistema de ecuaciones
    sistema=[N sumXi sumYi; sumXi sumXiCuad sumProdXiYi]
    
    %hago 0 en la segunda fila
    sistema(2,:) = sistema(2,:)-(sistema(2,1)/sistema(1,1))*sistema(1,:);
    %encuentro mi a2
    a2=sistema(2,3)/sistema(2,2)
    %encuentro mi a1
    a1=(sistema(1,3)-(sistema(1,2)*a2))/sistema(1,1)

    %Grafico la funcion
    x2=min(Xi)-0.1:0.1:max(Xi)+0.1;
    y2=a1+a2*x2;
    plot(Xi,Yi,'*',x2,y2,'k','LineWidth',0.5)
    grid on;
    grid minor;
      
    %muestro el polinomio ajustado 
    display(["La ecuacion lineal que se asemeja es: ","y=",num2str(a1),"+(",num2str(a2),")x"])
    
    display("\nEl error en cada punto es: ")
    
    %calculo el error en cada punto
    for i=1:N
      %calculo el ytei
      yTeo=a1+a2*Xi(i);
      %resto el valor real menos el aproximado (yteo)
      errAbs=abs(Yi(i)-yTeo);
      %muestro el error abosluto
      display(["X",num2str(i)," = ",num2str(Xi(i)),"    Y = ",num2str(Yi(i)),"    YTeo = ",num2str(yTeo),"    ErrAbsol = ",num2str(errAbs)])
    endfor
    
  case 2
    Xi=input("Ingrese el vector con las xi: ")
    
    Yi=input("Ingrese el vector con las yi: ")

    
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

    display("\nEl error en cada punto es: ")
    
    %calculo el error en cada punto
    for i=1:N
      %calculo el ytei
      yTeo=a1*(a2.^Xi(i));
      %resto el valor real menos el aproximado (yteo)
      errAbs=abs(Yi(i)-yTeo);
      %muestro el error abosluto
      display(["X",num2str(i)," = ",num2str(Xi(i)),"    Y = ",num2str(Yi(i)),"    YTeo = ",num2str(yTeo),"    ErrAbsol = ",num2str(errAbs)])
    endfor
  otherwise
    display("Opcion incorrecta")
  endswitch

endfunction