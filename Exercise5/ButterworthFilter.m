clc
% load image
img = imread('lena.png');
img = rgb2gray(img);
subplot(121);
imshow(uint8(img));title('Ô­Í¼');

% fourier trans
img = double(img);
ff = fft2(img);
g = fftshift(ff);

[hight, width] = size(ff);
h_cent = floor(hight/2);
w_cent = floor(width/2);

% set parameters of butterworth filter
d0 = 20;
n = 2;
c = 0.2;
for i = 1:hight
    for j = 1:width
        d = sqrt((i-h_cent)^2 + (i-w_cent)^2);
        if(d == 0)
            h = 0;
        else
            h = 1 / (1+ (d0/d)^(2*n)) + c;
        end
        g(i, j) = h * g(i, j);
    end
end
g = ifftshift(g);
g = uint8(real(ifft2(g)));
subplot(122);
imshow(g);title('¸ßÍ¨ÂË²¨');