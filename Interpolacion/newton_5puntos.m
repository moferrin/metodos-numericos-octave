clc
clear all
close all

disp('------------------------- INTERPOLACIÓN DE NEWTON ----------------------------')
disp('Este es un programa el cual resuelve sistemas mediante interpolación de newton');

x1=input('Ingrese el valor para x1:');
x2=input('Ingrese el valor para x2:');
%Ingreso de datos para que no se repitan los puntos 
while x2==x1
  disp('El valor de x2 no puede ser igual a x1');
  x2=input('Ingrese el valor para x2:');
end
x3=input('Ingrese el valor para x3:');
while x3==x1
  disp('El valor de x3 no puede ser igual a x1');
  x3=input('Ingrese el valor para x3:');
end
while x3==x2
  disp('El valor de x3 no puede ser igual a x2');
  x3=input('Ingrese el valor para x3:');
  while x3==x1
   disp('El valor de x3 no puede ser igual a x1');
   x3=input('Ingrese el valor para x3:');
  end
end
x4=input('Ingrese el valor para x4:');
while x4==x1
  disp('El valor de x4 no puede ser igual a x1');
  x4=input('Ingrese el valor para x4:');
end
while x4==x2
  disp('El valor de x4 no puede ser igual a x2');
  x4=input('Ingrese el valor para x4:');
  if x4==x1
    disp('El valor de x4 no puede ser igual a x1');
    x4=input('Ingrese el valor para x4:');
  endif
end
while x4==x3
  disp('El valor de x4 no puede ser igual a x3');
  x4=input('Ingrese el valor para x4:');
  if x4==x1
    disp('El valor de x4 no puede ser igual a x1');
    x4=input('Ingrese el valor para x4:');
    if x4==x2
      disp('El valor de x4 no puede ser igual a x2');
      x4=input('Ingrese el valor para x4:');
    endif
  endif
  if x4==x2
    disp('El valor de x4 no puede ser igual a x2');
    x4=input('Ingrese el valor para x4:');
    if x4==x1
      disp('El valor de x4 no puede ser igual a x1');
      x4=input('Ingrese el valor para x4:');
    endif
  endif 
end
x5=input('Ingrese el valor para x5:');
while x5==x1
  disp('El valor de x5 no puede ser igual a x1');
  x5=input('Ingrese el valor para x5:');
end
while x5==x2
  disp('El valor de x5 no puede ser igual a x2');
  x5=input('Ingrese el valor para x5:');
  if x5==x1
    disp('El valor de x5 no puede ser igual a x1');
    x5=input('Ingrese el valor para x5:');
  endif 
end
while x5==x3
  disp('El valor de x5 no puede ser igual a x3');
  x5=input('Ingrese el valor para x5:');
  if x5==x1
    disp('El valor de x5 no puede ser igual a x1');
    x5=input('Ingrese el valor para x5:');
    if x5==x2
      disp('El valor de x5 no puede ser igual a x2');
      x5=input('Ingrese el valor para x5:');
    endif 
  endif
  if x5==x2
    disp('El valor de x5 no puede ser igual a x2');
    x5=input('Ingrese el valor para x5:');
    if x5==x1
      disp('El valor de x5 no puede ser igual a x1');
      x5=input('Ingrese el valor para x5:');
    endif 
  endif
end
while x5==x4
  disp('El valor de x5 no puede ser igual a x4');
  x5=input('Ingrese el valor para x5:');
  if x5==x1
    disp('El valor de x5 no puede ser igual a x1');
    x5=input('Ingrese el valor para x5:');
    if x5==x2
      disp('El valor de x5 no puede ser igual a x2');
      x5=input('Ingrese el valor para x5:');
      if x5==x3
        disp('El valor de x5 no puede ser igual a x3');
        x5=input('Ingrese el valor para x5:');
      endif
    endif
  endif 
  if x5==x2
    disp('El valor de x5 no puede ser igual a x2');
    x5=input('Ingrese el valor para x5:');
    if x5==x1
      disp('El valor de x5 no puede ser igual a x1');
      x5=input('Ingrese el valor para x5:');
      if x5==x3
        disp('El valor de x5 no puede ser igual a x3');
        x5=input('Ingrese el valor para x5:');
      endif
    endif
  endif
  if x5==x3
    disp('El valor de x5 no puede ser igual a x3');
    x5=input('Ingrese el valor para x5:');
    if x5==x1
      disp('El valor de x5 no puede ser igual a x1');
      x5=input('Ingrese el valor para x5:');
      if x5==x2
        disp('El valor de x5 no puede ser igual a x2');
        x5=input('Ingrese el valor para x5:');
      endif
    endif
    if x5==x2
      disp('El valor de x5 no puede ser igual a x2');
      x5=input('Ingrese el valor para x5:');
      if x5==x1
        disp('El valor de x5 no puede ser igual a x1');
        x5=input('Ingrese el valor para x5:');
      endif
    endif
  endif
end

y1=input('Ingrese el valor para y1:');
y2=input('Ingrese el valor para y2:');
y3=input('Ingrese el valor para y3:');
y4=input('Ingrese el valor para y4:');
y5=input('Ingrese el valor para y5:');


m112=(y2-y1)/(x2-x1)
m123=(y2-y3)/(x2-x3)
m134=(y4-y3)/(x4-x3)
m145=(y4-y5)/(x4-x5)
m212=(m123-m112)/(x3-x1)
m223=(m134-m123)/(x4-x2)
m234=(m145-m134)/(x5-x3)
m312=(m223-m212)/(x4-x1)
m323=(m234-m223)/(x5-x2)
m412=(m323-m312)/(x5-x1)




p1=[0 0 0 0 y1]
p2=[0 0 0 0 m112*poly(x1)]
p3=[0 0 m212*poly([x1 x2])]
p4=[0 m312*poly([x1 x2 x3])]
p5=[m412*poly([x1 x2 x3 x4])]
disp('El polinomio de Newton es :')

px=polyout(p1+p2+p3+p4+p5,'x')
pxr=p1+p2+p3+p4+p5
px1=polyval(pxr,x1)
px2=polyval(pxr,x2)
px3=polyval(pxr,x3)
px4=polyval(pxr,x4)
px5=polyval(pxr,x5)

% Grafica con los puntos %
x12=x1-0.5:0.1:x5+0.5;
X1=[x1 x2 x3 x4 x5];
Y1=[y1 y2 y3 y4 y5];
plot(X1,Y1,'r*'),grid on,hold on

y12=pxr(1)*x12.^4+pxr(2)*x12.^3+pxr(3)*x12.^2+pxr(4)*x12+pxr(5);
plot(x12,y12)
legend('puntos or.','Int. Newton');
