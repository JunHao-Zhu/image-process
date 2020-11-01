function mod_img = resize(img, scale)
    % 图像的放大或者缩小(长宽等比例)
    % img: 输入的图像 scale_size: 比例系数
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
% [h,w] = size(img); %获取行和列，即原图的高度和宽度
% 
% scale_size = uint8([h, w] * scale);
% scale_w = scale_size(2); %根据输入获得缩放后的新宽度
% scale_h = scale_size(1); %根据输入获得缩放后的新高度
% % mod_img = zeros(scale_h, scale_w); %初始化
% mod_img = uint8(ones(scale_h, scale_w)*128);
%  
% for i = 1 : scale_h         %缩放后的图像的（i,j）位置对应原图的（x,y）
%     for j = 1 : scale_w
%         x = i * h / scale_h;
%         y = j * w / scale_w;
%         u = x - floor(x);
%         v = y - floor(y); %取小数部分
%         
%         if x < 1           %边界处理
%             x = 1;
%         end
%         
%         if y < 1
%             y = 1;
%         end
%         
%  
%         %用原图的四个真实像素点来双线性插值获得“虚”像素的像素值
%         mod_img(i, j) = img(floor(x), floor(y)) * (1-u) * (1-v) + ...
%                                img(floor(x), ceil(y)) * (1-u) * v + ...
%                                img(ceil(x), floor(y)) * u * (1-v) + ...
%                                img(ceil(x), ceil(y)) * u * v;
%     end
% end