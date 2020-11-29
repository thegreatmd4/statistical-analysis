clc;
clear;
close all;

x0=20;
dx=0.5;
k0=8.5;
dk=0.5;
g0=9.8;
dg=0.01;

x=x0+(dx/2)*randn(10000,1);
k=k0+(dk/2)*randn(10000,1);
g=g0+(dg/2)*randn(10000,1);

m=x.*k./g;
calc=mean(m)
error=2*sqrt(var(m))

figure()
subplot(2,2,1)
h1=histogram(x);
title('x')

subplot(2,2,2)
h2=histogram(k);
title('k')

subplot(2,2,3)
h3=histogram(g);
title('g')

subplot(2,2,4)
h4=histogram(m);
title('m=x*k/g')



