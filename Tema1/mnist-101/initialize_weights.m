function [matrix] = initialize_weights(L_prev, L_next)
  %Determinam pe epsilon
  eps_0 = sqrt(6) / sqrt(L_prev + L_next);
  %Initializam matricea cu valori random dupa formula din README
  matrix = -eps_0 + (eps_0-(-eps_0)).*rand(L_next, L_prev+1);
endfunction
