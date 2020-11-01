clc
% 输入图片
img = imread('image1.jpeg');
img = rgb2gray(img);
noi_img = imnoise(img, 'salt & pepper', 0.02); % add salt&pepper noise

%%
img = imread('image1.jpeg');
img = rgb2gray(img);
noi_img = imnoise(img, 'salt & pepper', 0.2); % add salt&pepper noise

filter_img = filter2(fspecial('gaussian', [3,3], 0.5), noi_img); 

figure();
imshow(img);
% title('原图');
figure();
imshow(noi_img);
% title('添加椒盐噪声图像');
figure();
imshow(filter_img);
% title('高斯滤波过滤器');

%%
fil_img_h = filter2(fspecial('prewitt'), noi_img); % horizon prewitt filter
fil_img_v = filter2(fspecial('prewitt')', noi_img); % vertical prewitt filter

% figure();
imshow(noi_img);%title('原图');
figure();
imshow(fil_img_h);%title('prewitt水平梯度');
figure();
imshow(fil_img_v);%title('prewitt垂直梯度');

%%
fil_img = filter2(fspecial('log'), noi_img); % 添加log过滤器模板 (5*5)

figure();
imshow(img);
figure();
imshow(noi_img);
figure();
imshow(fil_img);