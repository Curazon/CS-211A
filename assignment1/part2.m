boxFilter = [1/4 1/4; 1/4 1/4];

filenames = {'images/flowergray.jpg', 'images/CARTOON.jpg', 'images/kitty.jpg', 'images/polarcities.jpg', 'images/text.jpg', };


for fileIndex = 1:numel(filenames)

  % --------------------------
  % Gaussian pyramid
  % --------------------------

  filename = filenames{fileIndex};
  img = im2double(imread(filename));

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

  % --------------------------
  % Resize Gaussian pyramid images to the same size as the original image (256x256).
  % --------------------------

  resizedPyramidImages = cell(1,numLevels);
  resizedPyramidImages{1} = pyramidImages{1};

  for i = 2:numLevels
    im = imresize(pyramidImages{i}, size(pyramidImages{1}), 'bilinear');
    resizedPyramidImages{i} = im;
  end


  % --------------------------
  % Laplacian pyramid
  % --------------------------

  laplacianPyramidImages = cell(1,numLevels);
  for i = 1:numLevels-1
    shape = size(pyramidImages{i});
    im = imresize(pyramidImages{i+1}, shape, 'bilinear');
    laplacianPyramidImages{i} = pyramidImages{i} - im;
  end
  laplacianPyramidImages{numLevels} = pyramidImages{numLevels};

  % --------------------------
  % Resize Laplacian pyramid images.
  % --------------------------

  resizedLaplacianPyramidImages = cell(1,numLevels);
  resizedLaplacianPyramidImages{1} = laplacianPyramidImages{1};

  for i = 2:numLevels
    im = imresize(laplacianPyramidImages{i}, size(laplacianPyramidImages{1}), 'bilinear');
    resizedLaplacianPyramidImages{i} = im;
  end


  % --------------------------
  % Save images.
  % --------------------------


  % Prepare output directory
  if ~exist('output', 'dir')
    mkdir('output');
  end


  for i = 1:numLevels
    im = resizedLaplacianPyramidImages{i};
    minmax = [min(im(:)), max(im(:))];
    if i==numLevels
      imScaled = im;
    else
      imScaled = (im-minmax(1))/(minmax(2)-minmax(1));
    end

    [~,name,~] = fileparts(filename);
    imwrite(imresize(imScaled, [200,200]), sprintf('output/%s-laplacian-%02d.png', name, i));
  end


  % Sanity check: Reconstructing the original image from the Laplacian pyramid.
  recon = laplacianPyramidImages{numLevels};
  for i = numLevels:-1:2
    im = imresize(recon, size(laplacianPyramidImages{i-1}), 'bilinear');
    recon = im+laplacianPyramidImages{i-1};
  end
  imwrite(recon, sprintf('output/%s-recon.png', name));

end


