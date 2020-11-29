clc;
clear;
close all;

XY = xlsread('Book3.xlsx');
X=XY(:,1);
Y=XY(:,2);

p1=polyfit(X,Y,1);
p2=polyfit(X,Y,2);
d=linspace(min(X),max(X),size(X,1)*10);
curve1=polyval(p1,d);
curve2=polyval(p2,d);
curve3=spline(X,Y,d);

figure()
plot(X,Y,'bo','linewidth',1.5)
hold on
plot(d,curve1,'linewidth',1.5);
hold on
plot(d,curve2,'linewidth',1.5);
hold on
plot(d,curve3,'linewidth',1.5);
hold on
legend('data points','linear','quad','spline')
xlabel('x')
ylabel('y')
