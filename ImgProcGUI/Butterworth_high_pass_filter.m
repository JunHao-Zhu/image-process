function[gg1]=Butterworth_high_pass_filter(Figure,radio)
    %导入图像
    J=rgb2gray(Figure);
    J=double(J);
    %采用傅里叶变换
    f=fft2(J);
    g=fftshift(f);

    [M,N]=size(f);
    n1=floor(M/2);
    n2=floor(N/2);
    
    %巴特沃斯滤波处理
    n=2;
    d0=radio;
    for i=1:M
        for j=1:N
            d=sqrt((i-n1)^2+(j-n2)^2);
            if d==0
                h1=0;
            else
                h1=1/(1+(d0/d)^(2* n));
            end          
            gg1(i,j)=h1* g(i,j);
        end
    end
    gg1=ifftshift(gg1);
    gg1=uint8(real(ifft2(gg1)));
end