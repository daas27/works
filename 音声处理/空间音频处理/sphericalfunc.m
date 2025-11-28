M=36;
theta=pi*(0:M)/M;
phi=2*pi*(0:2*M)/(2*M);
%// 定义球坐标
X=sin(theta)'*cos(phi);
Y=sin(theta)'*sin(phi);
Z=cos(theta)'*cos(phi*0);
RY11=-sqrt(3/(8*pi))*sin(theta)'*exp(1i*phi);
RY2_2=sqrt(15/(32*pi))*(sin(theta).^2)'*exp(-2*1i*phi);
RY22 =sqrt(15/(32*pi))*(sin(theta).^2)'*exp(2*1i*phi);
%// 横躺 R20
a=[sqrt(6)/4 -1/2 sqrt(6)/4];
RY=a(1)*RY2_2+a(2)*RY20+a(3)*RY22;
RYx20=RY;
%// 指向
a=[1 sqrt(3) sqrt(5)];
RYx=a(1)*RY00+a(2)*real(RY11)+a(3)*RYx20;
RY=RYx;
%// 显示
x=RY.*X;
y=RY.*Y;
z=RY.*Z;
clf
surf(x,y,z)
axis equal
