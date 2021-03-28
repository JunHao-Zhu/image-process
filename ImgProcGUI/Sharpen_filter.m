function[Processed_Figure_Value]=Sharpen_filter(Figure, type)
%% 本函数用于实现对图像的锐化操作。
% Inpute:
%   path: 图片存储路径
%   type: 所用滤波器类型，本函数提供Robert, Sobel, Prewitt, Laplacian4，Laplacian8三种滤波器
%#################################################################################
    % 图片载入
    Figure=rgb2gray(Figure);
    Figure_Shape=size(Figure);
    
    
    % 根据type种类来确定操作
    if strcmp(type,'Laplacian4') || strcmp(type,'Laplacian8')
        %选用4领域Laplacian算子
        if strcmp(type,'Laplacian4')
            Kernel=[0,1,0;1,-4,1;0,1,0];
        end
        
        % 选用8领域Laplacian算子
        if strcmp(type,'Laplacian8')
            Kernel=[1,1,1;1,-8,1;1,1,1];
        end
        
        % 输出初始图像
        figure(1);
        subplot(1,2,1);imshow(Figure);title('Orginal Figure');
        Kernel_Shape=size(Kernel);
        Figure=double(Figure);
        
        % 初始存储矩阵
        Fix_Figure=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1,3);
        
        % 滤波操作
        for channel=1:3
            for x=1:Figure_Shape(1)-Kernel_Shape(1)+1
                for y=1:Figure_Shape(2)-Kernel_Shape(2)+1
                    Fix_Figure(x,y,channel)=sum(sum(Figure(x:x+Kernel_Shape-1,y:y+Kernel_Shape-1,channel).*Kernel));
                end
            end
        end
        
        % 输出结果
        Fix_Figure=uint8(Fix_Figure);
%         subplot(1,2,2);imshow(Fix_Figure);title('Gradient Figure');
        
    elseif strcmp(type,'Robert') || strcmp(type,'Sobel') || strcmp(type,'Prewitt')
        % 选用Robert算子
        if strcmp(type,'Robert')
            Kernel_X=[1,0;0,-1];
            Kernel_Y=[0,1;-1,0];
        end
        
        % 选用Prewitt算子
        if strcmp(type,'Prewitt')
            Kernel_X=[1,1,1;0,0,0;-1,-1,-1];
            Kernel_Y=[-1,0,1;-1,0,1;-1,0,1];
        end
        
        % 选用Robert算子
        if strcmp(type,'Sobel')
            Kernel_X=[1,2,1;0,0,0;-1,-2,-1];
            Kernel_Y=[1,0,-1;2,0,-2;-1,0,-1];
        end
        
        % 原始图像的显示
%         figure(1);
%         subplot(2,2,1);imshow(Figure);title('Original Figure');
        Kernel_Shape=size(Kernel_X);
        Figure=double(Figure);
        
        % 存储矩阵初始化
        Processed_Figure_X=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1);
        Processed_Figure_Y=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1);
        Processed_Figure_Value=zeros(Figure_Shape(1)-Kernel_Shape(1)+1,...
            Figure_Shape(2)-Kernel_Shape(2)+1);
        
        % 滤波操作
%         for channel=1:3
            for x=1:Figure_Shape(1)-Kernel_Shape(1)+1
                for y=1:Figure_Shape(2)-Kernel_Shape(2)+1
                    Processed_Figure_X(x,y)=sum(sum(Figure(x:x+Kernel_Shape-1,y:y+Kernel_Shape-1).*Kernel_X));
                    Processed_Figure_Y(x,y)=sum(sum(Figure(x:x+Kernel_Shape-1,y:y+Kernel_Shape-1).*Kernel_Y));
                    Processed_Figure_Value(x,y)=Processed_Figure_X(x,y)+Processed_Figure_Y(x,y);
                end
            end
%         end 
        
        % 处理后图片显示
        Processed_Figure_X=uint8(Processed_Figure_X);
%         subplot(2,2,2);imshow(Processed_Figure_X);title('Gradient-X Figure');
        Processed_Figure_Y=uint8(Processed_Figure_Y);
%         subplot(2,2,3);imshow(Processed_Figure_Y);title('Gradient-Y Figure');
        Processed_Figure_Value=uint8(Processed_Figure_Value);
%         subplot(2,2,4);imshow(Processed_Figure_Value);title('Gradient-Value Figure');
    else
         % 错误输入提示
         disp(['Please Input the right type,this function only support the Robert\Sobel\Laplacian8\Laplacian4']);
     end
end