clc;
clear;
close all;


g=0.8;
A0=6e-6;
N=650;
mu0=4*pi*10^(-7);
teta=linspace(-pi/6,pi/6,100);

L=mu0*N^2/(2*g)*A0*(1-(16/pi^2)*teta.^2);
plot(teta,L);
grid on
xlabel('teta')
ylabel('L(teta)')

