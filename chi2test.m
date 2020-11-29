clc;
clear;
close all;

X = randn(10000,1);
Mean=mean(X);
sigma=sqrt(var(X));

[midpoints,edges] = histcounts(X);
Number_Of_Bins = size(midpoints,2);
n = zeros(1,size(edges,2));

for i=1:size(X,1)
    for j=1:Number_Of_Bins
        if (X(i)>=edges(j) && X(i)<=edges(j+1))
            n(j)=n(j)+1;
        end
    end
end

figure()
h = histogram(X); 
hold on
c = h.BinWidth;
Bin_Centers = edges+c/2; 
nn = normpdf(Bin_Centers,Mean,sigma)*size(X,1)*c;
plot(Bin_Centers,nn,'b-o');
legend ('histogram','normal prediction')

chi2 = sum(((n-nn).^2)./nn);
v=Number_Of_Bins-2;
1-chi2cdf(chi2,v)

