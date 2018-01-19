function blended = laplacianBlending(A, B, mask, optionalSaveName)

LA = laplacianPyramid(A);
LB = laplacianPyramid(B);

GR = gaussianPyramid(mask);

numLevels = numel(GR);
LS = cell(1,numLevels);
for i = 1:numLevels
  % linear blending at each pyramid level.
  LS{i} = (GR{i} .* LA{i}) + ((1-GR{i}) .* LB{i});
end

blended = laplacianReconstruction(LS);

if nargin > 3
  % Prepare output directory
  if ~exist('output', 'dir')
    mkdir('output');
  end

  resizedLaplacianPyramidImages = cell(1,numLevels);
  resizedLaplacianPyramidImages{1} = LS{1};

  for i = 2:numLevels
    im = imresize(LS{i}, size(LS{1}), 'bilinear');
    resizedLaplacianPyramidImages{i} = im;
  end


  for i = 1:numLevels
    im = resizedLaplacianPyramidImages{i};
    minmax = [min(im(:)), max(im(:))];
    if i==numLevels
      imScaled = im;
    else
      imScaled = (im-minmax(1))/(minmax(2)-minmax(1));
    end

    imwrite(imresize(imScaled, [128,128]), sprintf('output/blended-%s-laplacian-%02d.png', optionalSaveName, i));
  end

  imwrite(imresize(A, [200,200]), sprintf('output/blended-%s-A.png', optionalSaveName));
  imwrite(imresize(B, [200,200]), sprintf('output/blended-%s-B.png', optionalSaveName));
  imwrite(blended, sprintf('output/blended-%s.png', optionalSaveName));
  imwrite(imresize(mask, [200,200]), sprintf('output/blended-%s-mask.png', optionalSaveName));

end
