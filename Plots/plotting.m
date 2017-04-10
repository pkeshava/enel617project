%% ENEL 617 Project Report Plots
%% Conversion Gain
clc
hold on
M = csvread('FinalGainLowIF.csv',1,0,[1 0 51 1]);
x_lo = M(:,1);
y_lo = M(:,2);

M = csvread('FinalGainHighIF.csv',1,0,[1 0 51 1]);
x_hi = M(:,1);
y_hi = M(:,2);

plot(x_lo,y_lo);
x2 = 7.75e10;
y2 = -12.5;
txt2 = '\leftarrow Low IF (77.5GHz) Gain = -12.5dB';
text(x2,y2,txt2)

plot(x_hi,y_hi);
x1 = 8.05e10;
y1 = -13.15;
txt1 = '\leftarrow High IF (80.5GHz) Gain = -13.15dB';
text(x1,y1,txt1)

xlabel('Frequency');
ylabel('Gain, dB');
title('Conversion Gain of IF Signals');
legend('LO IF Gain Swept','High IF Gain Swept');
hold off

%% S11 and S22
figure;
M = csvread('FinalS11Rect.csv',1,0,[1 0 41 1]);
x_11 = M(:,1);
y_11 = M(:,2);
plot(x_11,y_11);
xlabel('Frequency');
ylabel('Return Loss, dB');
title('S11 - RF Port Input Match with 50 \Omega Reference');


figure;
M = csvread('FinalS22Rect.csv',1,0,[1 0 41 1]);
x_22 = M(:,1);
y_22 = M(:,2);
plot(x_22,y_22,'r');
xlabel('Frequency');
ylabel('Return Loss, dB');
title('S22 - IF Port Output Match with 50 \Omega Reference');

%% Noise Figure

figure;
M = csvread('FinalNF.csv',1,0,[1 0 41 1]);
x_nf = M(:,1);
y_nf = M(:,2);
plot(x_nf,y_nf);
xlabel('Frequency');
ylabel('Noise Figure, dB');
title('Gilbert Cell Noise Figure');
