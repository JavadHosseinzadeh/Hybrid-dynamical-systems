clc
clear all
close all
%%
x=linspace(-6,6,1000);
figure,
plot(x,sign(x-3),'linewidth',2)
title('Step(x-3)');xlabel('Time(s)');ylabel('Value')
