function [Y, InitialMatrix] = parse_data_set_file(file_path)
  %Deschidem fisierul in modul read
  file=fopen(file_path, 'r');
  %Citim dimensiunile
  m = fscanf(file, '%d', 1);
  n = fscanf(file, '%d', 1);
  %
  Y = zeros(m,1);
  %Initializam matricea de mxn celule
  InitialMatrix = cell(m,n);
  %
  for i = 1:m
    %Citim Y(i)
    Y(i) = fscanf(file, '%f', 1);
    %Citim restul liniei cu separator implicit ' '
    data = textscan(file, '%s', n);
    %
    for j = 1:n
       InitialMatrix{i,j} = data{1}{j};
    endfor
  endfor
  fclose(file);
endfunction
