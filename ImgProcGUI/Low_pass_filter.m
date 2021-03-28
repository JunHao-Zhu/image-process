function[g]=Low_pass_filter(Figure,radius)
    %����ͼ��
    J=rgb2gray(Figure);
    J=double(J);
    %����Ҷ�任
    f=fft2(J);
    %���ݾ���ƽ��
    g = fftshift(f);
    [M,N]=size(f);
    n1=floor(M/2);
    n2=floor(N/2);
    d0=radius;
    % ��ͨ�˲�����
    for i=1:M
        for j=1:N
            d=sqrt((i-n1)^2+(j-n2)^2);
            if d<=d0
                h=1;
            else
                h=0;
            end
            g(i,j)=h*g(i,j);
        end
    end
    g=ifftshift(g);
    g=uint8(real(ifft2(g)));
end