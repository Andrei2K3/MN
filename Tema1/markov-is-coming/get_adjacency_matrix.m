function [Adj] = get_adjacency_matrix(Labyrinth)
  [n, m] = size(Labyrinth);
  dim=n*m;
  %Initializez Adj ca matrice rara
  %Avem n*m noduri 'interne' plus WIN, LOSE
  Adj = sparse(dim+2,dim+2);
  for i = 1:n
    for j = 1:m
      nod = (i-1)*m + j; %determin nodul curent
      cod = uint8(Labyrinth(i,j)); %fac conversie la unsigned 8-bit integer
      if bitget(cod, 4) == 0 %avem vecin deasupra
        if i > 1
          vecin = nod - m;
          Adj(nod,vecin) = 1;
        else
          Adj(nod,dim+1) = 1; %avem vecin pe WIN
        endif
      end
      if bitget(cod, 3) == 0 %avem vecin sub
        if i < n
          vecin = nod + m;
          Adj(nod,vecin) = 1;
        else
          Adj(nod,dim+1) = 1; %avem vecin pe WIN
        endif
      end
      if bitget(cod, 2) == 0 %avem vecin la dreapta
        if j < m
          vecin = nod + 1;
          Adj(nod,vecin) = 1;
        else
          Adj(nod,dim+2) = 1; %avem vecin pe LOSE
        endif
      end
      if bitget(cod, 1) == 0 %avem vecin la stanga
        if j > 1
          vecin = nod - 1;
          Adj(nod,vecin) = 1;
        else
          Adj(nod,dim+2) = 1; %avem vecin pe LOSE
        endif
      end
    endfor
  endfor
  Adj(dim+1,dim+1)=1; %WIN are vecin pe WIN conform cerintei
  Adj(dim+2,dim+2)=1; %LOSE are vecin pe LOSE conform cerintei
endfunction

