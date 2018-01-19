function laplacianPyramidImages = laplacianPyramid(img)

pyramidImages = gaussianPyramid(img);

numLevels = log2(size(img,1))+1;
laplacianPyramidImages = cell(1,numLevels);

for i = 1:numLevels-1
  shape = size(pyramidImages{i});
  im = imresize(pyramidImages{i+1}, shape, 'bilinear');
  laplacianPyramidImages{i} = pyramidImages{i} - im;
end
laplacianPyramidImages{numLevels} = pyramidImages{numLevels};
