%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function: Sigmoid
% Author: Chase Nairn-Howard
% Parameters: scalar, vector, or matrix
% Desc: Takes an input and forces its value(s) to be between
%       0 and 1. If a matrix or vector, sigmoid is applied to
%       each element.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = sigmoid(z)
  result = 1 ./ ( 1 + e .^(-z) );
endfunction