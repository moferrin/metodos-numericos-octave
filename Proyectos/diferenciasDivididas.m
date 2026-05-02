function proyecto
x= [2.0 3.0 4.0 5.0 6.0 7.0 8.0];
y= [4.8 4.25 3.23 2.87 2.75 2.70 2.65];
N=7;
for i =1: N-1
  f(i,1) = y(i+1)-y(i);
end
f
for j=2: N-1
  for i=j: N-1
    f(i,j) = f(i,j-1) - f(i-1,j-1);
  end
end
disp(f)
h= 1.0 ; xi = 2.5;
s = (xi - x(1))/h ;
yi = y(1) + s*f(1,1) + s*(s-1)/2*f(2,2)+ s*(s-1)*(s-2)/(3*2)*f(3,3) +s*(s-1)*(s-2)*(s-3)/(4*3*2)*f(4,4) ;
fprintf('\n Resultado: 4º grado f(%4.2f) =...%6.5f  \n', xi,yi )
fprintf(' velocidad=%3.4f g/(cm^2)h \n',yi) 
a = polyfit(x,y,7);
X=0:0.1:8;
Y= polyval(a,X);
plot(x,y,'ob',X,Y,'-g')
grid on
grid minor
endfunction