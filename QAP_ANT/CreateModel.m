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

function model=CreateModel(topology, x, y)

     % Matriz de adjacências / Conexões
     w = topology;
 
     % Número de linhas na topologia
     n=size(w,1);
     
     % Número de nós
     m=numel(x);
     
     % Matriz de Distâncias
     d=zeros(m,m);
     
     % Distância de Haversine entre todos os Nós
     for p=1:m
         for q=p+1:m
             d(p, q) = d(q, p) = haversine(x(p), y(p), x(q), y(q));
         end
     end
     
     % Distância máxima permitida ao Modelo
     dmax = max(max(d)) / 2; % TODO: Calcular o diametro
     
     model.n=n; % Número de linhas da Topologia
     model.m=m; % Número de Nós
     model.w=w; % Topologia
     model.x=x; % Posições X dos Nós
     model.y=y; % Posições Y dos Nós
     model.d=d; % Matriz de Distâncias baseadas em x,y
     model.maxd = dmax;
    
end
