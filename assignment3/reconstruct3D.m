function [xyz] = reconstruct3D(all_points_2d, cameras)
% all_points_2d: A matrix of size N by 2*v. v is the number of views. N is the number of points.
% cameras: A matrix of size 3 by 4*v.
% Example usage (for 2-view reconstruction): xyz = reconstruct3D([xy1 xy2], [P1 P2]);

% http://www.uio.no/studier/emner/matnat/its/UNIK4690/v16/forelesninger/lecture_7_2-triangulation.pdf

N_views = size(all_points_2d, 2)/2;
assert (N_views == size(cameras, 2)/4)



Xsolved = [];

for i = 1:size(all_points_2d,1)

  A = [];

  for j = 1:N_views

    u = all_points_2d(i,1+(j-1)*2);
    v = all_points_2d(i,2+(j-1)*2);

    P = cameras(:, 1+(j-1)*4:4+(j-1)*4);

    A_ = [
    v*P(3,1)-P(2,1) v*P(3,2)-P(2,2) v*P(3,3)-P(2,3) v*P(3,4)-P(2,4);
    u*P(3,1)-P(1,1) u*P(3,2)-P(1,2) u*P(3,3)-P(1,3) u*P(3,4)-P(1,4);
    ];
    A = [A;A_];
  end


  [U D V] = svd(A);
  X = V(:, size(V,2))';  %eigen vector of A'A with smallest eigenvalue.
  Xsolved = [Xsolved;X];

end

xyz = (Xsolved(:,1:3) ./ Xsolved(:,4));
