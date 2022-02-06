%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function: Cost
% Author: Hasec Rainn
% Parameters: Theta (vector), Y (vector), X (matrix)
% Desc: Uses Theta, Y, and X to determine the cost of our current
%       hypothesis function H_theta(X). Uses manual loop approach to
%       avoid errors that arrise from log(0).
%       Additionally, limits the range of H_Theta to prevent Inf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function expense = cost(Theta, Y, X)
  m = size(X, 1); %number of data points
  hTheta = sigmoid(X*Theta); %hypothesis function
  
  %limit the range of hTheta to [10^-50, 0.9999999999999]
  for i=1:length(hTheta)
    if (hTheta(i) <= 10^(-50))
      hTheta(i) = 10^(-50);
    endif
    
        if (hTheta(i) >= 0.9999999999999)
      hTheta(i) = 0.9999999999999;
    endif
  endfor
  
  expense = 0;
  
  %calculate the expense
  for i = 1:m
    
    if Y(i) == 1
      expense = expense + -log(hTheta(i));
    endif
    
    if Y(i) == 0
      expense = expense + -log(1-hTheta(i));
    endif
    
  endfor
  
endfunction