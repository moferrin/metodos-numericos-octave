function derivadaCentradaIntegralCuadratura
  warning('off','all');
  pkg load symbolic;
  syms x;
  clc;
  m=input("1. Derivadas centradas Primera  \n2. Derivadas centradas Segunda \n \n3. Integrales Cuadratura 4 \n4. Integrales Cuadratura 5  \n5. Integrales Cuadratura 6  \n");
  switch (m)
    case 1
      X0=input('X0: ');
      h=input('h: ');
      erUsu=input('Error a comparar: ');
      func=input('Funcion: ');
      display("La derivada mediante calculo es : \n")
      %Derivo la funcion ingresada
      der=diff(func,x);

      real = eval(subs(der,x,X0))

      aproximado = (func(X0+1*h)-func(X0-1*h))/(2*h);
      display(["\nLa primera derivada numerica centrada es : ",aproximado]);

      err=abs((aproximado-real)/real);
      display(["El error relativo encontrado es: ",num2str(err)])

      while (err>erUsu)
          h=h/10
          aproximado = (func(X0+1*h)-func(X0-1*h))/(2*h);
          display(["\nLa primera derivada numerica centrada es : ",aproximado]);
          err=abs((aproximado-real)/real);
          display(["El error relativo encontrado es: ",num2str(err)])

      endwhile

    case 2
      X0=input('X0: ');
      h=input('h: ');
      func=input('Funcion: ');
      erUsu=input('Error a comparar: ');
      display("La segunda derivada mediante calculo es : ")
      %Derivo la funcion ingresada
      der=diff(func, x);
      %Derivo la funcion ingresada nuevamente
      derd=diff(der, x);
      real = eval(subs(derd,x,X0))

      aproximado = (func(X0+1*h)-2*func(X0+0*h)+func(X0-1*h))/(h^2);
      display(["\nLa segunda derivada numerica centrada es : ",aproximado]);


      err=abs((aproximado-real)/real)*100;
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      while (err>erUsu)
          h=h/10

          aproximado = (func(X0+1*h)-2*func(X0+0*h)+func(X0-1*h))/(h^2);
          display(["\nLa segunda derivada numerica centrada es : ",aproximado]);
          err=abs((aproximado-real)/real)*100;
          display(["El error relativo encontrado es: ",num2str(err),"% \n"])

      endwhile

    case 3
      funci=input('Escriba la funcion: ');
      lS=input('Limite superior: ');
      lI=input('Limite inferior: ');
      display("La solucion integral exacta es : \n")
      real = integral(funci,lI,lS)

      z4=0.8611363116;
      z1=-z4;
      z3=0.3399810436;
      z2=-z3;

      w1=0.3478548451;
      w4=w1;
      w2=0.6521451549;
      w3=w2;

      y1=((lS-lI)/2)*(z1+1)+lI;
      y2=((lS-lI)/2)*(z2+1)+lI;
      y3=((lS-lI)/2)*(z3+1)+lI;
      y4=((lS-lI)/2)*(z4+1)+lI;

      sumas = w1*funci(y1)+w2*funci(y2)+w3*funci(y3)+w4*funci(y4);

      cuadratura = ((lS-lI)/2)*sumas;
      display(["\nLa integral mediante cuadraturas 4 puntos es : ",cuadratura]);

      err=abs((cuadratura-real)/real)*100;
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])



    case 4
      funci=input('Escriba la funcion: ');
      lS=input('Limite superior: ');
      lI=input('Limite inferior: ');
      display("La solucion integral exacta es : \n")
      real = integral(funci,lI,lS)

      z5=0.9061798459;
      z1=-z5;
      z4=0.5384693101;
      z2=-z4;
      z3=0;

      w1=0.2369268851;
      w5=w1;
      w2=0.4786286705;
      w4=w2;
      w3=128/225;

      y1=((lS-lI)/2)*(z1+1)+lI;
      y2=((lS-lI)/2)*(z2+1)+lI;
      y3=((lS-lI)/2)*(z3+1)+lI;
      y4=((lS-lI)/2)*(z4+1)+lI;
      y5=((lS-lI)/2)*(z5+1)+lI;


      sumas = w1*funci(y1)+w2*funci(y2)+w3*funci(y3)+w4*funci(y4)+w5*funci(y5);

      cuadratura = ((lS-lI)/2)*sumas;
      display(["\nLa integral mediante cuadraturas 5 puntos es : ",cuadratura]);

      err=abs((cuadratura-real)/real)*100;
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])




    case 5
      funci=input('Escriba la funcion: ');
      lS=input('Limite superior: ');
      lI=input('Limite inferior: ');
      display("La solucion integral exacta es : \n")
      real = integral(funci,lI,lS)


      z6=0.9324695142;
      z1=-z6;
      z5=0.6612093865;
      z2=-z5;
      z4=0.2386191861;
      z3=-z4;

      w1=0.1713244924;
      w6=w1;
      w2=0.3607615730;
      w5=w2;
      w3=0.4679139346;
      w4=w3;

      y1=((lS-lI)/2)*(z1+1)+lI;
      y2=((lS-lI)/2)*(z2+1)+lI;
      y3=((lS-lI)/2)*(z3+1)+lI;
      y4=((lS-lI)/2)*(z4+1)+lI;
      y5=((lS-lI)/2)*(z5+1)+lI;
      y6=((lS-lI)/2)*(z6+1)+lI;

      sumas = w1*funci(y1)+w2*funci(y2)+w3*funci(y3)+w4*funci(y4)+w5*funci(y5)+w6*funci(y6);

      cuadratura = ((lS-lI)/2)*sumas;
      display(["\nLa integral mediante cuadraturas 6 puntos es : ",cuadratura]);

      err=abs((cuadratura-real)/real);
      display(["El error relativo encontrado es: ",num2str(err),"% \n"])


    otherwise
      display("Opcion incorrecta")
  endswitch
end
