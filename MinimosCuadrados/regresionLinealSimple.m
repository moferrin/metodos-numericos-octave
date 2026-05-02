x=[1 2 3 4 5];
y=[16.5 18 18.5 17 20];
[filas n]=size(x);
for i=1:n
  xy(i)=x(i)*y(i);
  x2(i)=x(i)^2;
end
fprintf('\n x:'),fprintf('%i ',x);
fprintf('\n y:'),fprintf('%i ',y);
fprintf('\n xy:'),fprintf('%i ',xy);
fprintf('\n x^2:'),fprintf('%i ',x2);
sumatoriax=0;sumatoriay=0;sumatoriaxy=0;sumatoriax2=0;
for i=1:n
  sumatoriax=sumatoriax+x(i);
  sumatoriay=sumatoriay+y(i);
  sumatoriaxy=sumatoriaxy+xy(i);
  sumatoriax2=sumatoriax2+x2(i);
end
fprintf('\nsum x= %i',sumatoriax)
fprintf('\nsum y= %i',sumatoriay)
fprintf('\nsum xy= %i',sumatoriaxy)
fprintf('\nsum x^2= %i',sumatoriax2)
b=(sumatoriaxy-(sumatoriax*sumatoriay/n))/(sumatoriax2-(sumatoriax^2/n));
m=(sumatoriay/n)-b*(sumatoriax/n);
fprintf('\ny=%f + (%f)x',b,m);
plot(x,y,'or')
hold on

x=[1 2 3 4 5];
y=[16.5 18 18.5 17 20];
[filas n]=size(x);
for i=1:n 
yteo(i)=b+x(i)*m
%fprintf('\n yteo:')
%fprintf('%i ',b+m*x)
end
fprintf('\n')