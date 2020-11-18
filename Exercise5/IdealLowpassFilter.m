clc
% load image
img = imread('lena.png');
subplot(131);
imshow(img);
img = double(img);

ff = fft2(img);
g = fftshift(ff);
subplot(132);
imshow(log(abs(g)),[]), color(jet(64));
[hight, width] = size(ff);
n1 = floor(hight/2);
n2 = floor(width/2);

d0 = 5;
for i = 1:hight
    for j = 1:width
        d = sqrt((i-n1)^2 + (j-n2)^2);
        if(d <= d0)
            h = 1;
        else
            h = 0;
        end
        g(i,j) = h * g(i,j);
    end
end
g = ifftshift(g);
g = uint8(real(ifft2(g)));
subplot(133);
imshow(g);