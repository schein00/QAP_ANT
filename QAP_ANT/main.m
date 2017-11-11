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



%%
%		git --
%	git add README.md
%	git commit -m "first commit"
% 	git push -u origin master


resultsRoot = '../../results/';
resultsHeader = {
    'Network',
    'Current Cost',
    'GA Cost',
    'Harary Cost'
};

% Add trailing backslash
if resultsRoot(end) != '/'
  resultsRoot = [resultsRoot '/'];
endif;

if ! exist(resultsRoot)
  mkdir(resultsRoot);
endif;

resultFile = strcat(resultsRoot, 'results.csv');

fid = fopen(resultFile, 'w+');
fprintf(fid, "%s,%s,%s,%s\n", resultsHeader'{:});



test = {'bren', 'BREN';}


for i = 1:size(test, 1)
  res = AntNew(test(i, 2){:}, test(i, 1){:}, resultsRoot);
  %fprintf(fid, "%s,%f,%f,%f\n", res'{:});
endfor;




