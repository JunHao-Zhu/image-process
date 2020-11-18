clc;
% ����ͼ��
img = imread('lena.png');
img = rgb2gray(img);
subplot(121);
imshow(img);
[hight, width] = size(img);

% ͳ��ÿ���Ҷ�ֵ���ֵ�Ƶ��
freq = reshape(img, [1,hight*width]);
tab = tabulate(freq);
tab(:, 3) = cumsum(tab(:, 3));

% ��ԭ���ظ���Ƶ��ת��
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