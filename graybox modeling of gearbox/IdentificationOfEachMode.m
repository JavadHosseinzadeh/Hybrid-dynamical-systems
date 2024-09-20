clc
clear all
close all
%%
load('GearBox_data')
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MODE 1   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inputs=Unbyp4(u1,X1).';
targets=X1.';
% Choose a Training Function
net1.trainFcn = 'trainbr';  % Bayesin regulation backpropagation.
hiddenLayerSize = [15,20,15];
net1 = fitnet(hiddenLayerSize);
% Choose Input and Output Pre/Post-Processing Functions
net1.input.processFcns = {'removeconstantrows','mapminmax'};
net1.output.processFcns = {'removeconstantrows','mapminmax'};
net1.divideFcn = 'dividerand';  % Divide data randomly
net1.divideMode = 'sample';  % Divide up every sample
net1.divideParam.trainRatio = 70/100;
net1.divideParam.valRatio = 15/100;
net1.divideParam.testRatio = 15/100;
net1.performFcn = 'mse';  % Mean Squared Error
net1.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
net1.trainParam.showWindow=true;
net1.trainParam.showCommandLine=false;
net1.trainParam.show=1;
net1.trainParam.epochs=500;
net1.trainParam.mu=1e-10;
net1.trainParam.goal=1e-30;
net1.trainParam.max_fail=1000;
% Train the Network
[net1,tr] = train(net1,inputs,targets);
% Test the Network
outputs = net1(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net1,targets,outputs);
%%
figure,
subplot(211)
scatter(Time1,outputs(1,:),'linewidth',2);
title('MODE 1','fontsize',15);xlabel('Time','fontsize',15);ylabel('Position','fontsize',15)
hold on
plot(Time1,targets(1,:),'linewidth',2,'color','r');
legend('Predict','Real')

subplot(212)
scatter(Time1,outputs(2,:),'linewidth',2);
title('MODE 1','fontsize',15);xlabel('Time','fontsize',15);ylabel('Velocity','fontsize',15)
hold on
plot(Time1,targets(2,:),'linewidth',2,'color','r');
legend('Predict','Real')
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MODE 2   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inputs=Unbyp4(u2,X2).';
targets=X2.';
% Choose a Training Function
net2.trainFcn = 'trainbr';  % Bayesin regulation backpropagation.
hiddenLayerSize = [15,20,15];
net2 = fitnet(hiddenLayerSize);
% Choose Input and Output Pre/Post-Processing Functions
net2.input.processFcns = {'removeconstantrows','mapminmax'};
net2.output.processFcns = {'removeconstantrows','mapminmax'};
net2.divideFcn = 'dividerand';  % Divide data randomly
net2.divideMode = 'sample';  % Divide up every sample
net2.divideParam.trainRatio = 70/100;
net2.divideParam.valRatio = 15/100;
net2.divideParam.testRatio = 15/100;
net2.performFcn = 'mse';  % Mean Squared Error
net2.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
net2.trainParam.showWindow=true;
net2.trainParam.showCommandLine=false;
net2.trainParam.show=1;
net2.trainParam.epochs=500;
net2.trainParam.mu=1e-10;
net2.trainParam.goal=1e-30;
net2.trainParam.max_fail=1000;
% Train the Network
[net2,tr] = train(net2,inputs,targets);
% Test the Network
outputs = net2(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net2,targets,outputs);
%%
figure,
subplot(211)
scatter(Time2,outputs(1,:),'linewidth',2);
title('MODE 2','fontsize',15);xlabel('Time','fontsize',15);ylabel('Position','fontsize',15)
hold on
plot(Time2,targets(1,:),'linewidth',2,'color','r');
legend('Predict','Real')

