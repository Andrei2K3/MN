function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [n m] = size(InitialMatrix);
  %Am luat cazul defavorabil cand fiecare element e
  %string, ce implica doua inserari in noua matrice =>
  %2*m coloane
  FeatureMatrix = zeros(n,2*m);
  %Cu iF si jF ne deplasam in FeatureMatrix
  iF=0;
  jF=0;
  for i = 1:n
    iF = iF+1;
    jF = 0;
    for j = 1:m
      jF = jF+1;
      if strcmp(InitialMatrix{i,j}, "yes") %punem 1
        FeatureMatrix(iF,jF) = 1;
      elseif strcmp(InitialMatrix{i,j}, "no") %punem 0
        FeatureMatrix(iF,jF) = 0;
      elseif strcmp(InitialMatrix{i,j}, "semi-furnished") %punem 1 si 0
        FeatureMatrix(iF,jF) = 1;
        jF = jF+1;
        FeatureMatrix(iF,jF) = 0;
      elseif strcmp(InitialMatrix{i,j}, "unfurnished") %punem 0 si 1
        FeatureMatrix(iF,jF) = 0;
        jF = jF+1;
        FeatureMatrix(iF,jF) = 1;
      elseif strcmp(InitialMatrix{i,j}, "furnished") %punem 0 si 0
        FeatureMatrix(iF,jF) = 0;
        jF = jF+1;
        FeatureMatrix(iF,jF) = 0;
      else
        FeatureMatrix(iF,jF) = str2double(InitialMatrix{i,j}); %convertim stringul numar real
      endif
    endfor
  endfor
  FeatureMatrix=resize(FeatureMatrix, iF, jF); %redimensionam matricea
endfunction
