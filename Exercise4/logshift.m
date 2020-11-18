clc
% load image
img = imread('lena.png');
subplot(121);
imshow(img);

C = 41; % set a scale parameter

% process log shifting
img = double(img);
mod_img = C * log(1 + img);
mod_img = uint8(mod_img);

% show modified image
subplot(122);
imshow(mod_img);