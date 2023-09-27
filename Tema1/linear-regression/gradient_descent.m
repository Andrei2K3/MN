function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  [m n] = size(FeatureMatrix);%aceleasi valori ca cele ale parametrilor
  Theta = zeros(n+1,1);
  Theta2 = zeros(n+1,1);
  for k = 1:iter
    for j = 2:n+1
%      rez = 0;
%      for i = 1:m
%        rez = rez + (FeatureMatrix(i,:)*Theta(2:n+1) - Y(i))*FeatureMatrix(i,j-1);
%      endfor
%      rez = rez/m;
      Result = FeatureMatrix*Theta(2:n+1)-Y;
      rez=0;
      for i = 1:m
        rez = rez + Result(i)*FeatureMatrix(i,j-1);
      endfor
      rez = rez/m;
      Theta2(j) = Theta(j) - alpha*rez;
    endfor
    Theta = Theta2;
  endfor
endfunction
