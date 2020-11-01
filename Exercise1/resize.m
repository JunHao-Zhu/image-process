function mod_img = resize(img, scale)
    % ͼ��ķŴ������С(����ȱ���)
    % img: �����ͼ�� scale_size: ����ϵ��
    [x,y] = size(img);
    reshape = floor([x, y] * scale);
    mod_img = uint8(ones(reshape)*128);
%     mod_img = zeros(reshape);
    for i = 1:reshape(1)
        for j = 1:reshape(2)
            mod_img(i,j) = img(floor(i/scale+0.5), floor(j/scale+0.5));
        end
    end
end
% [h,w] = size(img); %��ȡ�к��У���ԭͼ�ĸ߶ȺͿ��
% 
% scale_size = uint8([h, w] * scale);
% scale_w = scale_size(2); %�������������ź���¿��
% scale_h = scale_size(1); %�������������ź���¸߶�
% % mod_img = zeros(scale_h, scale_w); %��ʼ��
% mod_img = uint8(ones(scale_h, scale_w)*128);
%  
% for i = 1 : scale_h         %���ź��ͼ��ģ�i,j��λ�ö�Ӧԭͼ�ģ�x,y��
%     for j = 1 : scale_w
%         x = i * h / scale_h;
%         y = j * w / scale_w;
%         u = x - floor(x);
%         v = y - floor(y); %ȡС������
%         
%         if x < 1           %�߽紦��
%             x = 1;
%         end
%         
%         if y < 1
%             y = 1;
%         end
%         
%  
%         %��ԭͼ���ĸ���ʵ���ص���˫���Բ�ֵ��á��顱���ص�����ֵ
%         mod_img(i, j) = img(floor(x), floor(y)) * (1-u) * (1-v) + ...
%                                img(floor(x), ceil(y)) * (1-u) * v + ...
%                                img(ceil(x), floor(y)) * u * (1-v) + ...
%                                img(ceil(x), ceil(y)) * u * v;
%     end
% end