%simulación resolviendo el sistema de ecuaciones con el método de Runge-Kutta

%par motor efectivos o fuerza de los motores 
tau1=0.1;
tau2=0.01;
%masas de los eslabones 
m1=2;
m2=1.5;
%numero de interaciones 
n=1000;
%distancia de la articulación al centro de masa del primer eslabón
L1=0.03;
%vectores de coordenadas de pocisión 
x=zeros(1,n);
y=zeros(1,n);
z=zeros(1,n);

 %tamaños de paso 
 h=(3-0)/n;
 
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
    
 %variables auxiliares del metodo   
    k1=0;
    k2=0;
    k3=0;
    k4=0;
    
    s1=0;
    s2=0;
    s3=0;
    s4=0;
    
    t1=0;
    t2=0;
    t3=0;
    t4=0;
    
    j1=0;
    j2=0;
    j3=0;
    j4=0;

%aplicando el método  
for i=1:n-1
  j1=(tau1-2*u(i)*v(i)*d(i)*m2)/(m2*d(i)^2+L1*m1);
  k1=u(i);
  
  j2=(tau1-2*(u(i)+h*j1/2)*(v(i)+h/2)*(d(i)+h/2)*m2)/(m2*(d(i)+h/2)^2+L1*m1);
  k2=u(i)+h*j1/2;
  
  j3=(tau1-2*(u(i)+h*j2/2)*(v(i)+h/2)*(d(i)+h/2)*m2)/(m2*(d(i)+h/2)^2+L1*m1);
  k3=u(i)+h*j2/2;
  
  j4=(tau1-2*(u(i)+h*j3)*(v(i)+h)*(d(i)+h)*m2)/(m2*(d(i)+h)^2+L1*m1);
  k4=u(i)+h*j3;
  
  u(i+1)=u(i)+h*(j1+2*j2+2*j3+j4)/6;
  theta(i+1)=theta(i)+h*(k1+2*k2+2*k3+k4)/6;
  
  t1=(tau2+m2*d(i)*u(i)^2)/m2;
  s1=v(i);
  
  t2=(tau2+m2*(d(i)+h*s1/2)*(u(i)+h/2)^2)/m2;
  s2=v(i)+h*t1/2;
  
  t3=(tau2+m2*(d(i)+h*s2/2)*(u(i)+h/2)^2)/m2;
  s3=v(i)+h*t2/2;
  
  t4=(tau2+m2*(d(i)+h*s3/2)*(u(i)+h/2)^2)/m2;
  s4=v(i)+h*t3;
  
  d(i+1)=d(i)+h*(s1+2*s2+2*s3+s4)/6;
  v(i+1)=v(i)+h*(t1+2*t2+2*t3+t4)/6;  
endfor

 %asignando posición del último eslabón en el tiempo t
 for i=1:n
   x(i)=-(d(i)+0.5)*sin(theta(i));
   y(i)=(d(i)+0.5)*cos(theta(i));
   z(i)=1;
 endfor
%grafica

 plot(x,y)
 xlabel("eje X")
 ylabel("eje Y")

 