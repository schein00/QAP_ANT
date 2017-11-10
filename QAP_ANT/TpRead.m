% Parser to adjacency indications

function topology=TpRead(linksf, indexes=1)
  % from and to must have the same sizes
  [from, to] = textread(linksf, '%f %f');
  
  % Node counting, user can select between conting the indexes
  % or number of elements
  if (indexes) % Count the max element number of from/to
    nodesc = max(max(from), max(to));
  else % Count number of nodes by unique lines
    nodesc = numel(unique(from));
  endif
  
  % Generate basic zero-topology
  topology = zeros(nodesc);
  
  for i = 1:numel(from)    
    % Mark a new connection
    topology(from(i), to(i)) = 1;
    topology(to(i), from(i)) = 1;
  endfor
endfunction
