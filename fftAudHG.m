clear;

t = linspace(-5, 5, 600);
dt = (5+5)/600;
df = 1/10;
fmax = (1/dt)/2;
f = 0:df:fmax;

a = 2.77;
t0 = 0;

yG = exp(-a*(t-t0).^2);
yS = square(t);
yC = cos(t);
yM = t;



% yG

subplot(4,3,1);
plot(t,yG,"r."); hold on;
title("yG")
hold on;

subplot(4,3,2);
plot(f,abs(fft(yG(1:length(f)))),"r."); hold on;
hold on;

subplot(4,3,3);
plot(t,ifft(fft(yG)),"r."); hold on;
hold on;

% This function's FFT shows largest values around the zero area but
% steadily decreases as the f value increases. Most of the points serve to
% fit an exponential function of sorts, which tracks given the nature of
% the e^x taylor. 

% yS

subplot(4,3,4);
plot(t,yS,"g."); hold on;
title("yS")
hold on;

subplot(4,3,5);
plot(f,abs(fft(yS(1:length(f)))),"g."); hold on;
hold on;

subplot(4,3,6);
plot(t,ifft(fft(yS)),"g."); hold on;
hold on;

% This plot shows a heavy weight of values near f = 0 which steadily
% decrease thereafter. There are additionally values, even near heights,
% that are much lower than their surroundings. Notably, values varying by
% .8 integers have very low y values. 

% yC

subplot(4,3,7);
plot(t,yC,"b."); hold on;
title("yC")
hold on;

subplot(4,3,8);
plot(f,abs(fft(yC(1:length(f)))),"b."); hold on;
hold on;

subplot(4,3,9);
plot(t,ifft(fft(yC)),"b."); hold on;
hold on;

% This function has immense values at near zero points, but rapidly drops
% off to near zero values for the FFT. I am surprised there is more than
% just one value given the nature of the function as just being simply a
% cosine, though I suppose that may be part of the FFT.

% yM

subplot(4,3,10);
plot(t,yM,"."); hold on;
title("yM")
hold on;

subplot(4,3,11);
plot(f,abs(fft(yM(1:length(f)))),"."); hold on;
hold on;

subplot(4,3,12);
plot(t,ifft(fft(yM)),"."); hold on;
hold on;

% Similar to other functions, this function experiences a massive drop off
% leaving the near zero area. In fact, the drop off is much larger than
% other functions as can be seen by the much larger scale at these near
% zero areas when compared to surrounding omega values.

% AUDIO

In_ID = 0; 
Out_ID = 2;
FS = 44100;
sec = 8;

figure(2); hold on;

y = record_audio(sec,FS,In_ID);
plot_signal(y,FS);

f = fmax/length(y):fmax/length(y):fmax;
X = fft(y);
X(FS*sec/2:FS*sec) = 0;
figure(3); hold on;
plot(f, abs(X));

yy=ifft(X);

play_audio(yy,FS,Out_ID);