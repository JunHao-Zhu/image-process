clc;
% 导入图像
img = imread('lena.png');
img = rgb2gray(img);
subplot(121);
imshow(img);
[hight, width] = size(img);

% 统计每个灰度值出现的频数
freq = reshape(img, [1,hight*width]);
tab = tabulate(freq);
tab(:, 3) = cumsum(tab(:, 3));

% 将原像素根据频数转换
new_img = img;
for i = 1 : hight
    for j = 1:width
        k = find(tab(:,1)==new_img(i,j));
        new_img(i,j) = fix(tab(k(1),3)/100.0 * 255);
    end
end

new_img = uint8(new_img);
subplot(122);
imshow(new_img);