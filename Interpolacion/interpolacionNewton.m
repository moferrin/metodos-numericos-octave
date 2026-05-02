function grupoNewton
  clc;
  
  ind=input("Ingrese las x: ");
  
  dep=input("Ingrese las y: ");
  
  
  %Polinomio de grado0
  p1=[0 0 dep(1)];
  %Muestro
  display("\nPara n=0")
  polyout(p1,'x')
  
  
  %Para encontrar el de grado 1
  %Realizo la diferencia del 1ro con el 2do punto
  m112=(dep(2)-dep(1))/(ind(2)-ind(1));
  
  %Multiplico la diferencia por el polinomio encontrado
  pAux=m112*[0 1 -ind(1)];
  
  %Sumo el polinomio anterior mas el encontrado
  p2=p1+pAux;
  
  %Muestro
  display("\nPara n=1")
  polyout(p2,'x')
  
  
  %Para encontrar el de grado 2
  
  %Realizo la diferencia del 2do con el 3ro 
  
  m123=(dep(3)-dep(2))/(ind(3)-ind(2));
  
  %Realizo la segunda y ultima diferencia

  m212=(m112-m123)/(ind(1)-ind(3));

  %Multiplico la segunda diferencia por el polinomio de esa diferencia
  pAux=m212*poly([ind(1) ind(2)]);
  
  %Sumo el polinomio anterior mas el encontrado
  p3=p2+pAux;
  
  display("\nPara n=2")
  polres=polyout(p3,'x');
  
  display(["El polinomo es: " polres])
  
  tablaDif=[ind(1) dep(1) 0 0; 0 0 m112 0;ind(2) dep(2) 0 m212;0 0 m123 0;ind(2) dep(2) 0 0]
  
  x=min(ind)-0.5:0.01:max(ind)+0.5;
  
  plot(ind,dep,'*',x,polyval(p3,x),'b');
  
  grid on;
endfunction