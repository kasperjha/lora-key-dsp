%{ 
    Outlier rejection step of Lora-Key algorithm DSP phase.
    Applies Gaussian Field Consensus matching algorithm.
    TODO: needs to be implemented
%}
function signal = outliers(signal)
    disp("Outlier rejection step not implemented!")
    signal = signal;
end



%{ 
    Filtering step of Lora-Key algorithm DSP phase.
    Applies a Savitzky Golay filter smoothing filter.
    TODO: figure out appropriate degree and windowLength.
%}
function signal = filtering(signal)
     signal = sgolayfilt(signal, 3, 11);
end



%{ 
    The linear interpolation step of the Lora-Key algorithm. 
    ASSUMPTION: 4 times repeated linear interpolation is the same as 
    interpolating 4 values between each sample point. 
%}
function signal = interpolation(signal, timesInterpolate)
    numSamples = size(signal);
    xSamples = 1:numSamples;
    xInterpolateStep = 1/(timesInterpolate+1);
    xInterpolated = 1:xInterpolateStep:numSamples;
    signal = interp1(xSamples, signal, xInterpolated);
end

function [raw, step1, step2, step3] = pipeline(gatewaySamples, nodeSamples)
    
    raw = [gatewaySamples, nodeSamples];
    subplot(4,1,1)
    plot(raw)
    title("RSSI samples");

    step1 = [outliers(raw(:,1)), outliers(raw(:,2))];
    subplot(4,1,2)
    plot(step1)
    title("Outlier rejection (TODO)")

    step2 = [filtering(step1(:,1)), filtering(step1(:,2))];
    subplot(4,1,3)
    plot(step2)
    title("Savitzky-Golay filter")
 
    step3 = [interpolation(step2(:,1), 3).', interpolation(step2(:,2), 3).'];
    subplot(4,1,4)
    plot(step3,".-")
    title("Linear interpolation");
end

load("datasets/RSSI_oliviera_driving.mat")
pipeline(RSSIolivieradriving.GWRSSI, RSSIolivieradriving.EDRSSI)

% load("datasets/RSSI_oliviera_walking.mat")
% pipeline(RSSIolivierawalking.GWRSSI, RSSIolivierawalking.EDRSSI)