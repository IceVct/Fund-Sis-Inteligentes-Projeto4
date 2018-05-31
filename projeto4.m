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

%MLP
net = fitnet([10 10], 'trainbr');
[net, trainParameters] = train(net, valores, labels);


