function [X, y] = load_dataset(path)
  %Punem informatiile cerute in X si y
  information = load(path);
  y = information.y;
  X = information.X;
endfunction
