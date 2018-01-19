function pyramidImages = gaussianPyramid(img)

% filter specific to assignment 1.
boxFilter = [1/4 1/4; 1/4 1/4];

numLevels = log2(size(img,1))+1;
pyramidImages = cell(1,numLevels);
pyramidImages{1} = img;

for i = 1:numLevels-1
  shape = size(pyramidImages{i});
  out = pyramidImages{i};
  out = imfilter(out, boxFilter);

  out = out(1:2:shape(1), 1:2:shape(2));
  pyramidImages{i+1} = out;
end

% Sanity check. The last 1x1 image should contain the mean of the original image.
assert ((pyramidImages{numLevels} - mean(pyramidImages{1}(:))) < 1e-10);
