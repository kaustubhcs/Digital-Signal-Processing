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