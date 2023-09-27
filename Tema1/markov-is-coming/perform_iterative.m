function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  x1 = x0;
  x2 = x1;
  [n,m] = size(x0);
  for i = 1:max_steps
    %Aplicam formula din cerinta problemei
    x2=G*x1+c;
    %Determinam eroare
    err = norm(x2-x1);
    %
    x1=x2;
    steps = i;
    if err <= tol
      break;
    endif
  endfor
  x=x1;
endfunction
