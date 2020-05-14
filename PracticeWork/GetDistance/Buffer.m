global f
f=@(x,t)(pi^2-0.1)*exp(-0.1*t)*sin(pi*x);
global deltaX
deltaX=1/33;
global x0
x0=linspace(0,1,34);
x0=x0(2:33);
global A;
A=diag(2*ones(1,32));
global phi;
phi=@(x) sin(pi*x);
for i=1:31
    A(i,i+1)=-1;
    A(i+1,i)=-1;
end

f=@(t,z) -z;
y(1)=1;
h=0.04;
T=0:h:1;
for i=1:(length(T)-1)
    ww0=y(i,:);
    ww1=ww0+k(1)*h*f(T(i),ww0);
    ww2=(1-u(2)-v(2))*ww0+u(2)*ww1+v(2)*ww0+k(2)*h*f(T(i)+c(1)*h,ww1)+gamma(2)*h*f(T(i),ww0);
    ww3=(1-u(3)-v(3))*ww0+u(3)*ww2+v(3)*ww1+k(3)*h*f(T(i)+c(2)*h,ww2)+gamma(3)*h*f(T(i),ww0);
    ww4=(1-u(4)-v(4))*ww0+u(4)*ww3+v(4)*ww2+k(4)*h*f(T(i)+c(3)*h,ww3)+gamma(4)*h*f(T(i),ww0);
    ww5=(1-u(5)-v(5))*ww0+u(5)*ww4+v(5)*ww3+k(5)*h*f(T(i)+c(4)*h,ww4)+gamma(5)*h*f(T(i),ww0);
    y(i+1,:)=ww5;
end
