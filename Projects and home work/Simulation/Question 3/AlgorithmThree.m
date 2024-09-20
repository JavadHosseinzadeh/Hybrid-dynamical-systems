clear all
clc
close all
%%
xcl = [0.3714 ; 0.6429];
A1 = [-30 -20 ; 0.05 -0.25];
A2 = [-30 -20 ; 0.05 0.1];
A3 = [-30 -20 ; 0.05 -0.2];
b1 = [24-30*xcl(1)-20*xcl(2) ; 0.05*xcl(1)-0.25*xcl(2)];
b2 = [24-30*xcl(1)-20*xcl(2) ; 0.05*xcl(1)-0.07];
b3 = [24-30*xcl(1)-20*xcl(2) ; 0.05*xcl(1)+0.11];
B1 = [20 ; 0];
B2 = [20 ; 0];
B3 = [20 ; 0];
alpha = 10^(-9);
l1 = 10^(-9);
lhat0 = 10^(-10);
L = 2*10^4;
e = [0 1];
E1 = 2*e/(0.2+L);
E2 = 2*e/(0.6-0.2);
E3 = 2*e/(L-0.6);
fhat1 = (L-0.2)/(L+0.2);
fhat2 = -(0.6+0.2)/(0.6-0.2);
fhat3 = -(L+0.6)/(L-0.6);
f1 = fhat1+E1*xcl;
f2 = fhat2+E2*xcl;
f3 = fhat3+E3*xcl;
Q = sdpvar(2,2);
Y1 = sdpvar(1,2);
Y2 = sdpvar(1,2);
Y3 = sdpvar(1,2);
mu1 = sdpvar(1);
mu2 = sdpvar(1);
mu3 = sdpvar(1);
Z1 = sdpvar(1);
Z2 = sdpvar(1);
Z3 = sdpvar(1);
W1 = sdpvar(1);
W2 = sdpvar(1);
W3 = sdpvar(1);
%%
What1 = [W1 Z1 ; Z1' mu1];
What2 = [W2 Z2 ; Z2' mu2];
What3 = [W3 Z3 ; Z3' mu3];
X111 = A1*Q+Q*A1'+B1*Y1+Y1'*B1'+alpha*Q+mu1*b1*b1'+b1*Z1'*B1'+B1*Z1*b1'+B1*W1*B1';
X112 = (mu1*b1+B1*Z1)*f1'+Q*E1';
X121 = X112';
X122 = -mu1*(1-f1*f1');
X1 = [X111 X112 ; X121 X122];
X211 = A2*Q+Q*A2'+B2*Y2+Y2'*B2'+alpha*Q+mu2*b2*b2'+b2*Z2'*B2'+B2*Z2*b2'+B2*W2*B2';
X212 = (mu2*b2+B2*Z2)*f2'+Q*E2';
X221 = X212';
X222 = -mu2*(1-f2*f2');
X2 = [X211 X212 ; X221 X222];
X311 = A3*Q+Q*A3'+B3*Y3+Y3'*B3'+alpha*Q+mu3*b3*b3'+b3*Z3'*B3'+B3*Z3*b3'+B3*W3*B3';
X312 = (mu3*b3+B3*Z3)*f3'+Q*E3';
X321 = X312';
X322 = -mu3*(1-f3*f3');
X3 = [X311 X312 ; X321 X322];
%%
eps = 10^(-5);
F = [Q >= eps*eye(2) , mu1 <= -eps , mu2 <= -eps , mu3 <= -eps , 
    -l1+eps <= Y1 <= l1-eps , -l1+eps <= Y2 <= l1-eps , -l1+eps <= Y3 <= l1-eps , 
    -lhat0+eps <= Z1 <= lhat0-eps , -lhat0+eps <= Z2 <= lhat0-eps , -lhat0+eps <= Z3 <= lhat0-eps , 
    What1 <=0 , What2 <=0 , What3 <=0 , X1 <= -eps*eye(3) , X2 <= -eps*eye(3) , X3 <= -eps*eye(3)];
v = W1+W2+W3;
OPTION = sdpsettings('solver','sedumi','verbose',0);
res = optimize(F,-v,OPTION)
check(F)