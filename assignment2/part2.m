close all;

out_fft2 = fft2(im2double(imread('images/moonlanding.png')));
out_fftshift = fftshift(out_fft2);

% sanity check: reconstructed original image
figure;
imshow(ifft2(ifftshift(out_fftshift)));


% log scaled DFT image
figure;
imagesc(log(abs(out_fftshift) + 1));
colorbar;


radius = 70;
[xs,ys] = ndgrid((1:size(out_fft2, 1))-size(out_fft2, 1)/2, (1:size(out_fft2, 2))-size(out_fft2, 2)/2);
mask1 = (xs.^2 + ys.^2)>radius^2;
mask = mask1;


filtered = out_fftshift;
filtered(mask & (abs(out_fftshift)>150)) = 0;

% log scaled DFT image
figure;
imagesc(log(abs(filtered) + 1));
colorbar;

figure;
imshow(ifft2(ifftshift(filtered)));



%%



img = rgb2gray(im2double(imread('images/psnr2.png')));

figure('Name', 'Original image');
imshow(img);

out_fft2 = fft2(img);
out_fftshift = fftshift(out_fft2);

figure('Name', 'DFT, Original image');
imagesc(log(abs(out_fftshift) + 1));
colorbar;


%noise_removed = wiener2(img, [5, 5]);
noise_removed = medfilt2(img, [5, 5]);

figure('Name', 'medfilt2');
imshow(noise_removed);


out_fft2 = fft2(noise_removed);
out_fftshift = fftshift(out_fft2);

figure('Name', 'DFT of medfilt2');
imagesc(log(abs(out_fftshift) + 1));
colorbar;





radius = 40;
[xs,ys] = ndgrid((1:size(out_fft2, 1))-size(out_fft2, 1)/2, (1:size(out_fft2, 2))-size(out_fft2, 2)/2);
mask1 = (xs.^2 + ys.^2)>radius^2;
mask = mask1;




filtered = out_fftshift;
filtered(mask) = filtered(mask)/4;
figure('Name', 'DFT, notch filter');
imagesc(log(abs(filtered) + 1));
colorbar;

figure('Name', 'recon, notch filter');
imshow(ifft2(ifftshift(filtered)));
