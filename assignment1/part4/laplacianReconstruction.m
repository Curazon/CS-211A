function recon = laplacianReconstruction(laplacianPyramidImages)

numLevels = numel(laplacianPyramidImages);
recon = laplacianPyramidImages{numLevels};

for i = numLevels:-1:2
  im = imresize(recon, size(laplacianPyramidImages{i-1}), 'bilinear');
  recon = im+laplacianPyramidImages{i-1};
end
