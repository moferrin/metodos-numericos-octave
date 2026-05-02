function seidelG3
  clc;
  display("Ya deben ser ingresado los valores validados y reordenados")
  display("\nIngreso de la matriz ampliada: ")
  tam=input("Ingrese el numero de filas: ") 
  for i=1:tam
    for j=1:tam
      disp(['El elemento (',num2str(i),',',num2str(j),')'])
      amp(i,j)=input('');
    endfor
  endfor
  
  display("Ingreso de los terminos independientes: ")
  for j=1:tam
    disp(['El elemento (',num2str(j),',','1',')'])
    ind(j,1)=input('');
  endfor
  
  
  display("Ingreso de los puntos iniciales: ")
  for j=1:tam
    disp(['El elemento (',num2str(j),',','1',')'])
    xIni(j,1)=input('');
  endfor
  
  
  err=input("Ingrese el tama�o del error: ")
  
  %si el determinante es cero,no tiene solucion
  if(det(amp)==0)
    display("El sistema no tiene �nica soluci�n")
  else
    
    errEnc=0;
    it=1;
    bandera=true;
    %mientras sea verdadero
    while (bandera)
      %copio mis valores iniciales para despues con eso calcular el error
      aux=xIni;
      
      %eval�o la ecuaci�n de gauss seidel en los puntos y los muestro
      %muestro en que iteracion voy
      display(["\n La solucion en la iteracion ",num2str(it)])
      for i=1:tam
        xIni(i)=(ind(i)-(amp(i,1:i-1)*xIni(1:i-1) + amp(i,i+1:tam)*xIni(i+1:tam)))/amp(i,i);
        display([' x(',num2str(i),')' ,' = ',num2str(xIni(i))])
      endfor
      %calculo el error
      errEnc=abs(xIni-aux);
      
      %muestro los errores en cada variable
      for i=1:tam
        display(['El error absoluto en x(',num2str(i),')' ,' = ',num2str(errEnc(i))])
      endfor
      
      %aumento el numero de iteraciones
      it=it+1;
      
      %si el error encontrado es menor al ingresado
      if (errEnc<err)
        %hago false, y el while se detiene
        bandera = false;
      endif
    endwhile
  endif 
end