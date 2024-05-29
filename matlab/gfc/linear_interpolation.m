
% TODO: use result of pipeline instead of raw RSSI values
load("datasets/RSSI_oliviera_driving.mat");

% assumption: interpolating 4 values is the same as 4 times repeated
% interpolation

timesInterpolate = 4;
numSamples = 100;

xSamples = 1:numSamples;
xInterpolateStep = 1/(timesInterpolate+1);
xInterpolated = 1:xInterpolateStep:numSamples;

samples = RSSIolivieradriving.GWRSSI(1:numSamples);
interpolated = interp1(xSamples, samples, xInterpolated);

plot(xSamples,samples,'o',xInterpolated ,interpolated,':.');