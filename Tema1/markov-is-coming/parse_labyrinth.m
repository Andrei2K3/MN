function [Labyrinth] = parse_labyrinth(file_path)
  file=fileread(file_path);
  %Citesc toate linile deodata, acesta fiind separate prin '\n'
  linii=strsplit(file,'\n');
  %Prelucrez linia 1
  linia_1=str2num(linii{1});
  n=linia_1(1);
  m=linia_1(2);
  %Initializez matricea nula
  Labyrinth = zeros(n,m);
  %Initializez matricea cu valorile din fisier
  for i = 1:n
    linia_i=str2num(linii{i+1});
    Labyrinth(i,:)=linia_i;
  endfor
endfunction
