function grupoAlissonIntegral
warning('off','all');
  clc;
  op=input("Seleccione una opcion Integracion Simpson 3/8 \n 1. Compuesto \n 2. Normal  \n");
  switch (op)
    case 1
      display("Integracion Compuesta Simpson 3/8");
      pkg load symbolic;
      syms x;
      %ingreso los datos
      a=input('Ingrese a: ');
      b=input('Ingrese b: ');
      n=input('Ingrese n: ');
      %verifico que sea multiplo de 3
      if(mod(n,3)!=0)
          display("n Solo puede ser multiplo de 3")
          return
      endif
          
      f=input('Ingrese la funcion: ')
      err=input('Ingrese el error: ')
      %calculo la integral exacta
      display("La integral mediante calculo es : \n")
      g=int(f,x,a,b);
      exacto = eval(g)
      
      %calculo h
      h=((b-a)/n)
      %calculo todos los x sub i
      valX=a:h:b;
      
      k=n+1;
      %sumo el primer y ultimo termino
      primUlt=eval(subs(f,x,valX(1))+subs(f,x,valX(k)));
      
      %realizo las sumatorias    
      ter2=0;
      for i=2:3:k-2
          ter2=ter2+eval(subs(f,x,valX(i)));
      endfor
      ter3=0;
      for i=3:3:k-1
          ter3=ter3+eval(subs(f,x,valX(i)));
      endfor
      ter4=0;
      for i=4:3:k-3
          ter4=ter4+eval(subs(f,x,valX(i)));
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
          primUlt=eval(subs(f,x,valX(1))+subs(f,x,valX(k)));
                    
          ter2=0;
          for i=2:3:k-2
              ter2=ter2+eval(subs(f,x,valX(i)));
          endfor
          ter3=0;
          for i=3:3:k-1
              ter3=ter3+eval(subs(f,x,valX(i)));
          endfor
          ter4=0;
          for i=4:3:k-3
              ter4=ter4+eval(subs(f,x,valX(i)));
          endfor
          display("La integral mediante Simpon 3/8 compuesto es : ");
          est=((3*h)/8)*(primUlt+3*ter2+3*ter3+2*ter4)
          
          display("El error encontrado es : ");
          errEnc=abs(exacto-est)
          display("")
      endwhile
            
    case 2
      display("Integracion Normal Simpson 3/8");
      pkg load symbolic;
      syms x;
      %ingreso los datos
      a=input('Ingrese a: ');
      b=input('Ingrese b: ');
      f=input('Ingrese la funcion: ')
      %calculo la integral exacta
      display("La integral mediante calculo es : \n")
      g=int(f,x,a,b);
      exacto = eval(g)
      
      %calculo h
      h=((b-a)/3)
      %calculo todos los x sub i
      valX=a:h:b;
      k=3+1;
      %sumo el primer y ultimo termino
      primUlt=eval(subs(f,x,valX(1))+subs(f,x,valX(k)));
      %sumo el segundo y tercer termino
      ter23=0;
      for i=2:k-1
          ter23=ter23+eval(subs(f,x,valX(i)));
      endfor
      %armo la formula
      display("La integral mediante Simpon 3/8 normal es : ");
      est = ((3*h)/8)*(primUlt+3*ter23)
      display("El error encontrado es : ");
      errEnc=abs(exacto-est)
      
    otherwise
      display("Opcion incorrecta")
  endswitch

end