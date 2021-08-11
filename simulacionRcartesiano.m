%par motor efectivos o fuerza de los motores 
F1=47.04;
F3=0.674;

%numero de interaciones 
n=100;

%vectores de coordenadas de pocisión 
x=zeros(1,n);
y=zeros(1,n);
z=zeros(1,n);

 %tamaños de paso 
 h=(1-0)/n;
 
  %variables para el sitema a resolver 
 d1=zeros(1,n);
 d2=zeros(1,n);
 d3=zeros(1,n);
 
 %evaluando 
 for i=1:n
   d1(i)=F1*(i*h)^2/(4.804);
   d2(i)=i*7/n;
   d3(i)=F3*(i*h)^2/(2*3.37);
 endfor
 
  %asignando posición del último eslabón en el tiempo t
 for i=1:n
   x(i)=d2(i);
   y(i)=-d3(i);
   z(i)=d1(i);
 endfor
 
 %grafica 
 plot3(x,y,z)
 xlabel("eje X")
 ylabel("eje Y")
 zlabel("eje Z")