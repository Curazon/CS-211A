addpath('part4/');
filenames = {'images/flowergray.jpg', 'images/CARTOON.jpg', 'images/kitty.jpg', 'images/polarcities.jpg', 'images/text.jpg', };


% binary masks

mask1 = zeros(256, 256);
mask1(:,1:128) = 1;

radius = 70;
[xs,ys] = ndgrid((1:256)-128, (1:256)-128);
mask2 = (xs.^2 + ys.^2)<radius^2;


% blending

A = im2double(imread(filenames{1}));
B = im2double(imread(filenames{4}));
blended = laplacianBlending(A, B, mask1, 'flowerAndCity');

A = im2double(imread(filenames{2}));
B = im2double(imread(filenames{3}));
blended = laplacianBlending(A, B, mask1, 'cartoonAndKitty');

A = im2double(imread(filenames{4}));
B = im2double(imread(filenames{5}));
blended = laplacianBlending(A, B, mask1, 'cityAndText');

A = im2double(imread(filenames{1}));
B = im2double(imread(filenames{4}));
blended = laplacianBlending(A, B, mask2, 'flowerAndCity2');

A = im2double(imread(filenames{5}));
B = im2double(imread(filenames{1}));
blended = laplacianBlending(A, B, mask2, 'flowerAndText');
