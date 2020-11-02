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
kernel = (exp(-(X.^2+Y.^2)/sigma.^2) .* (-2*sigma.^2+X.^2+Y.^2)) / (2*pi*sigma.^2);
kernel = kernel / sum(sum(kernel));
% kernel = [0,0,-1,0,0;0,-1,-2,-1,0;-1,-2,16,-2,-1;0,-1,-2,-1,0;0,0,-1,0,0];


new_img = zeros(hight + padding*2, width + padding*2);
% generate new image
new_img(1+padding:hight+padding, 1+padding:width+padding) = double(img);
log_img = zeros(hight + padding*2, width + padding*2);

for i = (1+padding) : (hight+padding)
    for j = (1+padding) : (width+padding)
        log_img(i, j) = sum(sum(new_img(i-padding : i+padding, j-padding : j+padding) .* kernel));
    end
end
log_img = uint8(log_img(1+padding:hight+padding, 1+padding:width+padding));
figure();
imshow(log_img);
