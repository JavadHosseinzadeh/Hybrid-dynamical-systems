clc
clear all
close all
%%
load('GearBox_data')
%%  with velocity
inputs=X(:,2).';
targets=state.';
% Choose a Training Function
net01.trainFcn = 'trainbr';  % Bayesin regulation backpropagation.
hiddenLayerSize = [10,15,10];
net01 = fitnet(hiddenLayerSize);
% Choose Input and Output Pre/Post-Processing Functions
net01.input.processFcns = {'removeconstantrows','mapminmax'};
net01.output.processFcns = {'removeconstantrows','mapminmax'};
net01.divideFcn = 'dividerand';  % Divide data randomly
net01.divideMode = 'sample';  % Divide up every sample
net01.divideParam.trainRatio = 70/100;
net01.divideParam.valRatio = 15/100;
net01.divideParam.testRatio = 15/100;
net01.performFcn = 'mse';  % Mean Squared Error
net01.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
net01.trainParam.showWindow=true;
net01.trainParam.showCommandLine=false;
net01.trainParam.show=1;
net01.trainParam.epochs=500;
net01.trainParam.mu=1e-10;
net01.trainParam.goal=1e-30;
net01.trainParam.max_fail=1000;
% Train the Network
[net01,tr] = train(net01,inputs,targets);
% Test the Network
outputs = net01(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net01,targets,outputs);
sum(round(outputs)==targets)
%%  with position and velocity
inputs=X.';
targets=state.';
% Choose a Training Function
net02.trainFcn = 'trainbr';  % Bayesin regulation backpropagation.
hiddenLayerSize = [10,15,10];
net02 = fitnet(hiddenLayerSize);
% Choose Input and Output Pre/Post-Processing Functions
net02.input.processFcns = {'removeconstantrows','mapminmax'};
net02.output.processFcns = {'removeconstantrows','mapminmax'};
net02.divideFcn = 'dividerand';  % Divide data randomly
net02.divideMode = 'sample';  % Divide up every sample
net02.divideParam.trainRatio = 70/100;
net02.divideParam.valRatio = 15/100;
net02.divideParam.testRatio = 15/100;
net02.performFcn = 'mse';  % Mean Squared Error
net02.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
net02.trainParam.showWindow=true;
net02.trainParam.showCommandLine=false;
net02.trainParam.show=1;
net02.trainParam.epochs=500;
net02.trainParam.mu=1e-10;
net02.trainParam.goal=1e-30;
net02.trainParam.max_fail=1000;
% Train the Network
[net02,tr] = train(net02,inputs,targets);
% Test the Network
outputs = net02(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net02,targets,outputs);
sum(round(outputs)==targets)
%% with Time, position and velocity
inputs=[Time' X].';
targets=state.';
% Choose a Training Function
net03.trainFcn = 'trainbr';  % Bayesin regulation backpropagation.
hiddenLayerSize = [10,15,10];
net03 = fitnet(hiddenLayerSize);
% Choose Input and Output Pre/Post-Processing Functions
net03.input.processFcns = {'removeconstantrows','mapminmax'};
net03.output.processFcns = {'removeconstantrows','mapminmax'};
net03.divideFcn = 'dividerand';  % Divide data randomly
net03.divideMode = 'sample';  % Divide up every sample
net03.divideParam.trainRatio = 70/100;
net03.divideParam.valRatio = 15/100;
net03.divideParam.testRatio = 15/100;
net03.performFcn = 'mse';  % Mean Squared Error
net03.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};
net03.trainParam.showWindow=true;
net03.trainParam.showCommandLine=false;
net03.trainParam.show=1;
net03.trainParam.epochs=500;
net03.trainParam.mu=1e-10;
net03.trainParam.goal=1e-30;
net03.trainParam.max_fail=1000;
% Train the Network
[net03,tr] = train(net03,inputs,targets);
% Test the Network
outputs = net03(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net03,targets,outputs);
sum(round(outputs)==targets)
%% 
save('Classifier','net01','net02','net03')