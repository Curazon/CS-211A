filenames = {'flowergray.jpg', 'CARTOON.jpg', 'kitty.jpg', 'polarcities.jpg', 'text.jpg'};
box = [1/4 1/4; 1/4 1/4];

for fileIndex = 1:numel(filenames)

    filename = filenames{fileIndex};
    img = imread(filename);
    
    levels = log2(size(img, 1))+1;
    
    check = cell(1, levels);
    
    pyramid_roll = cell(1, levels);
    pyramid_roll{1} = img;
    
    %apply box filter successively until image is single pixel
    for i = 1:levels - 1
        resize = 2^(levels - i);
        conv = imfilter(img, box, 'conv');
        
        subsample = conv(1:2:resize, 1:2:resize); 
        pyramid_roll{i+1} = subsample;  
        img = subsample;
        
    end

    %resize each filtered image in pyramid and save
    for j = 2:levels
       im = imresize(pyramid_roll{j}, size(pyramid_roll{1}), 'bilinear');
       imwrite(im, sprintf('%s-%02d.jpg', filename, j));
    end
end
