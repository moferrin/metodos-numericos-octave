function interpolacionLagrange2
  clc;
  xn=input("Ingrese el vector con las xi: ")
  
  yn=input("Ingrese el vector con las yi: ")
  xn=[-1 2 3];
  yn=[1 -2 5];
  N=length(xn);
  Nyn=length(yn);
  
  if N!=Nyn
    display("xi debe contener la misma cantidad de valores que yi")
    return
  endif

  solu=ones(1,N);
  resp=1; 
  q=1;
  for i=1:N %iteraciion (k)
    q=ones(1,2);
    aux=1;
    for j=1:N %para armar el polinomio
      if i!=j
        
          q(aux,:)=poly([xn(j)])/((xn(i)-xn(j)));
          aux=aux+1;
      endif
    endfor

    q
    
    for m=1:N-1
      resp=conv(resp,q(m,:));
    endfor
    solu(i,:)=[resp*yn(i)]
    display("fin iteracion")
    resp=1;
    
  endfor
  
  polinomio=zeros(1,N);
    var=0;
    for i=1:N
      for j=1:N
        polinomio(1,i)=polinomio(1,i)+solu(j,i);
      endfor
    endfor
    
    polinomio
    
    polsol=polyout(polinomio,'x')
    
    x=min(xn)-0.5:0.001:max(xn)+0.5;
    y=polyval(polinomio,x);
    plot(xn,yn,'*',x,y),grid on
endfunction