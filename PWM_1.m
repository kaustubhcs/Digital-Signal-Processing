%% Pulse Modulation of Waves

%%
% 
% # Pulse Amplitude Modulation
% # Pulse Width Modulation
% # Pulse Position Modulation
%


%% Message Signal

%%
%
% Message signal is taken to be a sinusoidal signal
% 'a' and 'b' are subplot variables that decide the visual representation
% of the output signals

Am = 10;
t = 0:0.0001:10;
fm = 0.1;
message_signal = Am * sin (2 * pi * fm * t);
figure();
a = 2;
b = 3;
subplot(a,b,1);
plot(t,message_signal);
title('Message Signal');

%% Pulse Train Generation

%%
%
% We generate the pulse using the Pulse Train function.
%

d = 0:10; 
w = 0.5;
pulse = pulstran(t,d,'rectpuls',w);
subplot(a,b,2);
plot(t,pulse);
title('Carrier Signal');
%% Pulse Amplitude Modulation

%%
%
% $$P_{Amplitude Modulation} = Pulse * x(t)_{Message Signal}$$
%

pulse_amplitude_modulation = pulse;

for i=1:100001
    pulse_amplitude_modulation(i) = pulse_amplitude_modulation(i) * message_signal(i);
end
subplot(a,b,3);
plot(t,pulse_amplitude_modulation);
title('Pulse Amplitude Modulation');


%% Pulse Width Modulation
clc;
clear all;
close all;
F2=5; % message
F1=50; % carrier
A=5;
t=0:0.001:1;
c=A.*sawtooth(2*pi*F1*t);%Carrier sawtooth
subplot(3,1,1);
plot(t,c);
xlabel('time');
ylabel('Amplitude');
title('Carrier sawtooth wave');
grid on;
m=0.75*A.*sin(2*pi*F2*t);%Message amplitude must be less than Sawtooth
subplot(3,1,2);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;
n=length(c);%Length of carrier sawtooth is stored to ‘n’
for i=1:n%Comparing Message and Sawtooth amplitudes
if (m(i)>=c(i))
    pwm(i)=1;
else
    pwm(i)=0;
end
end
subplot(3,1,3);
plot(t,pwm);
xlabel('Time');
ylabel('Amplitude');
title('plot of PWM');
axis([0 1 0 2]);%X-Axis varies from 0 to 1 & Y-Axis from 0 to 2
grid on;
