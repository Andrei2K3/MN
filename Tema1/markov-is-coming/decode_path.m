function [decoded_path] = decode_path(path, lines, cols)
  [n,m] = size(path);
  %Datele le retin intr o matrice cu n-1 linii (nu ma intereseaza
  %a n-a valoare din path) si 2 coloane pentru perechea (x,y)
  decoded_path = zeros(n-1,2);
  for i = 1:n-1
    x = floor(path(i)/cols);
    if x*cols != path(i)
      x = x + 1;
    endif
    y = path(i) - (x - 1) * cols;
    decoded_path(i,:) = [x, y];
  endfor
endfunction
