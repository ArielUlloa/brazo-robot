% simulación resolviendo el sistema de ecuaciones con el método de Euler

%par motor efectivos o fuerza de los motores 
tau1=0.5;
tau2=1;
%masas de los eslabones 
m1=2;
m2=0.5;
%numero de interaciones 
n=1000;
%distancia de la articulación al centro de masa del primer eslabón
L1=0.03;
%vectores de coordenadas de pocisión del ultimo eslabón 
x=zeros(1,n);
y=zeros(1,n);
z=zeros(1,n);
%dominios de theta y d en t
 thetat=linspace(0,1,n);
 dt=linspace(0,0.5,n);
 %tamaños de paso 
 h1=thetat(2)-thetat(1);
 h2=dt(2)-dt(1);
 %variables para el sitema a resolver 
 theta=zeros(1,n);
 d=zeros(1,n);
 u=zeros(1,n);
 v=zeros(1,n);
 %condiciones iniciales
    %theta(1)=0;
    %d(1)=0;
    %u(1)=0;
    %v(1)=0;
 %aplicando el método 
 for i=2:n
   theta(i)=theta(i-1)+h1*u(i-1);
   d(i)=d(i-1)+h2*v(i-1);
   v(i)=v(i-1)+h2*(tau2+m2*d(i-1)*u(i-1)^2)/m2;
   u(i)=u(i-1)+h1*(tau1-2*u(i-1)*v(i-1)*d(i-1)*m2)/(d(i-1)^2*m2+L1^2*m1);
 endfor
 %asignando posición del último eslabón en el tiempo t
 for i=1:n
   x(i)=-(d(i)+0.5)*sin(theta(i));
   y(i)=(d(i)+0.5)*cos(theta(i));
   z(i)=1;
 endfor
%grafica 
 %plot3(x,y,z)
 plot(x,y)