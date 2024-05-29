
load("datasets/RSSI_oliviera_driving.mat")

raw_signal = RSSIolivieradriving.GWRSSI;

subplot(4,1,1)
plot(raw_samples)
title("RSSI samples");

% TODO: apply CFG outlier rejection step

sg_signal = sgolayfilt(raw_signal, 3, 11);
subplot(4,1,3)
plot(sg_signal)
title("Savitzky-Golay filter")

interpolated_signal = linear_interpolation(sg_signal, 3);
subplot(4,1,4)
plot(interpolated_signal,".-")
title("Linear interpolation");