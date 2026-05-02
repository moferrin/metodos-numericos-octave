function newtonCorr
  clc;
  
  ind=input("Ingrese las x: ");
  
  dep=input("Ingrese las y: ");
  
  display("\nPara n=0")
  %Polinomio de grado0
  p1=[0 0 0 0 dep(1)];
  %Muestro
  polyout(p1,'x');
  display("\n -------------------------------------")
  
  %Para encontrar el de grado 1
  %Realizo la diferencia del 1ro con el 2do punto
  m112=(dep(2)-dep(1))/(ind(2)-ind(1));
  
  display("\nPara n=1")
  %Multiplico la diferencia por el polinomio encontrado
  pAux=m112*[0 0 0 poly([ind(1)])];
  
  %Sumo el polinomio anterior mas el encontrado
  p2=p1+pAux;
  
  %Muestro
  polyout(p2,'x');
  display("\n -------------------------------------")
  
  
  %Para encontrar el de grado 2
  
  %Realizo la diferencia del 2do con el 3ro 
  
  m123=(dep(3)-dep(2))/(ind(3)-ind(2));
  
  %Realizo la segunda y ultima diferencia

  m212=(m112-m123)/(ind(1)-ind(3));

  display("\nPara n=2")
  %Multiplico la segunda diferencia por el polinomio de esa diferencia
  pAux=m212*[0 0 poly([ind(1) ind(2)])];
  
  %Sumo el polinomio anterior mas el encontrado
  p3=p2+pAux;

  %Muestro
  polyout(p3,'x');
  
  display("\n -------------------------------------")
  
  
  %Para grado 3
  m134=(dep(4)-dep(3))/(ind(4)-ind(3));
  m223=(m134-m123)/(ind(4)-ind(2));
  m312=(m223-m212)/(ind(4)-ind(1));
  
  display("\nPara n=3")
  pAux=[0 m312*poly([ind(1) ind(2) ind(3)])];
  
  p4=p3+pAux;
  %Muestro
  polyout(p4,'x');
  display("\n -------------------------------------")

  
  %Para grado 4
  m145=(dep(4)-dep(5))/(ind(4)-ind(5));
  m234=(m145-m134)/(ind(5)-ind(3));
  m323=(m234-m223)/(ind(5)-ind(2));
  m412=(m323-m312)/(ind(5)-ind(1));
  
  display("\nPara n=4")
  pAux=[m412*poly([ind(1) ind(2) ind(3) ind(4)])];
  p5=p4+pAux;
  
  polres=polyout(p5,'x');

  
  display(["El polinomo es: " polres])
  
  tablaDiferencias=[ind(1) dep(1) 0 0 0 0; 0 0 m112 0 0 0; ind(2) dep(2) 0 m212 0 0; 0 0 m123 0 m312 0; ind(3) dep(3) 0 m223 0 m412; 0 0 m134 0 m323 0; ind(4) dep(4) 0 m234 0 0; 0 0 m145 0 0 0; ind(5) dep(5) 0 0 0 0]
  
  
  x=min(ind)-0.5:0.01:max(ind)+0.5;
  
  plot(ind,dep,'*',x,polyval(p5,x),'b');
  
  grid on;
endfunction