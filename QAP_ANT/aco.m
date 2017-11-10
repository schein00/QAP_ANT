%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YOEA103
% Project Title: Ant Colony Optimization for Quadratic Assignment Problem
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

clc;
clear;
close all;

%% Problem Definition

model=CreateModel();

CostFunction=@(p) MyCost(p,model);

nVar=model.n;

%% ACO Parameters

MaxIt = 500;      % numero de interações que serão usadas

nAnt = 50;        % numero de formigas (tamanho da população)

Q = 1;

tau0 =1 0;        % Feromonio inicial

alpha=0.3;      % Taxa de creximento do feromonio, quando cada formiga passar num nodo o feromonio usara esse dado para fazer o incremento

rho=0.1;        % taxa de evaporação do feromonio


%% Initialization

tau=tau0*ones(model.m,nVar);

BestCost=zeros(MaxIt,1);    % Vertor que guarda os melhores custos

% formigas vazias
empty_ant.Tour=[];
empty_ant.Cost=[];

% Matriz da ant colony
ant=repmat(empty_ant,nAnt,1);

% melhor formiga da interação
BestSol.Cost=inf;


%% ACO Main Loop

for it=1:MaxIt
    
    % Move Ants
    for k=1:nAnt
        
        ant(k).Tour=[];
        
        for l=1:nVar
            
            P=tau(:,l).^alpha;
            
            P(ant(k).Tour)=0;
            
            P=P/sum(P);
            
			% algoritmo que seleciona uma roto a ser pecorrida 
            j= RouletteWheelSelection(P);
            
            ant(k).Tour=[ant(k).Tour j];
            
        end
        
        ant(k).Cost=CostFunction(ant(k).Tour);
        
        if ant(k).Cost<BestSol.Cost
            BestSol=ant(k);
        end
        
    end
    
    % Update Phromones
    for k=1:nAnt
        
        tour=ant(k).Tour;
        
        for l=1:nVar
            
            tau(tour(l),l)=tau(tour(l),l)+Q/ant(k).Cost;
            
        end
        
    end
    
    % Evaporation
    tau=(1-rho)*tau;
    
    % Store Best Cost
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);

    % Plot Solution
    figure(1);
    PlotSolution(BestSol.Tour,model);
    pause(0.01);
    
end

%% Results

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
