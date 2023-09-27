function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  [n m] = size(X);
  %Iau poz=[n*percent] ca sa avem poz numar natural
  poz = floor(n * percent);
  %index = o permutare random din Sn
  index = randperm(n);
  %Punem elementele ce ne intereseaza ca-n enunt
  X_train = X(index(1:poz),:);
  X_test = X(index(poz+1:n),:);
  y_train = y(index(1:poz));
  y_test = y(index(poz+1:n));
endfunction
