function geraMatConf(respostas, predito, medidas)
%GERAMATCONF Funcao que vai gerar e imprimir a matriz de confusao para os
%dados passados como parametro para a funcao

%% Geracao dos dados necessarios para a criacao da matriz de confusao

% Passos para a criacao da matriz de confusao
isLabels = 0:10;
nLabels = numel(isLabels);
medidas = medidas';
[n,p] = size(medidas);

[~,grpLabel] = ismember(predito,isLabels);
grpLabel(1, :) = grpLabel(1, :) - 1;
labelMat = zeros(nLabels,n); 
idxLinear = sub2ind([nLabels n],grpLabel,(1:n)); 
labelMat(idxLinear) = 1; % Flags the row corresponding to the class 
[~,grpY] = ismember(respostas,isLabels); 
grpY(1, :) = grpY(1, :) - 1;
YMat = zeros(nLabels,n); 
idxLinearY = sub2ind([nLabels n],grpY,(1:n)); 
YMat(idxLinearY) = 1;

figure;
plotconfusion(YMat, labelMat);


end

