function resp=factorial
  numero=input("Ingresa el numero del cual quieres el factorial: ")
  
  if numero == 0
    display("EL factorial es: 1")
    return
  endif
  
  respuesta=1;
  for i=1:numero
    respuesta=respuesta*i;
  endfor
  
  
 display("EL factorial es: ")
 display(respuesta)

endfunction
