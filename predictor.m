%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program: Predictor.m
% Author: Chase Nairn-Howard
% Desc: Predictor.m uses logistic regression
% to predict when economic recessions will occur
% in the United States. The data it uses is from the past 50 years.
%
% In particular, it uses dates and their corresponding economic leading
% indicators to learn a non-linear hypothesis function to fit to the data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


LI_Data = dlmread("leading_indicators_formatted.csv"); %Get LI data
RD_Data = dlmread("recession_dates_formatted.csv"); %Get LI data

%our datapoints of interest: Dates and their corresponding
%leading Indicator values.
%We are going to increase the number of parameters per datapoint to allow
%for a non-linear hypothesis function.
X = LI_Data;        %datapoints of interest

X = [X, X(:,2).^2];  %Adding LI^2
X = [X, sin(X(:,1))];  %Adding sin(Year)
X = [X, sin(X(:,1).^2 )];  %Adding sin^2(Year)
X = [X, sin(X(:,1).^3 )];  %Adding sin^3(Year)
X = [X, ( sin(X(:,4)) - sin(X(:,3))  )];  %Adding sin(Year)-LI

%normalize data
for i=1:size(X,2)
  X(:,i) = normalize( X(:,i) );
endfor

%What we want to predict: if a recession happens or doesn't happen
%for a corresponding year
Y = RD_Data(:,2);

%defining a few useful variables:
nIter = 1000;       %how many iterations we want to run gradient descent for
nDP = size(X, 1);   %number of data points we have to work with
nPara = size(X,2);  %number of parameters per data point
alpha = 1;          %set the learning rate to 1
lambda = 100;        %set lambda to a high value

%Defining Theta
Theta = ones(nPara, 1); %initialize the weights of Theta to 1

%Make a cost history so we can see if gradient descent is implemented
%correctly
costHist = zeros(nIter, 1);

%Run gradient descent with regularization
for i = 1:nIter
  costHist(i, 1) = cost(Theta, Y, X);
  hTheta = sigmoid(X * Theta) - Y;
  Theta = Theta - ((alpha / nDP) * ((X' * hTheta) + lambda * Theta ));
end

%force values of hypothesis function to be 0 or 1
hFunc = (X*Theta);
for i=1:length(hFunc)
  if (hFunc(i) >= 0.5)
    hFunc(i) = 1;
  else
    hFunc(i) = 0;
  endif
endfor

%plot the hypothesis function vs the actual data
plot(RD_Data(:,1), RD_Data(:,2), "marker", ".", "color", "k") %actual
hold on;
plot(RD_Data(:,1), hFunc, "marker", ".", "color", "r") %hypothesis

%check accuracy of hFunc
correct = 0;
for i=1:nDP
  if(hFunc(i) == RD_Data(i,2))
      correct = correct + 1;
  else
      %nothing
  endif
endfor

accuracy = (correct / nDP)
