%
%		Codigo baseado no codigo desenvolvido por Gabriel Rudei,
%		"para a resulução do QAP com o algorimto genetico"
%
%	Faz o carregamento dos arquivos de entrada para serem enviados ao algoritmo Ant Colony
%	



function results=NwTest(desc, fprefix, resultBase)
  resultDir   = [resultBase fprefix '/'];
  hararyDir   = '../topologias/harary/';
  topologyDir = '../topologias/nodes_links/';
  
  hararyFile = [hararyDir fprefix '.txt'];
  nodesFile  = [topologyDir fprefix '_nodes.csv'];
  linksFile  = [topologyDir fprefix '_links.csv'];
  
  % _{nodes,links} files exists
  nl_exists = exist(nodesFile) && exist(linksFile);
  % Harary file exists
  ha_exists = exist(hararyFile);
  
  if (nl_exists)
    [tp, xs, ys, locs] = NwRead(nodesFile, linksFile);
  endif;
  
  if (ha_exists)
    harary = TpRead(hararyFile);
  endif;

  if (nl_exists)
    aco([resultDir 'nw_'], tp, xs, ys);

  else
    iSol = 0;
    nwAcoSol = 0;
    disp(['No File: ' nodesFile]);
    disp(['No File: ' linksFile]);
  endif;
  
  if (ha_exists)
    aco([resultDir 'harary_'], harary, xs, ys, iSol);
  else
    hrAcoSol = Inf;
    disp(['No File: ' hararyFile]);
  endif;

endfunction;









