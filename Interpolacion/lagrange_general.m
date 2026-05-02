function interpolacionLagrange
  xn=input("Ingrese xn: ")
  
  yn=input("Ingrese yn: ")
  N=length(xn);
  Nyn=length(yn);
  
  if N!=Nyn
    display("xn y yn deben tener la misma contidad de numeros")
    return
  endif

  solu=ones(1,N);
  resp=1; 
  %q es una matriz para acarrear los indices de los polinomios
  q=1;
    
  %Calculo termino a termino para enontrar el polinomio
  for i=1:N %iteraciion (k)
    q=ones(1,2);
    aux=1;
    %Hago las operaciones para encontrar ese t�rmino
    for j=1:N 
      if i!=j
          q(aux,:)=poly([xn(j)])/((xn(i)-xn(j)));
          aux=aux+1;
      endif
    endfor

    q;
    
    %Una vez encontrado el termino multiplico para
    %encontrar el polinomio en ese termino
    for m=1:N-1
      resp=conv(resp,q(m,:));
    endfor
    %acarreo ese polinomio para sumarlo despues con el siguiente
    solu(i,:)=[resp*yn(i)];
    %reinicio mi variable
    resp=1;
    
  endfor
  
  
  %Sumno la matriz fila por fila ya que son los coeficientes del polinomio 
  polinomio=zeros(1,N);
    var=0;
    for i=1:N
      for j=1:N
        polinomio(1,i)=polinomio(1,i)+solu(j,i);
      endfor
    endfor
    
    polinomio;
    %muestro el polinomio
    polsol=polyout(polinomio,'x')
    %dubujo los puntos
    x=min(xn)-0.5:0.001:max(xn)+0.5;
    y=polyval(polinomio,x);
    plot(xn,yn,'*',x,y),grid on
endfunction