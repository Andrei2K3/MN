function [y] = sigmoidderivat(x)
  y = sigmoid(x).*(1-sigmoid(x));
endfunction
