function [J, grad] = cost_function(params, X, y, lambda, ...
  input_layer_size, hidden_layer_size, ...
  output_layer_size)
  %Construiesc matricele Theta1 si Theta2 pe baza lui 'params'
  [n m] = size(params);
  nr_elem_theta_1 = hidden_layer_size * (input_layer_size + 1);
  n_1 = hidden_layer_size;%nr linii Theta1
  m_1 = input_layer_size+1;%nr coloane Theta1
  Theta1 = reshape(params(1:nr_elem_theta_1), n_1, m_1);
  n_2 = output_layer_size;%nr linii Theta2
  m_2 = hidden_layer_size+1;%nr linii Theta2
  Theta2 = reshape(params(1+nr_elem_theta_1:n), n_2, m_2);
  %Forward propagation
  m = size(X, 1);
  a1 = [ones(m, 1) X];
  z2 = a1 * Theta1';
  a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);
  %Creez matricea "asociata" lui y
  y_n = size(y,1);
  y_mat = zeros(y_n,output_layer_size);
  for i = 1:y_n
    y_mat(i,y(i)) = 1;
  endfor
  %Calculez pe J
  comp1 = -1/m *sum(sum(y_mat.*log(a3)+(1-y_mat).*log(1-a3)));
  comp2 = sum(sum(Theta1(:,2:m_1).^2));
  comp3 = sum(sum(Theta2(:,2:m_2).^2));
  J = comp1+lambda/(2*m)*(comp2+comp3);
  %Backpropagation
  delta3 = a3 - y_mat;
  delta2 = (delta3*Theta2).*[ones(size(z2, 1), 1) sigmoidderivat(z2)];
  delta2 = delta2(:,2:end);
  %Calculez gradientii
  Theta1_gradient = 1/m*(delta2'*a1);
  Theta1_gradient(:,2:end) = Theta1_gradient(:,2:end) + lambda/m*Theta1(:,2:m_1);
  Theta2_gradient = 1/m*(delta3'*a2);
  Theta2_gradient(:,2:end) = Theta2_gradient(:,2:end) + lambda/m*Theta2(:,2:m_2);
  %Compun rezultatul cerut de problema
  grad = [Theta1_gradient(:) ; Theta2_gradient(:)];
endfunction
