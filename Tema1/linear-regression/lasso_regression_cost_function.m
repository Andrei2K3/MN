function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  %Am implementat formula din cerinta pentru L1
  [m n] = size(FeatureMatrix);
  Error = 0;
  Result = Y-FeatureMatrix*Theta(2:n+1);
  for i = 1:m
    Error = Error + Result(i)^2;
  endfor
  Error = Error/m;
  Error = Error + lambda*norm(Theta,1);
endfunction
