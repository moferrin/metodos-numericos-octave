function resp=NEWTON
 display('Este programa resulve ecuaciones de la forma cos(x)+x/j+kx^3')
 j=input('ingrese el valor de j (debe ser diferente de 0):')
 k=input('ingrese el valor de k')
 %x1=input('ingrese el valor del extremo izquierdo')
% x2=input('ingrese el valor del extremo derecho')
 x=-1:0.01:1;
 y1=cos(x)+x/j+k*x.^3;
 plot(x,y1),grid on, grid minor
 x1=input('ingrese un punto inicial:')
 errorIngresado=input('Ingrese el error')
 %y1=cos(x)+x/j+k*x.^3;
 %fy1=sin(x)+1/j+3*(k*x);
 %x1=x-y1/fy1
 counter=0;
 x2=0;
 while true
       counter=counter+1;   #incrementar el contador 
       y1=cos(x1)+x1/j+k*x1.^3;#func original
       fy1=sin(x1)+1/j+3*(k*x1);#derivada (revisar si esta bien)
       display("aqui")
       x2=x1-y1/fy1;
       errorAbsoluto=abs(x2-x1);
        if errorAbsoluto < errorIngresado
             input= ('ingrese el valor del error relativo')
             display('El numero de iteraciones son:')
             display(counter)
             display(x2)
      break #romper bucle
      endif
      x1=x2;
endwhile
endfunction
       
       