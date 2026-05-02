function metodoLU
  clc;
  display("METODO LU")
  A=input("\nIngreso de la matriz ampliada (A): ")

  tamanio = size(A);

  if(tamanio(1)!=tamanio(2))
    display("La matriz ingresada no es cuadrada")
    return
  endif

  b = input("Ingreso de los terminos independientes: ")

  tamanio2 = size(b);

  if(tamanio2(1)!=tamanio(1))
    display("el numero de terminos independientes debe ser igual al numero de ecuaciones (filas)")
    return
  endif

  n = length(A);

  %CREO UNA VARIABLE PARA VERIFICAR SI EL SISTEMA SE PUEDE RESOLVER
  det=1;
  determinante();
  if(det==0)
    display("El sistema no tiene solucion o tiene infinitas soluciones")
    return
  endif


  % COMIENZO A APLICAR EL METODO PARA ENCONTRAR L y U

   L = eye(n);

   U=A;

   %Hago 0 la triangular inferior
   for i=1:n
     for j=i+1:n
       multiplicador = (U(j,i)/U(i,i))
       %AQUI OPERO PARA ENCONTRAR L y U
       U(j,:) = U(j,:) - multiplicador*U(i,:)
       L(j,i) = multiplicador
       display("\n ")
     endfor
   endfor


   display("C = [L b]")

   C = [L b]

  z = zeros(n);

  z = z(1,:);


  %AQUI SE TRABAJA CON L
  %UNA VEZ QUE ENCUENTRE L y U, SE DEBE REEMPLAZAR Y DESPEJAR PARA ENCONTAR
  %LOS a,b,c,d,... que aqui los llamamos z(i)

  %EL Z_1 SIEMPRE VA A ESTAR DESPEJADO YA QUE LA MATRIZ TIENE 1 EN SU DIAGONAL
  display("Reemplazando y sumando en las incognitas ya obtenidas")
  display("EL Z_1 SIEMPRE VA A ESTAR DESPEJADO YA QUE LA MATRIZ TIENE 1 EN SU DIAGONAL")
  z(1) = C(1,n+1)

  %TRABAJO EN LA MATRIZ TRIANGULAR INFERIOR
  for i=2:n
    for j=1:i-1
      %REEMPLAZO LOS VALORES ()
      display("Reemplazando y sumando en las incognitas ya obtenidas")
      z(i) = C(i,j)*z(j) + z(i)
    endfor

    %DESPEJO EL VALOR DE LA INCOGNITA
    display("\n Despejando para encontrar la nueva incognita \n ")

    z(i) = C(i,n+1) - z(i)

    display("\n ")

  endfor

  y=z;
  z=[];



  for i=1:n
    z(i,1) = y(i);
  endfor

  z


  %AQUI SE TRABAJA CON U
  %UNA VEZ QUE SE ENCUENTRAN LOS a,b,c,d,... ESTOS SE ANIADEN EN LA ULTIMA
  %COLUMNA DE TAL FORMA QUE SE PUEDAN ENCONTRAR LOS VALORES DE X

  display("X = [U z]")

  X = [U z]

  display("Se repite el mismo procedimiento anterior pero en este caso se reeemplaza hacia arriba")

  %LA VARIABLE LLAMADA auxiliar SON LOS VALORES DE LAS x
  auxiliar = zeros(n);
  auxiliar(1,n) = X(n,n+1)/X(n,n);
  auxiliar = auxiliar(1,:);

  %TRABAJO EN LA MATRIZ TRIANGULAR SUPERIOR
  for i=n-1:-1:1
    for j=i+1:n
      %REEMPLAZO LOS VALORES ()
      auxiliar(i) = X(i,j)*auxiliar(j) + auxiliar(i);
    endfor

    %DESPEJO EL VALOR DE LA INCOGNITA
    auxiliar(i) = (X(i,n+1)-auxiliar(i))/X(i,i);

  endfor

  display("Las soluciones al sistema de ecuaciones son: ")
  for i=1:n
    display(["X(",num2str(i),") = ",num2str(auxiliar(i))])
  endfor



  %cacula el determinante para determinar si se puede resolver o no
  function determinante
    Aux = A;
    det=1;
    for j=1:n %columna
      for i=j:n %fila
        if i!=j
          Aux(i,:)=Aux(i,:)-(Aux(i,j)/Aux(j,j))*Aux(j,:);
        endif
      endfor
      det=det*Aux(j,j);
    endfor
  endfunction

endfunction
