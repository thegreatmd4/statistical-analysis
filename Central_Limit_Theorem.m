clc;
clear;
close all;

population = csvread('noisySignal1.csv');
Real_Mean = mean(population);
Real_S = sqrt(var(population));


Number_Of_Samples = 10000;
Size_Of_Samples = 16;
Sample_Matrix = zeros(Number_Of_Samples,Size_Of_Samples);
Sample_Means = zeros(Number_Of_Samples,1);
Sample_Standard_Deviations = zeros(Number_Of_Samples,1);

for i=1:Number_Of_Samples
    k = round(size(population,1)*rand(1,Size_Of_Samples)+0.5,0);
    Sample_Matrix(i,:) = population(k);
    Sample_Means(i) = mean(Sample_Matrix(i,:));
    Sample_Standard_Deviations(i) = sqrt(var(Sample_Matrix(i,:)));
end

Estimated_Mean = mean(Sample_Means);
Estimated_S = sqrt(var(Sample_Standard_Deviations))*sqrt(Size_Of_Samples);

figure()
subplot(2,1,1)
h1 = histogram(population);
xlabel('population')
hold on

subplot(2,1,2)
h2 = histogram(Sample_Means);
xlabel('Sample Means')


