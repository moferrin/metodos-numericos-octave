function grupoAlissronDerivada
  warning('off','all');
  clc;
  op=input("Seleccione una opcion Derivada Regresiva \n 1. Primera Derivada \n 2. Segunda Derivada  \n");
  switch (op)
    case 1
      display("Primera Derivada");
      %cargo el paqute symbolic
      pkg load symbolic;
      %defino la variable
      syms x;
            
      xo=input('Ingrese X0: ');
      h=input('Ingrese h: ');
      f=input('Ingrese la funcion: ');
      err=input('Ingrese el error: ');
      display("La derivada mediante calculo es : \n")
      %derivo la funci�n
      g=diff(f,x)
      %evaluo la funcion en el punto
      dernum=subs(g,x,xo);
      exacto = eval(dernum)
      
      %ahora le derivada regresiva
      va0 = (xo+0*h)
      va1 = (xo-1*h)
      va2 = (xo-2*h)
      %evaluo en los f sub k
      f0 = eval(subs(f,x,va0))
      f1 = eval(subs(f,x,va1))
      f2 = eval(subs(f,x,va2))
      
      display("La derivada mediante derivacion numerica regresiva es : ");
      est = (3*f0-4*f1+f2)/(2*h)
      display("El error encontrado es : ");
      errEnc=abs(exacto-est)
      display("")
      
      while (errEnc>err)
          h=h/10
          va0 = (xo+0*h)
          va1 = (xo-1*h)
          va2 = (xo-2*h)
          f0 = eval(subs(f,x,va0))
          f1 = eval(subs(f,x,va1))
          f2 = eval(subs(f,x,va2))
          display("La derivada mediante derivacion numerica regresiva es : ");
          est = (3*f0-4*f1+f2)/(2*h)
          display("El error encontrado es : ");
          errEnc=abs(exacto-est)
          display("")
      endwhile
     
    case 2
      display("Segunda Derivada");
      pkg load symbolic;
      syms x;
      
      xo=input('Ingrese X0: ');
      h=input('Ingrese h: ');
      f=input('Ingrese la funci�n: ')
      err=input('Ingrese el error: ')
      display("La segunda derivada mediante c�lculo es : ")
      %derivo la funci�n
      g=diff(f, x)
      %derivo la funci�n (segunda derivada)
      g=diff(g, x)
      %evaluo la funcion en el punto
      dernum=subs(g,x,xo);
      exacto = eval(dernum)
      %ahora le derivada regresiva
      va0 = (xo+0*h)
      va1 = (xo-1*h)
      va2 = (xo-2*h)
      va3 = (xo-3*h)
      %evaluo en los f sub k
      f0 = eval(subs(f,x,va0))
      f1 = eval(subs(f,x,va1))
      f2 = eval(subs(f,x,va2))
      f3 = eval(subs(f,x,va3))
      
      display("La segunda derivada mediante derivaci�n num�rica regresiva es : ");
      est = (2*f0-5*f1+4*f2-f3)/(h^2)
      
      display("El error encontrado es : ");
      errEnc=abs(exacto-est)
      display("")
      
      while (errEnc>err)
          h=h/10
          va0 = (xo+0*h)
          va1 = (xo-1*h)
          va2 = (xo-2*h)
          va3 = (xo-3*h)
          f0 = eval(subs(f,x,va0))
          f1 = eval(subs(f,x,va1))
          f2 = eval(subs(f,x,va2))
          f3 = eval(subs(f,x,va3))
          
          display("La segunda derivada mediante derivaci�n num�rica regresiva es : ");
          est = (2*f0-5*f1+4*f2-f3)/(h^2)
          display("El error encontrado es : ");
          errEnc=abs(exacto-est)
          display("")
      endwhile     
  
    otherwise
      display("Opcion incorrecta")
  endswitch

end