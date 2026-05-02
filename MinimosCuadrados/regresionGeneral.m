function proyectoMN
  clc;
  op = input("1. Lineal \n2. Cuadratico \n3. Cubico: \n4. Logaritmico: \n5. Exponencial: \n");
  switch (op)
    case 1
      display('Modelo Lineal')
      ver = input("1. Datos estaticos \n2. Ingresar datos: \n");
      x=[];
      y=[];
      if (ver==1)
        x=[10:10:120];
        y=[0.18 0.40 0.65 0.80 0.87 0.92 0.94 0.95 0.95 0.96 0.96 0.97];
      endif
      if (ver==2)
        n=input('Cantidad de datos:');
        for i=1:n
          disp(['Ingrese x(',num2str(i),')'])
          x(i,:)=input('');
        end
        for i=1:n
          disp(['Ingrese y(',num2str(i),')'])
          y(i,:)=input('');
        end
      endif

      n=length(x);
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

      A=[n sumX;sumX sumXC];
      b=[sumY; sumXY];


      a1=((-sumX*sumXY)+(sumY*sumXC))/((-sumX*sumX)+(n*sumXC));
      a2=((sumXY-(sumX*(a1)))/sumXC);

      display(['El modelo encontrado es: y=',num2str(a1),'+ (',num2str(a2),')x'])

      x1=min(x)-0.1:0.1:max(x)+0.1;
      y1=a1+a2.*x1;
      plot(x,y,'*',x1,y1,'g','LineWidth',0.5)
      set(gca,'FontSize',16)
      xlabel('{\itp}O_2 en mmHg')
      ylabel('{\itS}')
      legend('datos originales','recta de ajuste')
      grid on;
      grid minor;

      %Sustituciones
      pO2 = x';
      x = log(pO2);
      S = y';
      y = log(S./(1-S));
      %Definición de la matriz A y cálculo del vector c
      A = [x ones(size(x))];
      c=(A'*A)\A'*y;
      n = c(1)
      P50 =exp(-c(2)/n)


    case 2
      display('Modelo Cuadratico')
      ver = input("1. Datos estaticos \n2. Ingresar datos: \n");
      x=[];
      y=[];
      if (ver==1)
        x=[10:10:120];
        y=[0.18 0.40 0.65 0.80 0.87 0.92 0.94 0.95 0.95 0.96 0.96 0.97];
      endif
      if (ver==2)
        n=input('Cantidad de datos:');
        for i=1:n
          disp(['Ingrese x(',num2str(i),')'])
          x(i,:)=input('');
        end
        for i=1:n
          disp(['Ingrese y(',num2str(i),')'])
          y(i,:)=input('');
        end
      endif
      n=length(x);
      sumX=0;
      sumY=0;
      sumX2=0;
      sumX3=0;
      sumX4=0;
      sumXY=0;
      sumX2Y=0;

      for i=1:n
        sumX=sumX+x(i);
        sumY=sumY+y(i);
        sumX2=sumX2+(x(i))^2;
        sumX3=sumX3+(x(i))^3;
        sumX4=sumX4+(x(i))^4;
        sumXY = sumXY + (x(i)*y(i));
        sumX2Y = sumX2Y + ((x(i)^2)*y(i));
      endfor

      A=[n sumX sumX2; sumX sumX2 sumX3; sumX2 sumX3 sumX4];

      b=[sumY; sumXY; sumX2Y];

      n=3;
      %display("La ampliada")
      amp=[A eye(n)];
      for j=1:n %recorro columna
        for i=1:n %recorro fila
          %hacemos 1
          if i==j
            amp(i,:)=amp(i,:)/amp(i,j);
          endif
          %caso contrario hago 0
          if i!=j
            amp(i,:)=amp(i,:)-(amp(i,j)/amp(j,j))*amp(j,:);
          endif
        endfor
      endfor


      ainv=amp(:,n+1:n*2);
      X=ainv*b;

      a1=X(1);
      a2=X(2);
      a3=X(3);

      display(['El modelo encontrado es: y=',num2str(a1),'+(',num2str(a2),'x)+(',num2str(a3),'x^2)'])

      x1=min(x)-0.1:0.1:max(x)+0.1;
      y1=a1+a2.*x1 + a3.*x1.^2;
      plot(x,y,'*',x1,y1,'g','LineWidth',0.5)
      set(gca,'FontSize',16)
      xlabel('{\itp}O_2 en mmHg')
      ylabel('{\itS}')
      legend('datos originales','recta de ajuste')
      grid on;
      grid minor;

      %Sustituciones
      pO2 = x';
      x = log(pO2);
      S = y';
      y = log(S./(1-S));
      %Definición de la matriz A y cálculo del vector c
      A = [x ones(size(x))];
      c=(A'*A)\A'*y;
      n = c(1)
      P50 =exp(-c(2)/n)


    case 3
      display('Modelo Cubico')
      ver = input("1. Datos estaticos \n2. Ingresar datos: \n");
      x=[];
      y=[];
      if (ver==1)
        x=[10:10:120];
        y=[0.18 0.40 0.65 0.80 0.87 0.92 0.94 0.95 0.95 0.96 0.96 0.97];
      endif
      if (ver==2)
        n=input('Cantidad de datos:');
        for i=1:n
          disp(['Ingrese x(',num2str(i),')'])
          x(i,:)=input('');
        end
        for i=1:n
          disp(['Ingrese y(',num2str(i),')'])
          y(i,:)=input('');
        end
      endif

      n=length(x);
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
      sumX3 sumX4 sumX5 sumX6];

      b=[sumY; sumXY; sumX2Y; sumX3Y];

      n=4;
      %display("La ampliada")
      amp=[A eye(n)];
      for j=1:n %recorro columna
        for i=1:n %recorro fila
          %hacemos 1
          if i==j
            amp(i,:)=amp(i,:)/amp(i,j);
          endif
          %caso contrario hago 0
          if i!=j
            amp(i,:)=amp(i,:)-(amp(i,j)/amp(j,j))*amp(j,:);
          endif
        endfor
      endfor

      ainv=amp(:,n+1:n*2);
      X=ainv*b;

      a1=X(1);
      a2=X(2);
      a3=X(3);
      a4=X(4);

      display(['El modelo encontrado es: y=',num2str(a1),'+(',num2str(a2),'x)+(',num2str(a3),'x^2)+(',num2str(a4),'x^3)'])

      x1=min(x)-0.1:0.1:max(x)+0.1;
      y1=a1+a2.*x1 + a3.*x1.^2 + a4.*x1.^3;
      plot(x,y,'*',x1,y1,'g','LineWidth',0.5)
      set(gca,'FontSize',16)
      xlabel('{\itp}O_2 en mmHg')
      ylabel('{\itS}')
      legend('datos originales','recta de ajuste')
      grid on;
      grid minor;

      %Sustituciones
      pO2 = x';
      x = log(pO2);
      S = y';
      y = log(S./(1-S));
      %Definición de la matriz A y cálculo del vector c
      A = [x ones(size(x))];
      c=(A'*A)\A'*y;
      n = c(1)
      P50 =exp(-c(2)/n)


    case 4
      display('Modelo Logaritmico')
      ver = input("1. Datos estaticos \n2. Ingresar datos: \n");
      xs=[];
      ys=[];
      if (ver==1)
        xs=[10:10:120];
        ys=[0.18 0.40 0.65 0.80 0.87 0.92 0.94 0.95 0.95 0.96 0.96 0.97];
      endif
      if (ver==2)
        n=input('Cantidad de datos:');
        for i=1:n
          disp(['Ingrese x(',num2str(i),')'])
          xs(i,:)=input('');
        end
        for i=1:n
          disp(['Ingrese y(',num2str(i),')'])
          ys(i,:)=input('');
        end
      endif

      nx=length(xs);
      sumlnX=0;
      sumys=0;
      sPyslnX=0;
      sumlnXCuad=0;
      %sumatorias
      for j=1:nx
        sumys=sumys + ys(j);
        sumlnX = sumlnX+log(xs(j));
        sumlnXCuad = sumlnXCuad + (log(xs(j)))^2;
        sPyslnX = sPyslnX + (ys(j)*log(xs(j)));
      end

      A = [nx sumlnX; sumlnX sumlnXCuad];
      b = [sumys; sPyslnX];

      tam=2;
      AI=[A eye(tam)];
      for j=1:tam
        for i=1:tam
            if i==j
            AI(i,:)=AI(i,:)/AI(i,j);
          endif
          if i!=j
            AI(i,:)=AI(i,:)-(AI(i,j)/AI(j,j))*AI(j,:);
          endif
        endfor
      endfor

      AI=AI(:,tam+1:tam*2);

      sol=AI*b;

      a1=sol(1);
      a2=sol(2);

      display(["El modelo encontrado es: y=",num2str(a1),"+(",num2str(a2),"ln(x))"])
      %Grafico la funcion
      rang=min(xs)-0.1:0.1:max(xs)+0.1;
      res=a1+(a2*log(rang));
      plot(xs,ys,'*',rang,res,'k','LineWidth',0.5)
      set(gca,'FontSize',16)
      xlabel('{\itp}O_2 en mmHg')
      ylabel('{\itS}')
      legend('datos originales','recta de ajuste')
      grid on;
      grid minor;


      %Sustituciones
      pO2 = xs';
      x = log(pO2);
      S = ys';
      y = log(S./(1-S));
      %Definición de la matriz A y cálculo del vector c
      A = [x ones(size(x))];
      c=(A'*A)\A'*y;
      n = c(1)
      P50 =exp(-c(2)/n)


    case 5
      display('Modelo Exponencial')
      ver = input("1. Datos estaticos \n2. Ingresar datos: \n");
      Xi=[];
      Yi=[];
      if (ver==1)
        Xi=[10:10:120];
        Yi=[0.18 0.40 0.65 0.80 0.87 0.92 0.94 0.95 0.95 0.96 0.96 0.97];
      endif
      if (ver==2)
        n=input('Cantidad de datos:');
        for i=1:n
          disp(['Ingrese x(',num2str(i),')'])
          Xi(i,:)=input('');
        end
        for i=1:n
          disp(['Ingrese y(',num2str(i),')'])
          Yi(i,:)=input('');
        end
      endif

      N=length(Xi);
      %verifico que no haya menores o iguales a 0 a causa del logaritmo
      for c=1:N
        if Yi(c)<= 0
          display('yi no puede contener valores menores o iguales a 0 para regresion exponencial')
          return;
        end
      endfor

      %realizo las operaciones para la tabla
      logYi=log10(Yi);
      prodXilogYi=Xi.*logYi;
      XiCuad=Xi.^2;

      sumXi=0;
      sumYi=0;
      sumXiCuad=0;
      sumLogYi=0;
      sumProdXilogYi=0;

      % realizo las sumatorias
      for j=1:N
        sumXi = sumXi+Xi(j);
        sumYi = sumYi+Yi(j);
        sumXiCuad = sumXiCuad + XiCuad(j);
        sumLogYi = sumLogYi + logYi(j);
        sumProdXilogYi = sumProdXilogYi + prodXilogYi(j);
      endfor

      A = [N sumXi; sumXi sumXiCuad];
      b = [sumLogYi; sumProdXilogYi];

      tam=2;
      AI=[A eye(tam)];
      for j=1:tam
        for i=1:tam
            if i==j
            AI(i,:)=AI(i,:)/AI(i,j);
          endif
          if i!=j
            AI(i,:)=AI(i,:)-(AI(i,j)/AI(j,j))*AI(j,:);
          endif
        endfor
      endfor

      AI=AI(:,tam+1:tam*2);

      sol=AI*b;

      a1=10^sol(1);
      a2=10^sol(2);

      %Grafico la funcion
      x2=min(Xi)-0.2:0.1:max(Xi)+0.2;
      y2=a1*(a2.^x2);
      plot(Xi,Yi,'*',x2,y2,'k','LineWidth',0.5)
      set(gca,'FontSize',16)
      xlabel('{\itp}O_2 en mmHg')
      ylabel('{\itS}')
      legend('datos originales','recta de ajuste')
      grid on;
      grid minor;

      %muestro la ecuacion
      display(["El modelo encontrado es: ","y=",num2str(a1),"(",num2str(a2),")^x"])

      %Sustituciones
      pO2 = Xi';
      x = log(pO2);
      S = Yi';
      y = log(S./(1-S));
      %Definición de la matriz A y cálculo del vector c
      A = [x ones(size(x))];
      c=(A'*A)\A'*y;
      n = c(1)
      P50 =exp(-c(2)/n)

    otherwise
      display("Opcion incorrecta");
  endswitch
end
