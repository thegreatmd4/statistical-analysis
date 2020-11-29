clc;
clear;
close all;

x=xlsread('Book4.xlsx');
M=mean(x);
s=std(x);

delta=abs(x-mean(x));
alpha=0.05;
n=10;
v=n-2;
t=tinv(0.975,v);

taw=t*(n-1)/sqrt(n*(v+t^2));

for ii=1:n
    if delta(ii)>(taw*s)
        disp([num2str(x(ii)),' is outlier']);
    end
end


