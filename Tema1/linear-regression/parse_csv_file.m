function [Y, InitialMatrix] = parse_csv_file(file_path)
  %Citeste datele din fisierul CSV, incepand cu linia 1, coloana 0
  data = dlmread(file_path, ',', 1, 0);
  %Deschidem fisierul inca o data
  file=fopen(file_path, 'r');
  %Aflam dimensiunile matricei din fisier
  [m n] = size(data);
  %Citim prima linie din fisier, nu ne intereseaza aceste informatii
  line = textscan(file,'%s',n,'Delimiter',',');
  %
  InitialMatrix = cell(m,n-1);
  Y = zeros(m,1);
  for i = 1:m
    Y(i) = fscanf(file, '%f', 1);
    %Citim linia ca mai multe stringuri separate de ','
    line = textscan(file,'%s',n,'Delimiter',',');
    for j = 1:n-1
      InitialMatrix{i,j} = line{1}{j+1};
    endfor
  endfor
  fclose(file);
endfunction
