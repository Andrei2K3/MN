function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  %Solutia I
  %[m n] = size(FeatureMatrix);
  %Error = 0;
  %for i = 1:m
  %  Error = Error + (FeatureMatrix(i,:)*Theta(2:n+1) - Y(i))^2;
  %endfor
  %Error = Error / (2*m);

  %Solutia II
  [m n] = size(FeatureMatrix);
  %Aplic formula din problema
  Error = 0;
  Result = FeatureMatrix*Theta(2:n+1)-Y;
  for i = 1:m
    Error = Error + Result(i)^2;
  endfor
  Error = Error/(2*m);
endfunction
