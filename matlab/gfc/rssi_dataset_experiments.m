% load in datasets
load('RSSI_oliviera_walking.mat')
load('RSSI_oliviera_driving.mat')

% loading oliviera RSSI dataset samples
Xraw = table2array(RSSIolivierawalking);
X = Xraw(1:450,1:2) * -1;
Yraw = table2array(RSSIolivieradriving);
Y = Yraw(1:450, 1:2);

% plot samples
hold on 
plot(X)
plot(Y)
hold off

% trying to use with CFC funciton 
[idt, V, param] = GFC(X, Y, 0.5);

%{
    GIVES THE FOLLOWING ERROR:
    Error using fminusub (line 16)
    Objective function is undefined at initial point. Fminunc cannot
    continue.
%}