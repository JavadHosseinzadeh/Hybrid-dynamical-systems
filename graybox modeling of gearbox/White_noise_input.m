clc
clear all
close all
%%
sigma=10;
test=linspace(0,100,1000);
test1=gaussmf(test,[sigma 10]);
test2=gaussmf(test,[sigma 25]);
test3=gaussmf(test,[sigma 60]);
test4=gaussmf(test,[sigma 90]);
figure,
plot(test,test1,'linewidth',2)
hold on
plot(test,test2,'linewidth',2)
hold on
plot(test,test3,'linewidth',2)
hold on
plot(test,test4,'linewidth',2)
xlabel('Velocity','fontsize',15);ylabel('Efficiency of gear','fontsize',12);
legend('\alpha_1(x_2)','\alpha_2(x_2)','\alpha_3(x_2)','\alpha_4(x_2)','fontsize',12);
axis([0 100 -0.01 1.01]);
%% Geting Data from Wgn mode 
dt=0.01;
sigma=10;
tf=400;
Time=0:dt:tf;
x1 = 0;
x2 = 0;
x = [x1 x2];
X = x;
state=0;
i=1;
O = 16;
u = prbs(O,length(Time));
for t = dt:dt:tf
    G1=gaussmf(x(2),[10 10]);
    G2=gaussmf(x(2),[10 25]);
    G3=gaussmf(x(2),[10 60]);
    G4=gaussmf(x(2),[10 90]);
    if G1>=G2 && G1>=G3 && G1>=G4
        mode=1;
    elseif G2>=G1 && G1>=G3 && G1>=G4
        mode=2;
    elseif G3>=G1 && G3>=G2 && G3>=G4
        mode=3;
    elseif G4>=G2 && G4>=G3 && G4>=G1
        mode=4;
    end
    [T,s] = ode45(@(T,X)Gearbox_model(u(i),mode,x,sigma),[t-dt t],x);
    x = s(end,:);
    X = [X; x];
    state = [state; mode];
    i=i+1;
end

%%
X_1_loc=find(state==1);
X_2_loc=find(state==2);
X_3_loc=find(state==3);
X_4_loc=find(state==4);
X1=X(X_1_loc,:);
X2=X(X_2_loc,:);
X3=X(X_3_loc,:);
X4=X(X_4_loc,:);
u1=u(X_1_loc);
u2=u(X_2_loc);
u3=u(X_3_loc);
u4=u(X_4_loc);
Time1=Time(X_1_loc);
Time2=Time(X_2_loc);
Time3=Time(X_3_loc);
Time4=Time(X_4_loc);
save('GearBox_data','X','X1','X2','X3','X4','Time','u','u1','u2','u3','u4',...
    'Time1','Time2','Time3','Time4','state')
%%
figure,
subplot(211)
plot(Time,X(:,1),'linewidth',2)
title('position trajectory');xlabel('Time');ylabel('position')
subplot(212)
plot(Time,X(:,2),'linewidth',2)
title('Velocity trajectory');xlabel('Time');ylabel('Velocity')
figure,
plot(Time,state,'linewidth',2);
title('Mode trajectory');xlabel('Time');ylabel('Mode')
axis([0 Time(end) -0.5 4.5]);
figure,
stem(Time,u,'linewidth',2);
title('pseudorandom binary sequence (PRBS)');xlabel('Time');ylabel('amplitude')
axis([0 1 -0.1 1.1]);