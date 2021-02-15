% this script illustrates how to interact with a simulink model using 
% a matlab script.
clc
clear all
close all

% define a model constant
g = 10;
m = 1;
c = 0.5;
L = 1;

tfinal = 45;
tstepmax = 0.05;

thetha0 = 0* pi/180;
thethadot0 = 0;

% run the simulink model using 'sim' command
simulink = sim('pendulum.slx');

% extract data genterated by the 'out1' block.
% xsignal    = simulink.yout.getElement('x');
% t          = xsignal.Values.Time;
% thetha     = xsignal.Values.Data(:,1);
% thethadot  = xsignal.Values.Data(:,2);

% extract data generated from 'to workspace' block(using the timeseries
% format)
% t          = simulink.simX.Time;
% thetha     = simulink.simX.Data(:,1);
% thethadot  = simulink.simX.Data(:,2);

% extract data generated from 'to workspace' block(using the
% structurewithtime format)
% t          = simulink.simX.time;
% thetha     = simulink.simX.signals.values(:,1);
% thethadot  = simulink.simX.signals.values(:,2);


% extract data genterated by using logging technique
xsignal      = simulink.logsout.getElement('x');
t            = xsignal.Values.Time;
thetha       = xsignal.Values.Data(:,1);
thethadot    = xsignal.Values.Data(:,2);


[thethamax, indexmax] = max(thetha);
tmax = t(indexmax);

[thethadotmax, indexdotmax] = max(thethadot);
tdotmax = t(indexdotmax);

figure
subplot(2,1,1)
plot(t,thetha)
hold on
plot(tmax,thethamax,'rx','linewidth',2)
xlabel('t (seconds)')
ylabel('thetha (rad)')
grid on
title('Data generated using simulink model')

subplot(2,1,2)
plot(t,thethadot)
hold on
plot(tdotmax, thethadotmax,'bx','linewidth',2)
xlabel('t (seconds)')
ylabel('thetha (rad)')
grid on


