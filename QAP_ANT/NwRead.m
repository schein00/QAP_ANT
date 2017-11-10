% Parser to *_{nodes, links}.csv files

function [topology, xs, ys, locs]=NwRead(nodesf, linksf)
  [nodes, lat, lng] = textread(
      nodesf,          % Read this file
      "%s,%f,%f,%*",   % With this format
      "headerlines", 1 % And line 1 will be the header
  );
  
  [from, to, len, cap] = textread(
      linksf,           % Read this file
      "%s,%s,%d,%d,%*", % With this format
      "headerlines", 1  % And line 1 will be the header
  );
  
  % Cleanup empty strings
  nclean = find(strcmp('', nodes) == 0);
  fclean = find(strcmp('', from) == 0);
  tclean = find(strcmp('', to) == 0);
  
  from  = from(fclean); 
  to    = to(fclean);
  nodes = nodes(nclean);

  % Line to column matrixes, only with valid numbers
  xs = lng'(find(! isnan(lng')));
  ys = lat'(find(! isnan(lat')));
  
  % Proper order to create the original topology
  [nodes, indices] = sort(nodes);
  xs = xs(indices);
  ys = ys(indices);

  links = [from, to];
  locs  = unique(links); % Location mapping
    
  % Generate basic zero-topology
  topology = zeros(size(locs), size(locs));
  
  for i = 1:size(links, 1)
    % Lookup on the location table for origin nodes
    origin = lookup(locs, links{i, 1});
    % ... destination
    dest   = lookup(locs, links{i, 2});
    
    % Mark a new connection
    topology(origin, dest) = topology(dest, origin) = 1;
  endfor
endfunction