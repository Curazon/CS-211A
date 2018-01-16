%% Part 0
clear;clc;

img = {'CARTOON', 'flowergray', 'kitty', 'polarcities', 'text'};
for i = 1:5
    image_name = img{i};
    img_str = strcat('./gallery/', image_name, '.jpg'); % the image to be processed
    dir = strcat('./output/', image_name, '/');
    mkdir(dir);
    threshold = 0.5; % threshold for generating the binary image in part c

    img_double = im2double(imread(img_str));
    img_double = imresize(img_double, [100, 100]);
    img_double(img_double>1) = 1.0;
    img_double(img_double<0) = 0.0;

    % part a
    img_vector = reshape(img_double, 1, 10000);
    img_vector_sorted = sort(img_vector);
    figure(1);
    plot(img_vector_sorted);
    title('part a: sorted intensities');
    saveas(gcf, strcat(dir, 'part a sorted intensities.jpg'));

    % part b
    figure(2);
    hist(img_vector, 32);
    title('part b: histogram of intensities');
    saveas(gcf, strcat(dir, 'part b histogram of intensities.jpg'));

    % part c
    img_binary = img_double;
    img_binary(img_binary > threshold) = 255.0;
    img_binary(img_binary < threshold) = 0.0;
    figure(3);
    imshow(img_binary);
    title('part c: binary image');
    imwrite(img_binary, strcat(dir, 'part c binary image.jpg'));

    % part d
    mu = mean(img_vector);
    img_subtracted = (img_double - mu);
    img_subtracted(img_subtracted < 0) = 0.0;
    figure(4);
    imshow(img_subtracted);
    title('part d: subtracted image');
    imwrite(img_subtracted, strcat(dir, 'part d subtracted image.jpg'));

    % part e
    y = [1:8];
    s = reshape(reshape(y, 8, 1), 4, 2);

    % part f
    lin = linspace(1, 99, 50);
    img_sampled = img_double(lin, lin);
    figure(5);
    imshow(img_sampled);
    title('part f: sampled image');
    imwrite(img_sampled, strcat(dir, 'part f sampled image.jpg'));

    % part g
    h_3_5 = fspecial('gaussian', 3, 0.5);
    img_gaussian_3_5 = imfilter(img_double, h_3_5);
    figure(6);
    imshow(img_gaussian_3_5);
    title('part g: imfilter 3X3 stddev=0.5');
    imwrite(img_gaussian_3_5, strcat(dir, 'part g imfilter 3X3 stddev=0.5.jpg'));

    h_7_5 = fspecial('gaussian', 7, 0.5);
    img_gaussian_7_5 = imfilter(img_double, h_7_5);
    figure(7);
    imshow(img_gaussian_7_5);
    title('part g: imfilter 7X7 stddev=0.5');
    imwrite(img_gaussian_7_5, strcat(dir, 'part g imfilter 7X7 stddev=0.5.jpg'));

    h_7_9 = fspecial('gaussian', 7, 0.9);
    img_gaussian_7_9 = imfilter(img_double, h_7_9);
    figure(8);
    imshow(img_gaussian_7_9);
    title('part g: imfilter 7X7 stddev=0.9');
    imwrite(img_gaussian_7_9, strcat(dir, 'part g imfilter 7X7 stddev=0.9.jpg'));

    % part h
    h_3_5 = fspecial('gaussian', 3, 0.5);
    img_conv2_3_5 = conv2(img_double, h_3_5);
    figure(9);
    imshow(img_conv2_3_5);
    title('part h: conv2 3X3 stddev=0.5');
    imwrite(img_conv2_3_5, strcat(dir, 'part h conv2 3X3 stddev=0.5.jpg'));

end

close all hidden;
