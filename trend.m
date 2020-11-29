clc;
clear;
close all;

XY = xlsread('Book2.xlsx');
X=XY(:,1);
Y=XY(:,2);

Xbar=mean(X)*ones(size(X,1),1);
Ybar=mean(Y)*ones(size(Y,1),1);

a=sum((X-Xbar).*(Y-Ybar));
b=sum((X-Xbar).^2)*sum((Y-Ybar).^2);
rxy=a/sqrt(b);
clear a b Xbar Ybar XY

switch (rxy/abs(rxy)) %sign function
    case -1
        disp('negative trend')
    case 1
        disp('positive trend')
    otherwise
        disp('zero trend')
end
    
c=90;
v=size(X,1)-2;
t=tinv(1-c/100,v);
rt=sqrt(t^2/(t^2+v));

switch ((rxy-rt)/abs(rxy-rt)) %compares rxy with critical value
    case -1
        disp('trend is not real')
    case 1
        disp('trend is real')
    otherwise
        disp('critical value')
end

[rxy,alpha]=corr(X,Y);
disp(['confidence level is ',num2str((1-alpha)*100),' %']);




