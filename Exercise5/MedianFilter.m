clc
% ����ͼƬ
img = imread('lena.png');
img = rgb2gray(img);
[hight, width] = size(img);

% ��ͼ��ֱ�����˹�����Ρ���������
GausNoi = imnoise(img, 'gaussian');
SaltPep = imnoise(img, 'salt & pepper', 0.02);
PoisNoi = imnoise(img, 'poisson');

% �趨��ֵ�˲���ģ���С
fsize = 3;
pad = (fsize - 1) / 2;

% �Լ����˹������ͼ�����ɨ��
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

% �Լ��뽷��������ͼ�����ɨ��
PeppNew = SaltPep;
for i = 1+pad : hight-pad
    for j = 1+pad : width-pad
        filter = PeppNew(i-pad:i+pad, j-pad:j+pad);
        PeppNew(i,j) = median(filter(:));
%         fil_arr = sort(reshape(filter, [1,fsize*fsize]));
%         PeppNew(i, j) = fil_arr((fsize*fsize-1)/2);
    end
end

% �Լ��벴��������ͼ�����ɨ��
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
imshow(GausNoi);title('��˹����');
subplot(2,3,2);
imshow(SaltPep);title('��������');
subplot(2,3,3);
imshow(PoisNoi);title('��������');
subplot(2,3,4);
imshow(GausNew);title('��˹�������˲���');
subplot(2,3,5);
imshow(PeppNew);title('�����������˲���');
subplot(2,3,6);
imshow(PoisNew);title('�����������˲���');