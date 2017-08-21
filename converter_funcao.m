%%-------------------------------------
% Converter uma função de transferencia
% continua para discreto.
%            1
% G(s) =------------
%        15s^2+8s+1
%%-------------------------------------

clear;clc
num=[1];
den=[15 8 1];
gs=tf(num,den)

Ts=1;
[numz,denz]=c2dm(num,den,Ts,'zoh');
gz=tf(numz,denz,Ts)
step(gs,gz);legend('Continuo','Discreto')