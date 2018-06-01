%% Script principal do projeto 4
% Alvaro Torres Vieira - 
% Victor Araujo Vieira - 14/0032801

close all;
clear all;
clc;

%% Le os arquivos csv que contem os dados de treino e teste
dados = readtable('./winequality-red.csv', 'Delimiter', ';');

% A sintaxe para acessar os valores das tabelas geradas na leitura dos csv
% eh, por exemplo: treino{1, 3}, acesssando terceira coluna da primeira
% linha

% pegando os valores das tabelas e gerando variaveis para serem passadas
% nos modelos a serem treinados
labels = dados{:, 12}';
valores = dados{:, 1:11}';
n = length(labels);

%MLP
%traincgb
%traincgf
% trainoss o melhor ate agora

net = fitnet([10 10 10 10 10], 'trainlm');
net.divideFcn = 'divideint';
[net, trainParameters] = train(net, valores, labels);

% Validacoes
testX = valores(:,trainParameters.testInd);
testT = labels(:,trainParameters.testInd);
testY = net(testX);
testY = round(testY);
performance = sum(testY == testT)/length(testT);
geraMatConf(testT, testY, testX);

