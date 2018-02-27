function [F, e1, e2] = getFundMat(image1_name, image2_name)
% example usage: [F, e1, e2] = getFundMat('DSCF4177', 'DSCF4179');

points_3d = [rand(1000, 3).* 200];

% load the calibraion matrices
Calib1 = load(sprintf('out/calibration/%s.mat', image1_name));
Calib2 = load(sprintf('out/calibration/%s.mat', image2_name));

% Project the points to both images to get 2d correspondences.
% This only works if the calibration matrix is accurate.
C = Calib1.C;
proj = C*[points_3d ones(size(points_3d,1),1)]';
proj = (proj(1:2,:) ./ proj(3,:))';
I = ones(size(points_3d, 1), 1);
x1 = [proj, I];

C = Calib2.C;
proj = C*[points_3d ones(size(points_3d,1),1)]';
proj = (proj(1:2,:) ./ proj(3,:))';
I = ones(size(points_3d, 1), 1);
x2 = [proj, I];


[F, e1, e2] = fundmatrix(x1', x2');

% check that the maximum error is close to zero.
assert (max(abs(dot(x2',F*x1'))) < 1e-8);
