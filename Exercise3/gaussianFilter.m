clc
img = imread('lena.png'); % load original image
img = rgb2gray(img);
figure();
imshow(img);
[hight, width] = size(img);

sigma = 100; % set parameter sigma
k_shape = [5, 5]; % set kernel size
padding = (k_shape(1)-1) / 2; % padding size

% generate gaussian kernel
X = -padding : padding;
Y = -padding : padding;
[X, Y] = meshgrid(X, Y);
kernel = exp(-(X.^2+Y.^2)/sigma.^2) / (2*pi*sigma.^2);
kernel = kernel / sum(sum(kernel));
% kernel = [1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1] / 174;


new_img = zeros(hight + padding*2, width + padding*2);
new_img(1+padding:hight+padding, 1+padding:width+padding) = double(img);% generate new image

for i = (1+padding) : (hight+padding)
    for j = (1+padding) : (width+padding)
        new_img(i, j) = sum(sum(new_img(i-padding : i+padding, j-padding : j+padding) .* kernel));
    end
end
new_img = uint8(new_img(1+padding:hight+padding, 1+padding:width+padding));
figure();
imshow(new_img);
