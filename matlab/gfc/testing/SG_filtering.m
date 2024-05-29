
% load RSSI samples from dataset
load('datasets/RSSI_oliviera_driving.mat')
numSamples = 450;
gatewaySignal = RSSIolivieradriving.GWRSSI(1:numSamples);
nodeSignal = RSSIolivieradriving.EDRSSI(1:numSamples);

% specify parameters for SG filtering
order = 3;
frameLength = 11;

% perform sg filtering 
gatewayFiltered = sgolayfilt(gatewaySignal,order,frameLength);
nodeFiltered = sgolayfilt(nodeSignal,order,frameLength);

% plot results
hold on 
plot(gatewaySignal, ':')
plot(gatewayFiltered, '.-')
plot(nodeSignal, ':')
plot(nodeFiltered, '.-')
legend('GW-raw', 'GW-filtered','Node-raw', 'Node-filtered')
hold off