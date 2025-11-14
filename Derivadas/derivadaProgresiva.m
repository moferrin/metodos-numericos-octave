function derivadaProgresiva
  warning('off','all');
  %Carga la libreria symbolic, debe estar instalada
  pkg load symbolic;
  syms x;
  clc;
  m=input(" 1. Primera Derivada \n 2. Segunda Derivada  \n");
  switch (m)
    case 1
      X0=input('Ingrese el punto a evaluar X0: ');
      h=input('Ingrese el h: ');
      erUsu=input('Error a comparar: ');
      func=input('Escriba la funcion a derivar: ');
      display("La derivada mediante calculo es : \n")
      %Derivo la funcion ingresada
      der=diff(func,x);
      
      valDerExac = eval(subs(der,x,X0))
      
      %progresiva
      arg = (X0+0*h);
      arg2 = (X0+1*h);
      arg3 = (X0+2*h);
      %evaluar la funcion en los puntos
      ter1 = eval(subs(func,x,arg));
      ter2 = eval(subs(func,x,arg2));
      ter3 = eval(subs(func,x,arg3));
      
      display("La primera derivada numerica progresiva es : ");
      valDerAprox = (-3*ter1+4*ter2-ter3)/(2*h)
      display("El error absoluto encontrado es : ");
      errAbs=abs(valDerExac-valDerAprox)
      display("")
      
      while (errAbs>erUsu)
          h=h/10
          arg = (X0+0*h);
          arg2 = (X0+1*h);
          arg3 = (X0+2*h);
          ter1 = eval(subs(func,x,arg));
          ter2 = eval(subs(func,x,arg2));
          ter3 = eval(subs(func,x,arg3));
          display("\n La primera derivada numerica progresiva es : ");
          valDerAprox = (-3*ter1+4*ter2-ter3)/(2*h)
          display("El error absoluto encontrado es : ");
          errAbs=abs(valDerExac-valDerAprox)
          
      endwhile
     
    case 2
      display("Segunda Derivada");
      X0=input('Ingrese el punto a evaluar X0: ');
      h=input('Ingrese h: ');
      func=input('Escriba la funcion a derivar: ')
      erUsu=input('Error a comparar: ')
      display("La segunda derivada mediante calculo es : ")
      %Derivo la funcion ingresada
      der=diff(func, x);
      %Derivo la funcion ingresada nuevamente
      der2=diff(der, x);
      valDerExac = eval(subs(der2,x,X0))
      
      %progresiva
      arg = (X0+0*h);
      arg2 = (X0+1*h);
      arg3 = (X0+2*h);
      arg4 = (X0+3*h);
      
      %evaluar la funcion en los puntos
      ter1 = eval(subs(func,x,arg));
      ter2 = eval(subs(func,x,arg2));
      ter3 = eval(subs(func,x,arg3));
      ter4 = eval(subs(func,x,arg4));
      
      display("La segunda derivada numerica progresiva es : ");
      valDerAprox = (2*ter1-5*ter2+4*ter3-ter4)/(h^2)
      
      display("El error absoluto encontrado es : ");
      errAbs=abs(valDerExac-valDerAprox)
      display("")
      
      while (errAbs>erUsu)
          h=h/10
          arg = (X0+0*h);
          arg2 = (X0+1*h);
          arg3 = (X0+2*h);
          arg4 = (X0+3*h);
          
          ter1 = eval(subs(func,x,arg));
          ter2 = eval(subs(func,x,arg2));
          ter3 = eval(subs(func,x,arg3));
          ter4 = eval(subs(func,x,arg4));
          
          display("\n La segunda derivada numerica progresiva es : ");
          valDerAprox = (2*ter1-5*ter2+4*ter3-ter4)/(h^2)
          display("El error absoluto encontrado es : ");
          errAbs=abs(valDerExac-valDerAprox)
          display("")
      endwhile     
  
    otherwise
      display("Opcion incorrecta")
  endswitch 
end