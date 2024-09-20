clc
clear all
close all
%%
mld = MLDSystem('turbo_car_hysdel.hys');
mld.x.penalty = OneNormFunction([1, 1,0]);
mld.u.penalty = OneNormFunction( [1 0] );
mld.x.with('reference');
mld.x.reference = 'free';
mpc = MPCController(mld,5);
loop = ClosedLoop(mpc, mld);
x0 = [0; 0; 0];
Nsim = 50;
xref = [30; 0; 0];
data = loop.simulate(x0, Nsim, 'x.reference', xref);
figure,
subplot(2, 1, 1);
plot(1:Nsim, data.X(:,1:Nsim), 'linewidth', 2);
axis([1, Nsim, -20, 40]);
grid on;  title('states');
plot(1:Nsim, data.U, 'linewidth', 2);
axis([1, Nsim, -2, 2]);
grid on; title('inputs');
plot(1:Nsim, data.Y(:,1:Nsim), 'linewidth', 2);
axis([1, Nsim, -20, 40]);
grid on;  title('output');
%%
mld = MLDSystem('turbo_car_manual.hys');
mld.x.penalty = OneNormFunction([1, 1,0]);
mld.u.penalty = OneNormFunction( [1 0] );
mld.x.with('reference');
mld.x.reference = 'free';
mpc = MPCController(mld,2);
loop = ClosedLoop(mpc, mld);
x0 = [0; 0; 0];
Nsim = 50;
xref = [30; 0; 0];
data = loop.simulate(x0, Nsim, 'x.reference', xref);
figure,
subplot(2, 1, 1);
plot(1:Nsim, data.X(:,1:Nsim), 'linewidth', 2);
axis([1, Nsim, -20, 40]);
grid on;  title('states');
plot(1:Nsim, data.U, 'linewidth', 2);
axis([1, Nsim, -2, 2]);
grid on; title('inputs');
plot(1:Nsim, data.Y(:,1:Nsim), 'linewidth', 2);
axis([1, Nsim, -20, 40]);
grid on;  title('output');