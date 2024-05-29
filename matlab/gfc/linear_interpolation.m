%{ 
    The linear interpolation step of the Lora-Key algorithm. 
    ASSUMPTION: 4 times repeated linear interpolation is the same as 
    interpolating 4 values between each sample point. 
%}
function interpolated = linear_interpolation(signal, timesInterpolate)

    numSamples = size(signal);
    xSamples = 1:numSamples;
    xInterpolateStep = 1/(timesInterpolate+1);
    xInterpolated = 1:xInterpolateStep:numSamples;
    interpolated = interp1(xSamples, signal, xInterpolated);

end