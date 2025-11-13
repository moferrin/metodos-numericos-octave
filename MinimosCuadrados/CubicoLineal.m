function CubicoLineal
  clc;
  op = input("1. Lineal \n2. Cubico: ");
  switch (op)
    case 1
      display('Modelo Lineal')
      n = input('Ingrese el numero de puntos: ');
      for i=1:n
        x(i)=input(['x(',num2str(i),'): ']);
        y(i)=input(['y(',num2str(i),'): ']);
      endfor

      sumX=0;
      sumY=0;
      sumXC=0;
      sumXY=0;
      for i=1:n
        sumX=sumX+x(i);
        sumY=sumY+y(i);
        sumXC=sumXC+(x(i)*x(i));
        sumXY=sumXY+(x(i)*y(i));
      endfor

      A=[n sumX;sumX sumXC]
      b=[sumY; sumXY]


      a1=((-sumX*sumXY)+(sumY*sumXC))/((-sumX*sumX)+(n*sumXC));
      a2=((sumXY-(sumX*(a1)))/sumXC);

      display(['El modelo encontrado es: y=',num2str(a1),'+ (',num2str(a2),')x'])
      x1=min(x)-0.1:0.1:max(x)+0.1;
      y1=a1+a2.*x1;
      plot(x,y,'*',x1,y1,'g','LineWidth',0.5)
      grid on;
      grid minor;

      %Error relativo

      aux1=y1=a1+a2.*x;
      ax2=((y-aux1)/y)*100;
      display(['El error relativo es: ', num2str(ax2),'%'])


    case 2
      display('Modelo Cubico')
      n = input('Ingrese el numero de puntos: ');
      for i=1:n
        x(i)=input(['x(',num2str(i),'): ']);
        y(i)=input(['y(',num2str(i),'): ']);
      endfor

      sumX=0;
      sumY=0;
      sumX2=0;
      sumX3=0;
      sumX4=0;
      sumX5=0;
      sumX6=0;
      sumXY=0;
      sumX2Y=0;
      sumX3Y=0;

      for i=1:n
        sumX=sumX+x(i);
        sumY=sumY+y(i);
        sumX2=sumX2+(x(i))^2;
        sumX3=sumX3+(x(i))^3;
        sumX4=sumX4+(x(i))^4;
        sumX5=sumX5+(x(i))^5;
        sumX6=sumX6+(x(i))^6;
        sumXY = sumXY + (x(i)*y(i));
        sumX2Y = sumX2Y + ((x(i)^2)*y(i));
        sumX3Y = sumX3Y + ((x(i))^3*y(i));
      endfor

      A=[n sumX sumX2 sumX3; sumX sumX2 sumX3 sumX4; sumX2 sumX3 sumX4 sumX5;
      sumX3 sumX4 sumX5 sumX6]

      b=[sumY; sumXY; sumX2Y; sumX3Y]

      C=[A b];
      for p=1:n
        for k=[1:p-1,p+1:n]
          if C(p,p)==0
            break
          end
          valor=C(k,p)/C(p,p);
          C(k,:)=C(k,:)-valor*C(p,:);
        end
       end
      X=C(:,n+1)./diag(C);

      a1=X(1)
      a2=X(2)
      a3=X(3)
      a4=X(4)

      display(['El modelo es: y=',num2str(a1),'+(',num2str(a2),'x)+(',num2str(a3),'x^2)+(',num2str(a4),'x^3)'])

      x1=min(x)-0.1:0.1:max(x)+0.1;
      y1=a1+a2.*x1 + a3.*x1.^2 + a4.*x1.^3;
      plot(x,y,'*',x1,y1,'g','LineWidth',0.5)
      grid on;
      grid minor;


       %Error relativo

      aux1=y1=a1+a2.*x;
      ax2=((y-aux1)/y)*100;
      display(['El error relativo es: ', num2str(ax2),'%'])
    otherwise
      display("Opcion incorrecta");
  endswitch
endfunction
