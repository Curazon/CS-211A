% See https://www.mathworks.com/matlabcentral/fileexchange/5355-toolbox-graph
% for copyright. Copyright (c) 2007 Gabriel Peyre
function write_pcl_off(filename, vertex);
% save the point cloud in .off file format.
% vertex: N by 3 matrix of 3d points.

if nargin<4
    renormalize = 0;
end

if size(vertex,2)~=3
    vertex=vertex';
end
if size(vertex,2)~=3
    error('vertex does not have the correct format.');
end

if renormalize==1
    m = mean(vertex);
    s = std(vertex);
    for i=1:3
        vertex(:,i) = (vertex(:,i)-m(i))/s(i);
    end
end

fid = fopen(filename,'wt');
if( fid==-1 )
    error('Can''t open the file.');
    return;
end

% header
fprintf(fid, 'OFF\n');
fprintf(fid, '%d %d 0\n', size(vertex,1), 0);

% write the points & faces
fprintf(fid, '%f %f %f\n', vertex');

fclose(fid);
