I = zeros(512,512);

for x = 1:512
    for y = 1:512
        I(x,y) = sin(0.2*x) + sin(0.3*x) + cos(0.4*x) + sin(0.15*sqrt(x^2 + y^2)) + sin(0.35*sqrt(x^2 + y^2));
    end
end

% I = mat2gray(I);
%I is image in space

%take fourier transform
dft = fft2(I);
disp = fftshift(dft);

%find magnitude and phase
amp = abs(disp);
phase = unwrap(angle(disp));


%double magnitude
amp2 = abs(dft)*2;

%inverse fourier transform without phase info
new = ifft2(amp2);


%normalized
figure
subplot(3, 2, 1), imshow(I, [])
subplot(3, 2, 2), imshow(disp, [])

subplot(3, 2, 3), imshow(amp, [])
subplot(3, 2, 4), imshow(phase, [])

subplot(3, 2, 5), imshow(amp2, [])
subplot(3, 2, 6), imshow(new, [])


crs = rgb2gray(im2double(imread('images\Cross.jpg')));

cdft = fftshift(fft2(crs));

figure
imshow(crs)

figure
imshow(cdft, [])



