clc
img = imread('lena.png'); % load original image
img = rgb2gray(img);
subplot(2,2,1)
imshow(img);title('原图');
[hight, width] = size(img);

k_shape = [3, 3]; % set kernel size
padding = (k_shape(1)-1) / 2; % padding size

% generate sobel kernel
h_kernel = [1,2,1;0,0,0;-1,-2,-1]; % horizon sobel kernel
v_kernel = [-1,0,1;-2,0,2;-1,0,1]; % vertical sobel kernel

h_img = zeros(hight + padding*2, width + padding*2);
% generate new image
h_img(1+padding:hight+padding, 1+padding:width+padding) = double(img);
new_h = zeros(hight + padding*2, width + padding*2);

for i = (1+padding) : (hight+padding)
    for j = (1+padding) : (width+padding)
        % execute horizon filter
        new_h(i, j) = sum(sum(h_img(i-padding : i+padding, j-padding : j+padding) .* h_kernel));
    end
end
new_h = uint8(new_h(1+padding:hight+padding, 1+padding:width+padding));
subplot(2,2,2);
imshow(new_h);title('水平sobel');

v_img = zeros(hight + padding*2, width + padding*2);
% generate new image
v_img(1+padding:hight+padding, 1+padding:width+padding) = double(img);
new_v = zeros(hight + padding*2, width + padding*2);

for i = (1+padding) : (hight+padding)
    for j = (1+padding) : (width+padding)
        % execute vertical filter
        new_v(i, j) = sum(sum(v_img(i-padding : i+padding, j-padding : j+padding) .* v_kernel));
    end
end
new_v = uint8(new_v(1+padding:hight+padding, 1+padding:width+padding));
subplot(2,2,3);
imshow(new_v);title('垂直sober');

norm_img = zeros(hight + padding*2, width + padding*2);
% generate new image
norm_img(1+padding:hight+padding, 1+padding:width+padding) = double(img);
new_norm = zeros(hight + padding*2, width + padding*2);

for i = (1+padding) : (hight+padding)
    for j = (1+padding) : (width+padding)
        % execute grad_norm filter
        h_norm = sum(sum(norm_img(i-padding : i+padding, j-padding : j+padding) .* h_kernel))^2;
        v_norm = sum(sum(norm_img(i-padding : i+padding, j-padding : j+padding) .* v_kernel))^2;
        new_norm(i, j) = sqrt(h_norm + v_norm);
    end
end
new_norm = uint8(new_norm(1+padding:hight+padding, 1+padding:width+padding));
subplot(2,2,4);
imshow(new_norm);title('sober模值');
