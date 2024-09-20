clc
clear all
close all
%% 
load('Classifier')
%% net 3 on x2
t = linspace(0,400,50);
x1 = linspace(0,25000,50);
x2 = linspace(0,110,50);
target=round(net01(x2));
figure,
X_1_loc=find(target==1);
X_2_loc=find(target==2);
X_3_loc=find(target==3);
X_4_loc=find(target==4);
scatter(x2(X_1_loc),target(X_1_loc),25,target(X_1_loc),'r','filled');
hold on 
scatter(x2(X_2_loc),target(X_2_loc),25,target(X_2_loc),'g','filled');
hold on 
scatter(x2(X_3_loc),target(X_3_loc),25,target(X_3_loc),'b','filled');
hold on 
scatter(x2(X_4_loc),target(X_4_loc),25,target(X_4_loc),'k','filled');
xlabel('Velocity');ylabel('Mode');
legend('Mode 1','Mode 2','Mode 3','Mode 4');
%% net 2 on x1 and x2
[X,Y] = meshgrid(x1,x2);
x=X(:)';
y=Y(:)';
%%
data=[x;y];
target=round(net02(data));
X_1_loc=find(target==1);
X_2_loc=find(target==2);
X_3_loc=find(target==3);
X_4_loc=find(target==4);
figure,
scatter(x(X_1_loc),y(X_1_loc),25,target(X_1_loc),'r','filled');
hold on 
scatter(x(X_2_loc),y(X_2_loc),25,target(X_2_loc),'g','filled');
hold on 
scatter(x(X_3_loc),y(X_3_loc),25,target(X_3_loc),'b','filled');
hold on 
scatter(x(X_4_loc),y(X_4_loc),25,target(X_4_loc),'k','filled');
xlabel('position');ylabel('Velocity');
legend('Mode 1','Mode 2','Mode 3','Mode 4');
%% net 1 on time and x1 and x2
[X,Y,Z] = meshgrid(t,x1,x2);
x=X(:)';
y=Y(:)';
z=Z(:)';
%%
data=[x;y;z];
target=round(net03(data));
X_1_loc=find(target==1);
X_2_loc=find(target==2);
X_3_loc=find(target==3);
X_4_loc=find(target==4);
figure,
scatter3(x(X_1_loc),y(X_1_loc),z(X_1_loc),25,target(X_1_loc),'r','filled');
hold on 
scatter3(x(X_2_loc),y(X_2_loc),z(X_2_loc),25,target(X_2_loc),'g','filled');
hold on 
scatter3(x(X_3_loc),y(X_3_loc),z(X_3_loc),25,target(X_3_loc),'b','filled');
hold on 
scatter3(x(X_4_loc),y(X_4_loc),z(X_4_loc),25,target(X_4_loc),'k','filled');
xlabel('Time');ylabel('Position');zlabel('Velocity')
legend('Mode 1','Mode 2','Mode 3','Mode 4');