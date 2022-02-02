%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program: Predictor.m
% Author: Hasec Rainn
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
%for a non-linear hypothesis function. Specifically, let the 3rd, 4th
%5th, and 6th columns represent LI^2, LI^3, LI^4, and LI^5 respectively

X = LI_Data;        %datapoints of interest
X = [X, X(:,2).^2];  %Adding LI^2
X = [X, X(:,2).^3];  %Adding LI^3
X = [X, X(:,2).^4];  %Adding LI^4
X = [X, X(:,2).^5];  %Adding LI^5

%normalize data
X(:,1) = normalize( X(:,1) );
X(:,2) = normalize( X(:,2) );
X(:,3) = normalize( X(:,3) );
X(:,4) = normalize( X(:,4) );
X(:,5) = normalize( X(:,5) );
X(:,6) = normalize( X(:,6) );


%What we want to predict: if a recession happens or doesn't happen
%for a corresponding year
Y = RD_Data(:,2);

%defining a few useful variables:
nIter = 1000;       %how many iterations we want to run gradient descent for
nDP = size(X, 1);   %number of data points we have to work with
nPara = size(X,2);  %number of parameters per data point
alpha = 1;           %set the learning rate to 1

%Defining Theta
Theta = ones(nPara, 1); %initialize the weights of Theta to 1

%Make a cost history so we can see if gradient descent is implemented
%correctly
costHist = zeros(nIter, 1);

%Run gradient descent
for i = 1:nIter
  costHist(i, 1) = cost(Theta, Y, X);
  hTheta = sigmoid(X * Theta) - Y;
  Theta = Theta - ((alpha / nDP) * (X' * hTheta));
end

%plot the hypothesis function vs the actual data
