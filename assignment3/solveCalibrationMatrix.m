function C = solveCalibrationMatrix(points_3d, points_2d)
% points_3d: N by 3
% points_2d: N by 2
% N must be at least 6.
%
% http://www.ics.uci.edu/~majumder/VC/new-lectures/cameracalib.pdf
% https://www.cc.gatech.edu/~afb/classes/CS4495-Fall2013/slides/CS4495-07-Calibration.pdf

% Check input matrix size.
assert(size(points_3d, 2) == 3);
assert(size(points_2d, 2) == 2);
assert(size(points_2d, 1) == size(points_3d, 1));
assert(size(points_2d, 1) >= 6);


A = [];

for i = 1:size(points_2d,1)

  X = points_3d(i, 1);
  Y = points_3d(i, 2);
  Z = points_3d(i, 3);
  x = points_2d(i, 1);
  y = points_2d(i, 2);

  rows = [X Y Z 1 0 0 0 0 -x*X -x*Y -x*Z -x;
          0 0 0 0 X Y Z 1 -y*X -y*Y -y*Z -y];

  A = [A;rows];

end


[U D V] = svd(A);
C = V(:, size(V,2));  %eigen vector of A'A with smallest eigenvalue.
C = reshape(C, 4, 3)';



% Error checking.
proj = C*[points_3d ones(size(points_3d,1),1)]';
proj = (proj(1:2,:) ./ proj(3,:))';

% Reprojection error. Euclidean distance in pixels.
err = max(sqrt(sum((proj - points_2d).^2, 2)));

assert (err < 16, sprintf('Reprojection error is too big: %.2f pixels', err));

% print reprojection error.
disp(err);
