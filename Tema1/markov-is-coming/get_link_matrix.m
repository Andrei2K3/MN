function [Link] = get_link_matrix(Labyrinth)
  %In rezolvare ne vom folosi de matricea de adiacenta
  A = get_adjacency_matrix(Labyrinth);
  [n, m] = size(A);
  %Initializare Link ca matrice rara
  Link = sparse(n,m);
  for i = 1:n
    %Determinam numarul de vecini ai nodului i
    count = 0;
    for j = 1:m
      if A(i,j) != 0
        count = count + 1;
      endif
    endfor
    %
    if count > 0 %daca am gasit cel putin un vecin
      %Umplem linia i cu 1/count in pozitile de "interes"
      count = 1 / count;
      for j = 1:m
        if A(i,j) == 1
          Link(i,j) = count;
        endif
      endfor
    endif
    %
  endfor
endfunction
