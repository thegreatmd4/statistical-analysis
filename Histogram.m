clc;
clear;
close all;

x = csvread('noisySignal1.csv');
M=mean(x);
V=var(x);
sigma=sqrt(V);

figure()
subplot(3,1,1)
h1 = histogram(x);
h1.Normalization='count';
xlabel('count')
hold on

subplot(3,1,2)
h2 = histogram(x);
h2.Normalization='probability';
xlabel('probability')

subplot(3,1,3)
h3 = histogram(x);
h3.Normalization='pdf';
%h3.BinWidth = 1.5;
xlabel('pdf')
hold on
c = h3.BinWidth;
binCenters = -(max(x)-c):c:(max(x)-c); 
y = normpdf(binCenters,M,sigma);
plot(binCenters,y,'k','linewidth',2);


