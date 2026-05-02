function derivadaRegresivaSimpon38
  item=input("Derivada regresiva \n 1. Primera \n 2. Segunda  \nIntegrales Simpson 3/8 \n 3. Extendido \n 4. Normal  \n");
  switch (item)
    case 1
      pkg load symbolic;
      syms x;
      punto=input('Ingrese Xo: ');
      h=input('Ingrese h: ');
      errIng=input('Error: ');
      f=input('Escriba su funcion: ');
      display("La derivada en el punto: \n")
      derivada=diff(f,x);
      derivadaValor=subs(derivada,x,punto);
      real = eval(derivadaValor)

      k=0;
      k(0)=(punto+(0)*h);
      k(1)=(punto+(-1)*h);
      k(2)=(punto+(-2)*h);
      efk=0;
      for i=0:2
        efk(i+1)=f(k(i+1));
      endfor

      display("\nMediante reresiva: ");
      derRe = (3*efk(0)-4*efk(1)+efk(2))/(2*h)
      display("Error absoluto encontrado: ");
      err=abs(real-derRe)


      while (err>errIng)
          h=h/20
          k(0)=(punto+(0)*h);
          k(1)=(punto+(-1)*h);
          k(2)=(punto+(-2)*h);
          efk=0;
          for i=0:2
            efk(i+1)=f(k(i+1));
          endfor
          display("Mediante reresiva: ");
          derRe = (3*efk(0)-4*efk(1)+efk(2))/(2*h)
          display("Error relativo encontrado: ");
          err=abs(real-derRe)

      endwhile

    case 2
      pkg load symbolic;
      syms x;
      display("Segunda Derivada");
      punto=input('Ingrese Xo: ');
      h=input('Ingrese h: ');
      func=input('Escriba su funcion: ')
      errIng=input('Error: ')
      display("La segunda derivada en el punto: ")
      derivada=diff(f, x);
      segderivada=diff(derivada, x);
      derivadaValor=subs(segderivada,x,punto);
      real = eval(derivadaValor)

      k=0;
      k(0)=(punto+(0)*h);
      k(1)=(punto+(-1)*h);
      k(2)=(punto+(-2)*h);
      k(3)=(punto+(-3)*h);

      efk=0;
      for i=0:3
        efk(i+1)=f(k(i+1));
      endfor

      display("\nMediante regresiva: ");
      derRe = (2*efk(0)-5*efk(1)+4*efk(2)-efk(3))/(h^2)

      display("Error relativo encontrado: ");
      err=abs(real-derPro)

      while (err>errIng)
          h=h/20
          k=0;
          k(0)=(punto+(0)*h);
          k(1)=(punto+(-1)*h);
          k(2)=(punto+(-2)*h);
          k(3)=(punto+(-3)*h);
          efk=0;
          for i=0:3
            efk(i+1)=f(k(i+1));
          endfor

          display("Mediante reresiva: ");
          derRe = (2*efk(0)-5*efk(1)+4*efk(2)-efk(3))/(h^2)
          display("Error relativo encontrado: ");
          err=abs(real-derRe)

      endwhile

    case 3
      display("Integracion Compuesta Simpson 3/8");
      %ingreso los datos
      a=input('Ingrese a: ');
      b=input('Ingrese b: ');
      n=input('Ingrese n (multiplo de 3): ');
      %verifico que sea multiplo de 3
      if(mod(n,3)!=0)
          display("n Solo puede ser multiplo de 3")
          return
      endif

      f=input('Ingrese la funcion: ');
      err=input('Ingrese el error: ');
      %calculo la integral exacta
      display("La integral mediante calculo es : \n")
      exacto = integral(f,a,b)

      %calculo h
      h=((b-a)/n)
      %calculo todos los x sub i
      valX=a:h:b;

      k=n+1;
      %sumo el primer y ultimo termino
      primUlt=f(valX(1))+f(valX(k));

      %realizo las sumatorias
      ter2=0;
      for i=2:3:k-2
          ter2=ter2+f(valX(i));
      endfor
      ter3=0;
      for i=3:3:k-1
          ter3=ter3+f(valX(i));
      endfor
      ter4=0;
      for i=4:3:k-3
          ter4=ter4+f(valX(i));
      endfor

      %armo la formula para encontrar la integral
      display("La integral mediante Simpon 3/8 compuesto es : ");
      est=((3*h)/8)*(primUlt+3*ter2+3*ter3+2*ter4)
      %calculo el error
      display("El error encontrado es : ");
      errEnc=abs(exacto-est)
      display("")

      while (errEnc>err)
          n=n+3;
          h=((b-a)/n)

          valX=a:h:b;

          k=n+1;
          primUlt=f(valX(1))+f(valX(k));

          ter2=0;
          for i=2:3:k-2
              ter2=ter2+f(valX(i));
          endfor
          ter3=0;
          for i=3:3:k-1
              ter3=ter3+f(valX(i));
          endfor
          ter4=0;
          for i=4:3:k-3
              ter4=ter4+f(valX(i));
          endfor
          display("La integral mediante Simpon 3/8 compuesto es : ");
          est=((3*h)/8)*(primUlt+3*ter2+3*ter3+2*ter4)

          display("El error encontrado es : ");
          errEnc=abs(exacto-est)
          display("")
      endwhile

    case 4
      display("Integracion Normal Simpson 3/8");
      %ingreso los datos
      a=input('Ingrese a: ');
      b=input('Ingrese b: ');
      f=input('Ingrese la funcion: ')
      %calculo la integral exacta
      display("La integral mediante calculo es : \n")
      exacto = integral(f,a,b)

      %calculo h
      h=((b-a)/3)
      %calculo todos los x sub i
      valX=a:h:b;
      k=3+1;
      %sumo el primer y ultimo termino
      primUlt=f(valX(1))+f(valX(k));
      %sumo el segundo y tercer termino
      ter23=0;
      for i=2:k-1
          ter23=ter23+f(valX(i));
      endfor
      %armo la formula
      display("La integral mediante Simpon 3/8 normal es : ");
      est = ((3*h)/8)*(primUlt+3*ter23)
      display("El error encontrado es : ");
      errEnc=abs(exacto-est)

    otherwise
      display("Opcion incorrecta")
  endswitch
endfunction

