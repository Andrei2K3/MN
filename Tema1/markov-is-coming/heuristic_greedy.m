function [path] = heuristic_greedy(start_position, probabilities, Adj)
  %Am adaptat pseudocodul la GNU Octave
  [n,m] = size(Adj);
  path = zeros(n,1);
  visited = zeros(n,1);
  WIN = n-1;
  vf = 1;
  %Path l-am implementat ca o stiva indexata de la 1
  path(vf) = start_position;
  visited(start_position) = 1;
  while vf>0 %cat timp stiva e nevida
    position = path(vf); %path(vf)=top()
    if position == WIN
      break;
    endif
    %Verificam daca avem vecini nevizitati
    ok = 0;
    for i = 1:n
      if Adj(position,i) == 1 && visited(i) == 0
        ok = 1;
        break;
      endif
    endfor
    %
    if ok == 0 %am ajustat putin pseudocodul
      vf = vf - 1;
    else
      %Determin vecinul cu probabilitate maxima
      pmax = 0;
      neigh = -1;
      for i = 1:n
        if Adj(position,i) == 1 && visited(i) == 0 && probabilities(i) > pmax
          pmax = probabilities(i);
          neigh = i;
        endif
      endfor
      %
      visited(neigh) = 1; %marcam vecinul ca vizitat
      vf = vf + 1;
      path(vf) = neigh; %il punem in stiva
    endif
  endwhile
  path = resize(path,vf,1); %redimensionam stiva
endfunction
