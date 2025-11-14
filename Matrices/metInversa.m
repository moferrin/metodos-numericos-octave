function metInversa
  %para que se vea mejor, porque salen muchos decimales a veces
  format rat;
  clc;
  x=input("Seleccione una opción \n 1. Ejemplo de solución infinita 2X2 \n 2. Ejemplo de no solución  2X2  \n 3. Resolver Matriz nxn \n");
  switch (x)
    case 1
      display("-2x-4y=-20 \n 2x+4y=20")
      tam=2;
      A=[-2 -4;2 4]
      disp ('La matriz A es: ')
      display(A)
      b=[-20;20];
      disp ('b es: ')
      display(b)
        
      det=1;
      Aux=A;
      %llamo a calcular el determinante
      deter();
      display(det)
      %si el determinante de A es 0 no existe solucion unica
      if(det==0)
        %calculo el determinante de x, y, ... demas variables dependiendo del tamaño
        for i=1:2
          Aux=A;
          %hago la matriz de x y y para calcular el determinante
          Aux(:,i)=b;
          Aux
          %llamo a calcular el determinante
          deter();
          display(det)
          %si algun determinante es diferente de 0, entonces no tiene solucion
          if det!=0 
            display("El sistema no tiene solucion")
            return
          endif
          
        endfor
        %si todos los determinantes fueron 0, entonces hay soluciones infinitas
        display("El sistema tiene infinitas soluciones")
        return
      endif

    case 2
      display("-2x-4y=-20 \n 2x+4y=10")
      tam=2;
      A=[-2 -4;2 4]
      disp ('La matriz A es: ')
      display(A)
      b=[-20;10];
      disp ('b es: ')
      display(b)
        
      det=1;
      Aux=A;
      %llamo a calcular el determinante
      deter();
      display(det)
      %si el determinante de A es 0 no existe solucion unica
      if(det==0)
        %calculo el determinante de x, y, ... demas variables dependiendo del tamaño
        for i=1:2
          Aux=A;
          %hago la matriz para calcular el determinante
          Aux(:,i)=b;
          
          %llamo a calcular el determinante
          deter();
          display(det)
          %si algun determinante es diferente de 0, entonces no tiene solucion
          if det!=0 
            display("El sistema no tiene solucion")
            return
          endif
          
        endfor
        %si todos los determinantes fueron 0, entonces hay soluciones infinitas
        display("El sistema tiene infinitas soluciones")
        return
      endif
          
    case 3
      tam=input('Ingrese el tamaño n de la matriz:');
      display("Se procederán a ingresar los valores de A: ")
      %guardar los elementos de la matriz A, posicion por posicion
      for i=1:tam
        for j=1:tam
          disp(['El elemento (',num2str(i),',',num2str(j),')'])
          A(i,j)=input('');
        end
      end
      disp ('La matriz A es: ')
      display(A)
      %guardar los elementos de la matriz b, posicion por posicion
      display("Se procederán a ingresar los valores de b: ")
      for i=1:tam
        disp(['El elemento (',num2str(i),')'])
        b(i,:)=input('');
      end
      disp ('b es: ')
      display(b)
      
      det=1;
      Aux=A;
      %llamo a calcular el determinante
      deter();
      %si el determinante de A es 0 no existe solucion unica
      if(det==0)
        %calculo el determinante de x, y, ... demas variables dependiendo del tamaño
        for i=1:2
          Aux=A;
          %hago la matriz para calcular el determinante
          Aux(:,i)=b;
          
          %llamo a calcular el determinante
          deter();
          %si algun determinante es diferente de 0, entonces no tiene solucion
          if det!=0 
            display("El sistema no tiene solucion")
            return
          endif
          
        endfor
        %si todos los determinantes fueron 0, entonces hay soluciones infinitas
        display("El sistema tiene infinitas soluciones")
        return
      endif

      display("Se procederá a hacer la matriz ampliada")
      %armo la matriz ampliada
      AI=[A eye(tam)];
      display(AI)
      display("Se procederá a realizar la inversa")
      %hago la inversa
      for j=1:tam %recorro columna
        for i=1:tam % recorro fila
          %si estoy en la posicion diagonal se debe dividir para ese nuumero
          %para hacer 1
          
          if i==j 
            %hago 1 dividiendo para el valor en esa posicion
            AI(i,:)=AI(i,:)/AI(i,j);
            display(AI)
          endif
            
          %si no estoy en la diagonal, tengo que hacer los 0
          if i!=j
            %Aqui hago la operacion para tener 0 en las demas posiciones
            %la fila actual es igual a la misma fila menos la fila por un valor para hacer 0
            AI(i,:)=AI(i,:)-(AI(i,j)/AI(j,j))*AI(j,:);
            display(AI)
          endif
        endfor
      endfor
      
      %guardo unicamente la inversa
      AI=AI(:,tam+1:tam*2);
      display(AI)
      %multiplico para la solucion
      sol=AI*b;
      display("La solución es: AI*b")
      %%mostrar la solucion
      display(sol)
      for h=1:tam
        disp(['X(',num2str(h),')','=',num2str(sol(h))])
      endfor
      
    otherwise
      display("Opcion incorrecta")
  endswitch

  %cacula el determinante por metodo de gauss (multiplicar diagonal)
  %despues de encontrar la triangular superior
  function deter 
    det=1;
    for j=1:tam % recorro columna
      for i=j:tam % recorro fila
        if i!=j
          %voy haciendo 0 para encontrar la triangular superior
          Aux(i,:)=Aux(i,:)-(Aux(i,j)/Aux(j,j))*Aux(j,:);
        endif
      endfor
      %multiplico la diagonal principal
      det=det*Aux(j,j);
    endfor
  
  endfunction

end
