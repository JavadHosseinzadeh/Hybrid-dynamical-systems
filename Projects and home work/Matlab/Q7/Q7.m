clc
clear all
close all
%%
T=10;
Ts=0.01;
Time=0:Ts:T-Ts;
N=length(Time);
u=zeros(1,N);
y=zeros(1,N);y(1)=2;y(2)=2;
y1=zeros(1,N);y1(1)=2;y1(2)=2;
b1=0.1;
b2=0.2;
b3=0.1;
k1=1;
k3=1;
c=0.2;
mt=1./(Time+1)+1;

for i=3:N
    u(i)=((b1+b2*abs(y1(i-1)))*y1(i-1)+b3*sign(y1(i-1))+(k1+k3*y(i-1)^2)*y(i-1)+sin(pi*Time(i-1))+c*mt(i-1)*(y1(i-1)-y1(i-2))/Ts);
    y(i)=y(i-1)+Ts*y1(i-1);
    y1(i)=y1(i-1)+Ts*(1/mt(i-1))*(-(b1+b2*abs(y1(i-1)))*y1(i-1) - b3*sign(y1(i-1))- (k1+k3*y(i-1)^2)*y(i-1)+ u(i-1) - sin(pi*Time(i-1)));
end

figure,
plot(Time,y)
hold on 
plot(Time,y+c*y1)
legend('y','Surface')
