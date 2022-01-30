%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program: Predictor.m
% Author: Chase Nairn-Howard
% Desc: Predictor.m uses machine learning (specifcally polynominal
% linear regression) to predict when economic recessions will occur
% in the United States. The data it uses is from the past 50 years.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%data samples. Each row represents a specific data point,
%columns represent a specific parameter of a data point (ie: year,
% number of cars sold, inflation rate)
X = csvread("leading_indicators_formatted.csv") %Get data
X = X(:, 2)