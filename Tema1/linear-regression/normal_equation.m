function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  %Fransformam sistemul intr unul cu matricea sistemului patratica
  Y = FeatureMatrix' * Y;
  FeatureMatrix = FeatureMatrix' * FeatureMatrix;
  %
  [m n] = size(FeatureMatrix);
  Theta = zeros(n+1,1);
  %Verificam daca FeatureMatrix este pozitiv definita
  %adica daca are toate valorile proprii > 0
  if !(all(eig(FeatureMatrix) > 0))
    return;
  endif
  %Scriem pseudocodul
  Theta_0 = zeros(n,1);
  r_0 = Y-FeatureMatrix*Theta_0;
  v_1 = r_0;
  Theta_1 = Theta_0;
  tol_square = tol*tol;
  k = 1;
  while k <= iter && norm(r_0) > tol %<=> r'*r=norm(r)^2>tol_square
    t_1 = r_0'*r_0/(v_1'*FeatureMatrix*v_1);
    Theta_1 = Theta_0+t_1*v_1;
    r_1 = r_0-t_1*FeatureMatrix*v_1;
    s_1 = r_1'*r_1/(r_0'*r_0);
    v_2 = r_1+s_1*v_1;
    k = k+1;
    %%
    r_0=r_1;
    v_1=v_2;
    Theta_0=Theta_1;
  endwhile
  Theta = [0; Theta_0];%obtin pe Theta care ma intereseaza
endfunction
