function edoDifFinitas

  N=input('Ingrese el tamaño de N: ');
  LS = 15;
  y_0=1.5;
  y_N=0.008796;

  h=(LS-0)/N;

  display(["EL valor de h que se usará es: ",num2str(h)])

  % Constantes EDO
  C1 = (2-(48/15)*h)
  C2 = (-2+(16/15)*h^2)*2
  C3 = (2+(48/15)*h)

  C = [C1, C2, C3];

  %El sistema de ecuaciones siempre es N-1
  n = N-1;

  % Inicializar la matriz A con ceros
  A = zeros(n);

  %Armo la matriz para el sistema de ecuaciones
  for i = 1:n

     if(i==1)
       for k=1:3
           if(k>1)
             A(i,k+i-2) = C(k);
           endif
       endfor
     endif


    if((i>1) && (i<n))
      for k=1:3
        A(i,k+i-2) = C(k);
      endfor
    endif

     if(i==n)
       for k=1:3
           if(k<3)
             A(i,k+i-2) = C(k);
           endif
       endfor
     endif
  endfor

  b_0 = -(y_0*C1);
  b_N = -(y_N*C3);

  b=[b_0; zeros(1, n-2)'; b_N];

  resp = inv(A)*b;

  x = 0:h:LS;
  y = [y_0 resp' y_N];

  plot(x,y)
  grid on;
  grid minor;


  ylabel("y'' + (48/15)y' + (16/15)y = 0, y(0)=1.5, y(N)=0.008796, y'(0) = 2",'FontSize', 18);
  xlabel('t(s)', 'FontSize', 18);
  title("Gráfico de la ecuacion de movimiento en el tiempo ",'FontSize', 18)


endfunction