subplot(212)
scatter(Time2,outputs(2,:),'linewidth',2);
title('MODE 2','fontsize',15);xlabel('Time','fontsize',15);ylabel('Velocity','fontsize',15)
hold on
plot(Time2,targets(2,:),'linewidth',2,'color','r');
legend('Predict','Real')
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MODE 3   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inputs=Unbyp4(u3,X3).';
targets=X3.';
% Choose a Training Function
net3.trainFcn = 'trainbr';  % Bayesin regulation backpropagation.
hiddenLayerSize = [15,20,15];
net3 = fitnet(hiddenLayerSize);
% Choose Input and Output Pre/Post-Processing Functions
net3.input.processFcns = {'removeconstantrows','mapminmax'};
net3.output.processFcns = {'removeconstantrows','mapminmax'};
net3.divideFcn = 'dividerand';  % Divide data randomly
net3.divideMode = 'sample';  % Divide up every sample
net3.divideParam.trainRatio = 70/100;
net3.divideParam.valRatio = 15/100;
net3.divideParam.testRatio = 15/100;
net3.performFcn = 'mse';  % Mean Squared Error
net3.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
net3.trainParam.showWindow=true;
net3.trainParam.showCommandLine=false;
net3.trainParam.show=1;
net3.trainParam.epochs=500;
net3.trainParam.mu=1e-10;
net3.trainParam.goal=1e-30;
net3.trainParam.max_fail=1000;
% Train the Network
[net3,tr] = train(net3,inputs,targets);
% Test the Network
outputs = net3(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net3,targets,outputs);
%%
figure,
subplot(211)
scatter(Time3,outputs(1,:),'linewidth',2);
title('MODE 3','fontsize',15);xlabel('Time','fontsize',15);ylabel('Position','fontsize',15)
hold on
plot(Time3,targets(1,:),'linewidth',2,'color','r');
legend('Predict','Real')

subplot(212)
scatter(Time3,outputs(2,:),'linewidth',2);
title('MODE 3','fontsize',15);xlabel('Time','fontsize',15);ylabel('Velocity','fontsize',15)
hold on
plot(Time3,targets(2,:),'linewidth',2,'color','r');
legend('Predict','Real')
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MODE 4   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inputs=Unbyp4(u4,X4).';
targets=X4.';
% Choose a Training Function
net4.trainFcn = 'trainbr';  % Bayesin regulation backpropagation.
hiddenLayerSize = [15,20,15];
net4 = fitnet(hiddenLayerSize);
% Choose Input and Output Pre/Post-Processing Functions
net4.input.processFcns = {'removeconstantrows','mapminmax'};
net4.output.processFcns = {'removeconstantrows','mapminmax'};
net4.divideFcn = 'dividerand';  % Divide data randomly
net4.divideMode = 'sample';  % Divide up every sample
net4.divideParam.trainRatio = 70/100;
net4.divideParam.valRatio = 15/100;
net4.divideParam.testRatio = 15/100;
net4.performFcn = 'mse';  % Mean Squared Error
net4.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
net4.trainParam.showWindow=true;
net4.trainParam.showCommandLine=false;
net4.trainParam.show=1;
net4.trainParam.epochs=1000;
net4.trainParam.mu=1e-10;
net4.trainParam.goal=1e-30;
net4.trainParam.max_fail=1000;
% Train the Network
[net4,tr] = train(net4,inputs,targets);
% Test the Network
outputs = net4(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net4,targets,outputs);
%%
figure,
subplot(211)
scatter(Time4,outputs(1,:),'linewidth',2);
title('MODE 4','fontsize',15);xlabel('Time','fontsize',15);ylabel('Position','fontsize',15)
hold on
plot(Time4,targets(1,:),'linewidth',2,'color','r');
legend('Predict','Real')

subplot(212)
scatter(Time4,outputs(2,:),'linewidth',2);
title('MODE 4','fontsize',15);xlabel('Time','fontsize',15);ylabel('Velocity','fontsize',15)
hold on
plot(Time4,targets(2,:),'linewidth',2,'color','r');
legend('Predict','Real')
save('modes','net1','net2','net3','net4')