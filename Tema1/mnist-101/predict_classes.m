function [classes] = predict_classes(X, weights, ...
  input_layer_size, hidden_layer_size, ...
  output_layer_size)
  m = size(X, 1);
  classes = zeros(m, 1);
  n_weights = size(weights,1);
  nr_elem_theta_1 = hidden_layer_size*(input_layer_size + 1);
  n_1 = hidden_layer_size; %nr linii Theta1
  m_1 = input_layer_size+1; %nr coloane Theta1
  Theta1 = reshape(weights(1:nr_elem_theta_1), n_1, m_1);
  n_2 = output_layer_size; %nr linii Theta2
  m_2 = hidden_layer_size+1; %nr linii Theta2
  Theta2 = reshape(weights(1+nr_elem_theta_1:n_weights), n_2, m_2);
  for i = 1:m
    %Construiesc vectorul activarilor neuronilor din layer-ul de input din datele de intrare
    a1 = [1; X(i, :)'];
    %Aplic prima transformare liniara => vector al pre-activarii
    z2 = Theta1*a1;
    %Aplic functia de activare
    a2 = [1; sigmoid(z2)];
    %Aplic si cea de-a doua transformare liniara
    z3 = Theta2*a2;
    %Aplic iar functia de activare
    a3 = sigmoid(z3);
    %Determin clasa prezisa, adica pozitia in care se afla valoarea maxima din a3
    [p] = size(a3,1);
    max = a3(1);
    poz = 1;
    for k = 2:p
      if a3(k)>max
        max = a3(k);
        poz = k;
      endif
    endfor
    classes(i)=poz;
  endfor
endfunction
