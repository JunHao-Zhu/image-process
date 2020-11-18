clc
% 导入图片
img = imread('lena.png');
img = rgb2gray(img);
[hight, width] = size(img);

% 对图像分别加入高斯、椒盐、泊松噪声
GausNoi = imnoise(img, 'gaussian');
SaltPep = imnoise(img, 'salt & pepper', 0.02);
PoisNoi = imnoise(img, 'poisson');

% 设定中值滤波的模板大小
fsize = 3;
pad = (fsize - 1) / 2;

% 对加入高斯噪声的图像进行扫描
GausNew = GausNoi;
for i = 1+pad : hight-pad
    for j = 1+pad : width-pad
        filter = GausNew(i-pad:i+pad, j-pad:j+pad);
%         fil_arr = sort(reshape(filter, [1,fsize*fsize]));
        GausNew(i,j) = median(filter(:));
%         GausNew(i, j) = fil_arr((fsize*fsize-1)/2);
    end
end
GausNew = uint8(GausNew);

% 对加入椒盐噪声的图像进行扫描
PeppNew = SaltPep;
for i = 1+pad : hight-pad
    for j = 1+pad : width-pad
        filter = PeppNew(i-pad:i+pad, j-pad:j+pad);
        PeppNew(i,j) = median(filter(:));
%         fil_arr = sort(reshape(filter, [1,fsize*fsize]));
%         PeppNew(i, j) = fil_arr((fsize*fsize-1)/2);
    end
end

% 对加入泊松噪声的图像进行扫描
PoisNew = PoisNoi;
for i = 1+pad : hight-pad
    for j = 1+pad : width-pad
        filter = PoisNew(i-pad:i+pad, j-pad:j+pad);
        PoisNew(i,j) = median(filter(:));
%         fil_arr = sort(reshape(filter, [1,fsize*fsize]));
%         PoisNew(i, j) = fil_arr((fsize*fsize-1)/2);
    end
end

% plot image
subplot(2,3,1);
imshow(GausNoi);title('高斯噪声');
subplot(2,3,2);
imshow(SaltPep);title('椒盐噪声');
subplot(2,3,3);
imshow(PoisNoi);title('泊松噪声');
subplot(2,3,4);
imshow(GausNew);title('高斯噪声（滤波后）');
subplot(2,3,5);
imshow(PeppNew);title('椒盐噪声（滤波后）');
subplot(2,3,6);
imshow(PoisNew);title('泊松噪声（滤波后）');