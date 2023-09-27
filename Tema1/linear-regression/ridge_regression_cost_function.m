function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  %Am implementat formula din cerinta pentru L1
  [m n] = size(FeatureMatrix);
  Error = 0;
  %Prima suma din problema
  Result = FeatureMatrix*Theta(2:n+1) - Y;
  for i = 1:m
    Error = Error + Result(i)^2;
  endfor
  Error = Error/(2*m);
  %A doua suma din problema
  sum_patrate=0;
  for j = 1:n+1
    sum_patrate = sum_patrate + Theta(j)^2;
  endfor
  Error = Error + lambda*sum_patrate;
endfunction
