clc;
clear;
close all;

%XY = xlsread('Book3.xlsx');
X=[3 5 7 9 11]';
Y=[0.85 1.32 1.72 2.28 2.67]';
XY=[X Y];
size1=round(size(XY,1)/2);
size2=size(XY,1)-size1;

Training_Data=zeros(size1,2);
Test_Data=zeros(size2,2);

for i=1:size1
    Training_Data(i,:)=XY(2*i-1,:);
end
for i=1:size2
    Test_Data(i,:)=XY(2*i,:);
end

X1=ones(size1,2);
X1(:,2)=Training_Data(:,1);
Y1=Training_Data(:,2);
A=inv(X1'*X1)*X1'*Y1;
Yc1=X1*A;
RSS1=sum((Y1-Yc1).^2);
MSE1=RSS1/size1;

X2=ones(size2,2);
X2(:,2)=Test_Data(:,1);
Y2=Test_Data(:,2);
Yc2=X2*A;
RSS2=sum((Y2-Yc2).^2);
MSE2=RSS2/size2;

if MSE2/MSE1>1.2
   disp('Overfit'); 
end

figure()
plot(Training_Data(:,1),Training_Data(:,2),'bo', 'LineWidth',2)
hold on
plot(Test_Data(:,1),Test_Data(:,2),'r*')
grid on
hold on








