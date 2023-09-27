function [G, c] = get_Jacobi_parameters(Link)
  [n, m] = size(Link);
  %G=submatricea lui Link care nu contine nodurile WIN si LOSE
  G = sparse(n-2,m-2);
  G = Link(1:n-2,1:m-2);
  %c=coloana corespunzatoare nodului WIN(mai precis
  %nodurile(STATE) care au arc spre WIN)
  c = sparse(n-2,1);
  c = Link(1:n-2,m-1);
endfunction
