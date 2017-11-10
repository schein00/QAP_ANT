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



%%
%		git --
%	git add README.md
%	git commit -m "first commit"
% 	git push -u origin master


test = {'bren', 'BREN';}


for i = 1:size(test, 1)
  res = NwTest(test(i, 2){:}, test(i, 1){:}, resultsRoot);
  fprintf(fid, "%s,%f,%f,%f\n", res'{:});
endfor;







aco;
