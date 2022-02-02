%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function: normalization
% Author: Hasec Rainn
% Parameters: vector
% Desc: Takes in an input and normalizes its value(s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function n = normalize(data)
   dMean = mean(data);
   dStd = std(data);
   n = (data - dMean) ./ dStd;
endfunction 