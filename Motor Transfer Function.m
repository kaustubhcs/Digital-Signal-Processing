%% Experiment to Determine and Plot MOTOR TRANSFER FUNCTION

J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
P_motor = K / ( s * ( J*s + b ) * ( L*s + R ) + K^2 ); % multiplied by 
figure
step(P_motor)


%%
Kp = 48;
Ki = 0;
Kd = 0;
pid_param = 1;
pid_param = pid(Kp,Ki,Kd)

P_motor = pid_param * P_motor

figure(120)
rlocus(P_motor) % rlocus is defined for open loop functions and gives stability of closed loop

sgrid(0.8,9) % sgrid(zeta,Wn) sgrid draws s=jw line and the line representing cos(zeta)
motor = feedback(P_motor,1) % -1 if positive feedback

% pid = Kp + Kd * s + (Ki / s); 
% %Mp = 120%
% e^(-1 * pi * zeta / sqrt(1 - zeta^2)) * 100 = 120



figure

step(motor)


%%

Mp = 120
zeta = 0.8




%e^(-1 * pi * zeta / sqrt(1 - zeta^2)) * 100 = 120




%%

Kp = 121;
Ki = 0;
Kd = 0;

pid_param = pid(Kp,Ki,Kd);
P_motor = K / ( s * ( J*s + b ) * ( L*s + R ) + K^2 ); % multiplied by 

P_motor = pid_param * P_motor
motor = feedback(P_motor, 1 )

figure(100)

pzplot(P_motor)
figure(200)
step(motor)
figure(300)
rlocus(P_motor)