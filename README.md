# Recession_Predictor

Recession Predictor is a small program that predicts US economic recessions using logistic regression. 
It uses leading economic indicators' composites, dates, and recession occurances from the last 50 years to learn how to best predict when a recession will occur, 
doing so with 87.92% accuracy. Links to the training data can be found in "Documentation."

Recession Predictor is currently set up to predict regressions within the last 50 years, but it has the potential to predict recessions in the future as well.
Given projected leading economic indicator composites, it could predict when future economic recessions would occur.

To check out Recession_Predictor for yourself, simply download this reposity as a .zip file, unzip the reposity into a directory, and then run "predictor.m" in an Octave GUI. After a moment, logistic regression will complete, and the results will be displayed. First, a graph will pop up. The black points represent actual economic recessions, while the red points represent predicted economic recessions. Next, the accuracy of logistic regression will be printed out to the command line. Accuracy is calculated as (# of correct predictions) / (# of total data points).
