function muller
  clc
  display("La ecuacion: log10(x/A)*cos(x/B)")
  A=input('A: ');
  B=input('B: ');

  if (A==0 || B==0)
    display('A o B no pueden ser 0')
    return
  endif
hold on;
  if (A<0)
    r=-12:0.001:-0.000000000000001;
    plot(r, log10(r/A).*cos(r/B));
   else
    r=0.000000000000001:0.1:12;
    plot(r, log10(r/A).*cos(r/B));
  endif
  grid on;
  grid minor;

  x2=input('x2: ');
  x1=input('x1: ');
  x0=input('x0: ');

  errU=input('Tamaño del error: ');

  band=true;
  i=0;
while (band)
  format long;
  display('Iteracion: ')
  i=i+1

  evax2=log10(x2/A).*cos(x2/B);
  evax1=log10(x1/A).*cos(x1/B);
  evax0=log10(x0/A).*cos(x0/B);

  fx2x1 = (evax2-evax1)/(x2-x1);
  fx1x0 = (evax1-evax0)/(x1-x0);
  fx2x1x0 = (fx2x1-fx1x0)/(x2-x0);

  a2=fx2x1x0;
  a1=fx2x1 - (x2+x1)*a2;
  a0=evax2 -x2*(fx2x1 - x1*a2);

  ant1=-a1+(a1^2 -4*a0*a2)^(1/2);
  ant2=-a1-(a1^2 -4*a0*a2)^(1/2);

  %decido en funcion de cual es mayor con valor absoluto
  if(abs(ant1)>abs(ant2))
    x3=(2*(a0))/(ant2)
  else
    x3=(2*(a0))/(ant1)
  endif

  display('Error relativo: ')

  errRel = abs((x3-x2)/(x3))*100
  if(errRel<errU)
    band=false;
  endif

  x0=x1;
  x1=x2;
  x2=x3;

  display("  \n")
endwhile
plot(x3,log10(x3/A).*cos(x3/B),'r')
endfunction
