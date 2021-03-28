function[Figure]=Gray_change(Figure,type)
%% 本函数用于实现对图片的灰度值进行处理
% Inpute:
%   path: 图片存储路径
%   type: 所用灰度值变化类型，本函数提供了一下几个类型：
%       ‘Linear’:灰度值线性变化
%       ‘Log’:灰度值非线性对数变化
%       ‘Index’:灰度值非线性指数变化
%       ‘Histogram_Equalization’:直方图均衡化
%#################################################################################
    % 图片的载入
%     Figure=imread(path);
%     Figure=rgb2gray(Figure);
%     figure(1);
%     subplot(1,2,1);imshow(Figure);title('Original Figure');
    
    [M,N]=size(Figure);
    Figure=double(Figure);
    
    % 进行线性灰度变换
    if strcmp(type,'Linear')
        for i=1:M
            for j=1:N
                % 线性函数可以自己定义
                if Figure(i,j)<=20
                    Figure(i,j)=Figure(i,j);
                elseif Figure(i,j)<=150
                    Figure(i,j)=(200-20)/(150-20)*(Figure(i,j)-20)+20;
                else
                    Figure(i,j)=(250-200)/(300-150)*(Figure(i,j)-150)+200;
                end
            end
        end
        
        % 输出结果
        Figure=uint8(Figure);
%         subplot(1,2,2);imshow(Figure);title('Linear Gray Change');
 
    % ###################################################
    % 非线性对数灰度变换
    elseif strcmp(type,'Log')
        % 对图像的值进行灰度变化
        Figure=41*log(Figure+1);
        
        % 输出结果
        Figure=uint8(Figure);
%         subplot(1,2,2);imshow(Figure);title('Log Gray Change');
        
    % ###################################################
    % 非线性指数灰度变换
    elseif strcmp(type,'Index')
        % 对图像的值进行灰度变化
%         Figure=Figure.*Figure/255;
        Figure=(Figure.^0.9);
        
        % 输出结果
        Figure=uint8(Figure);
%         subplot(1,2,2);imshow(Figure);title('Index Gray Change');  
     
    % ################################################### 
    % 直方图均衡化
    elseif strcmp(type,'Histogram_Equalization')
        freq = reshape(Figure, [1,M*N]);
        tab = tabulate(freq);
        tab(:, 3) = cumsum(tab(:, 3));

        % 将原像素根据频数转换
        for i = 1 : M
            for j = 1:N
                k = find(tab(:,1)==Figure(i,j));
                Figure(i,j) = fix(tab(k(1),3)/100.0 * 255);
            end
        end
        Figure = uint8(Figure);
    % ################################################### 
    % 异常输入
    else
        disp('Please Input the right type,this function only support the Linear\NonLinear\Histogram_Equalization');
    end
end