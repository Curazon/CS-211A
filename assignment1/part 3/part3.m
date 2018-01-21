clear;clc;
mkdir('./output/');
laplacian = [-1/8, -1/8, -1/8; -1/8, 1, -1/8; -1/8, -1/8, -1/8];
threshold = 0.001;
images = {'CARTOON.jpg', 'flowergray.jpg', 'kitty.jpg', 'polarcities.jpg', 'text.jpg'};
for img_index = 1:5
    name_ = images{img_index};
    name = strcat('./gallery/', name_);
    img = im2double(imread(name));
    img = imresize(img, [256, 256]);

    pyramid = gaussianPyramid(img);
    for i = 1 : 9
        pyramid{i} = imresize(pyramid{i}, [256, 256]);
    end

    result = cell(1, 9);
    for i = 1 : 9
        gaussian = pyramid{i};
        % apply the laplacian operator to this level of gaussian pyramid
        secOrder = imfilter(gaussian, laplacian);
        % segment the second order derivative image with threshold being 0
        segmented = double(secOrder > 0);
        % get zero crossing pixels
        zerocrossing = findZeroCrossingPixels(segmented);
        % get local variance
        local_var = stdfilt(gaussian).^2;
        % mark pixels as edges
        egde = zeros(size(local_var));
        for p = 1:size(local_var, 1)
            for q = 1:size(local_var, 2)
                if local_var(p, q) > threshold && zerocrossing(p, q) == 1
                    edge(p, q) = 0;
                else
                    edge(p, q) = 1;
                end
            end
        end      
        result{i} = edge;
    end
    for x = 1 : 9
        subplot(3,3,x);
        imshow(result{x});
        title(strcat('pyramid level ', int2str(x)));
        saveas(gcf, strcat('./output/', name_));
    end
    close all hidden;
end

