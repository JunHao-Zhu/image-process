clc
% ����ͼƬ
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
% title('ԭͼ');
figure();
imshow(noi_img);
% title('��ӽ�������ͼ��');
figure();
imshow(filter_img);
% title('��˹�˲�������');

%%
fil_img_h = filter2(fspecial('prewitt'), noi_img); % horizon prewitt filter
fil_img_v = filter2(fspecial('prewitt')', noi_img); % vertical prewitt filter

% figure();
imshow(noi_img);%title('ԭͼ');
figure();
imshow(fil_img_h);%title('prewittˮƽ�ݶ�');
figure();
imshow(fil_img_v);%title('prewitt��ֱ�ݶ�');

%%
fil_img = filter2(fspecial('log'), noi_img); % ���log������ģ�� (5*5)

figure();
imshow(img);
figure();
imshow(noi_img);
figure();
imshow(fil_img);