function lagrangeTipan
clc;
valX=[0 0 2 0];
valY=[0 0 0 0];
n=4;
for i=1:n-1
  for j=i:n-1
    if (valX(i)==valX(j+1))
      display("no se pueden repetir los valores de X")
    return
    endif
  endfor
endfor

display("\n Para k=1")
%calculo el polinomio en ese k
l1=poly([valX(2) valX(3) valX(4)])/((valX(1)-valX(2))*(valX(1)-valX(3))*(valX(1)-valX(4)));
%muestro el polinomio
L1=polyout(l1,'x')

display("\n Para k=2")
%calculo el polinomio en ese k
l2=poly([valX(1) valX(3) valX(4)])/((valX(2)-valX(1))*(valX(2)-valX(3))*(valX(2)-valX(4)));
%muestro el polinomio
L2=polyout(l2,'x')

display("\n Para k=3")
%calculo el polinomio en ese k
l3=poly([valX(1) valX(2) valX(4)])/((valX(3)-valX(1))*(valX(3)-valX(2))*(valX(3)-valX(4)));
%muestro el polinomio
L3=polyout(l3,'x')

display("\n Para k=4")
%calculo el polinomio en ese k
l4=poly([valX(1) valX(2) valX(3)])/((valX(4)-valX(1))*(valX(4)-valX(2))*(valX(4)-valX(3)));
%muestro el polinomio
L4=polyout(l4,'x')

%sumo todos los polinomios para obtener el polinomio final
%y los voy multiplicando por sus "y"
pSolCoef=l1*valY(1)+l2*valY(2)+l3*valY(3)+l4*valY(4);

%y lo muestro
display(["\n El polinomio solución es: ", polyout(pSolCoef,'x')])

x=min(valX)-0.5:0.1:max(valX)+0.5;

y=pSolCoef(4)+ pSolCoef(3)*x+ pSolCoef(2)*x.^2 + pSolCoef(1)*x.^3;
plot(valX,valY,'*',x,y)
grid on;

endfunction