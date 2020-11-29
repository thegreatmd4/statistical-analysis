clc;
clear;
close all;

population = csvread('noisySignal1.csv');
Real_Mean = mean(population);
Real_S = sqrt(var(population));


Size_Of_Sample = 16;
v = Size_Of_Sample-1;
Confidence_Level = 95;
Confidence_Level = Confidence_Level/100;
Alpha = 1-Confidence_Level;
Sample = zeros(1,Size_Of_Sample);

k = round(size(population,1)*rand(1,Size_Of_Sample)+0.5,0);
Sample(1,:) = population(k);
Sample_Mean = mean(Sample);
S = sqrt(var(Sample));
Estimated_Mean1 = Sample_Mean + tinv(0.5+Confidence_Level/2,v)*S/sqrt(Size_Of_Sample);
Estimated_Mean2 = Sample_Mean - tinv(0.5+Confidence_Level/2,v)*S/sqrt(Size_Of_Sample);

Estimated_sigma1 = v*S^2/chi2inv(Alpha/2,v);
Estimated_sigma2 = v*S^2/chi2inv(1-Alpha/2,v);
