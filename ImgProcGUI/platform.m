function varargout = platform(varargin)
% PLATFORM MATLAB code for platform.fig
%      PLATFORM, by itself, creates a new PLATFORM or raises the existing
%      singleton*.
%
%      H = PLATFORM returns the handle to a new PLATFORM or the handle to
%      the existing singleton*.
%
%      PLATFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLATFORM.M with the given input arguments.
%
%      PLATFORM('Property','Value',...) creates a new PLATFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before platform_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to platform_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help platform

% Last Modified by GUIDE v2.5 17-Nov-2020 21:25:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @platform_OpeningFcn, ...
                   'gui_OutputFcn',  @platform_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before platform is made visible.
function platform_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to platform (see VARARGIN)

% Choose default command line output for platform
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes platform wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = platform_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in select_fig.
function select_fig_Callback(hObject, eventdata, handles)
% hObject    handle to select_fig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 选择图片按钮
global filename   
global pathname
[filename,pathname] = uigetfile({'*.png';'*.jpg';'*.bmp';'*.*'} ,'Select An Image File');
axes(handles.Fig1);
I=imread(fullfile(pathname,filename));
% I=rgb2gray(I);
imshow(I);

% --- Executes on button press in clear_fig.
function clear_fig_Callback(hObject, eventdata, handles)
% hObject    handle to clear_fig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 清空按键
I=uint8(ones(1,1)*255);
axes(handles.Fig2);
imshow(I);


% --- Executes on button press in binary_figure.
function gray_figure_Callback(hObject, eventdata, handles)
% hObject    handle to binary_figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%显示灰度图像
global filename
global pathname
I=imread(fullfile(pathname,filename));
I=rgb2gray(I);
axes(handles.Fig2);
imshow(I);title('灰度图像');

% --- Executes on button press in binary_figure.
function binary_figure_Callback(hObject, eventdata, handles)
% hObject    handle to binary_figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%显示二值图像
global filename
global pathname
I=imread(fullfile(pathname,filename));
I=im2bw(I,0.5);
axes(handles.Fig2);
imshow(I);title('二值图像');


% --- Executes on button press in ind_figure.
function ind_figure_Callback(hObject, eventdata, handles)
% hObject    handle to ind_figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%显示索引图像
global filename
global pathname
I=imread(fullfile(pathname,filename));
[I,cmap]=rgb2ind(I,64);
axes(handles.Fig2);
imshow(I,cmap);title('索引图像');



function move_x_Callback(hObject, eventdata, handles)
% hObject    handle to move_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of move_x as text
%        str2double(get(hObject,'String')) returns contents of move_x as a double


% --- Executes during object creation, after setting all properties.
function move_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to move_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function move_y_Callback(hObject, eventdata, handles)
% hObject    handle to move_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of move_y as text
%        str2double(get(hObject,'String')) returns contents of move_y as a double


% --- Executes during object creation, after setting all properties.
function move_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to move_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in figure_move.
function figure_move_Callback(hObject, eventdata, handles)
% hObject    handle to figure_move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 平移图像
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);
X=get(handles.move_x,'string');
Y=get(handles.move_y,'string');

[M,N]=size(I);
I_pingyi = zeros(M,N);
x_move = str2num(X);
y_move = str2num(Y);
move = [1,0,x_move;0,1,y_move;0,0,1];
for i = 1:M
    for j = 1:N
        temp = [i;j;1];
        temp = move*temp;
        temp_x = temp(1,1);
        temp_y = temp(2,1);
        if temp_x <= M && temp_y <= N
            I_pingyi(temp_x,temp_y) = I(i,j);
        end
    end
end
I_pingyi=uint8(I_pingyi);
axes(handles.Fig2);
imshow(I_pingyi);title('图像平移')


% --- Executes on button press in vertical_mirror.
function vertical_mirror_Callback(hObject, eventdata, handles)
% hObject    handle to vertical_mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);

[M,N]=size(I);
I_chuizhi = zeros(M,N);
chuizhi = [-1,0,0;0,1,0;0,0,1];
for i = 1:M
    for j = 1:N
        item = [i;j;1];
        item_chuizhi = chuizhi*item;
        item_x_chuizhi = M + item_chuizhi(1,1) + 1;
        item_y_chuizhi = item_chuizhi(2,1);
        I_chuizhi(item_x_chuizhi,item_y_chuizhi) = I(i,j);
    end
end
I_chuizhi=uint8(I_chuizhi);
axes(handles.Fig2);
imshow(I_chuizhi);title('图像垂直镜像');


% --- Executes on button press in horizontal_mirror.
function horizontal_mirror_Callback(hObject, eventdata, handles)
% hObject    handle to horizontal_mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);
[M,N]=size(I);
I_shuiping = zeros(M,N);
shuiping  = [1,0,0;0,-1,0;0,0,1];
for i = 1:M
    for j = 1:N
        item = [i;j;1];
        item_shuiping = shuiping*item;
        item_x_shuiping = item_shuiping(1,1);
        item_y_shuiping = N + item_shuiping(2,1) + 1;
        I_shuiping(item_x_shuiping,item_y_shuiping) = I(i,j);
    end
end
I_shuiping=uint8(I_shuiping);
axes(handles.Fig2);
imshow(I_shuiping);title('图像水平镜像');

function shrink_enlarge_rate_Callback(hObject, eventdata, handles)
% hObject    handle to shrink_enlarge_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shrink_enlarge_rate as text
%        str2double(get(hObject,'String')) returns contents of shrink_enlarge_rate as a double


% --- Executes during object creation, after setting all properties.
function shrink_enlarge_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shrink_enlarge_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rotate_angle_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rotate_angle as text
%        str2double(get(hObject,'String')) returns contents of rotate_angle as a double


% --- Executes during object creation, after setting all properties.
function rotate_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rotate_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in shrink_enlarge.
function shrink_enlarge_Callback(hObject, eventdata, handles)
% hObject    handle to shrink_enlarge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 图像缩放
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);
[M,N]=size(I);
% 得到输入倍数
Rate=get(handles.shrink_enlarge_rate,'string');
Rate=str2num(Rate);
I_result=zeros(M,N);

% 如果输入错误
if Rate<=0
    axes(handles.Fig2);
    imshow(I);title('请输入正确缩放倍数');
% 无放大缩小
elseif Rate==1
    axes(handles.Fig2);
    imshow(I);title('放大倍数为1，为原图像');
% 图片放大， 图片只显示左上角部分
elseif Rate>1
    I_fangda = zeros(floor(M*Rate),floor(N*Rate));
    [A,B] = size(I_fangda);
    for i = 1:A
        for j = 1:B
                x = floor(i/Rate);
                y = floor(j/Rate);
                if x == 0
                    x = x+1;
                end
                if y == 0
                    y = y+1;
                end
                if x == M
                    x = x-1;
                end
                if y == N
                    y = y-1;
                end 
                u = i/Rate - x;
                v = j/Rate - y;
                I_fangda(i,j) = u*v*I(x,y)+(1-u)*v*I(x+1,y)+u*(1-v)*I(x,y+1)+(1-u)*(1-v)*I(x+1,y+1);
        end
    end
    I_fangda=double(I_fangda);
    I_result=I_result+I_fangda(1:M,1:N);
    I_result=uint8(I_result);
    axes(handles.Fig2);
    imshow(I_result);title('图像放大');
% 图片缩小，无显示则以黑色填充
else
    I_suoxiao = zeros(floor(M*Rate),floor(N*Rate));
    [A,B]=size(I_suoxiao);
    suoxiao  = [Rate,0,0;0,Rate,0;0,0,1];
    for i = 1:M
        for j = 1:N
            temp = [i;j;1];
            temp_suoxiao = suoxiao*temp;
            temp_x_suoxiao = uint8(temp_suoxiao(1,1));
            temp_y_suoxiao = uint8(temp_suoxiao(2,1));
            if temp_x_suoxiao<=0
                temp_x_suoxiao=1;
            elseif temp_x_suoxiao>A
                temp_x_suoxiao=A;
            end
            if temp_y_suoxiao<=0
                temp_y_suoxiao=1;
            elseif temp_y_suoxiao>B
                temp_y_suoxiao=B;
            end
            I_suoxiao(temp_x_suoxiao,temp_y_suoxiao) = I(i,j);
        end
    end
    I_suoxiao=double(I_suoxiao);
    I_result(1:A,1:B)=I_result(1:A,1:B)+I_suoxiao;
    I_result=uint8(I_result);
    axes(handles.Fig2);
    imshow(I_result);title('图像缩小');
end


% --- Executes on button press in rotate.
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 图像的旋转
global filename
global pathname
I = imread(fullfile(pathname,filename));
angle=get(handles.rotate_angle,'string');
angle=str2num(angle);
[M,N]=size(I);
I_xuanzhuan=zeros(M,N);
I_xuanzhuan = imrotate(I,angle,'bilinear');
I_xuanzhuan = uint8(I_xuanzhuan);
axes(handles.Fig2);
imshow(I_xuanzhuan);title('图像旋转');


% --- Executes on button press in log_enhance.
function log_enhance_Callback(hObject, eventdata, handles)
% hObject    handle to log_enhance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 对数增强
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);
I = Gray_change(I,'Log');
axes(handles.Fig2);
imshow(I);title('图像对数增强');

% --- Executes on button press in exp_enhance.
function exp_enhance_Callback(hObject, eventdata, handles)
% hObject    handle to exp_enhance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 对数增强
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);
I = Gray_change(I,'Index');
axes(handles.Fig2);
imshow(I);title('图像指数增强');

% --- Executes on button press in linear_enhance.
function linear_enhance_Callback(hObject, eventdata, handles)
% hObject    handle to linear_enhance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 线性增强
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);
I = Gray_change(I,'Linear');
axes(handles.Fig2);
imshow(I);title('图像线性增强');

% --- Executes on button press in averager_hist.
function averager_hist_Callback(hObject, eventdata, handles)
% hObject    handle to averager_hist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 直方图均衡化
global filename
global pathname
I = imread(fullfile(pathname,filename));
I = rgb2gray(I);
I = Gray_change(I,'Histogram_Equalization');
axes(handles.Fig2);
imshow(I);title('图像直方图均衡化');


% --- Executes on button press in add_noise.
function add_noise_Callback(hObject, eventdata, handles)
% hObject    handle to add_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 添加三种类型的噪声
global filename
global pathname
I = imread(fullfile(pathname,filename));
noise_type=get(handles.noise_type,'Value');
if noise_type==1
    I=imnoise(I,'gaussian');
    axes(handles.Fig2);
    imshow(I);title('添加高斯噪声');
elseif noise_type==2
    I=imnoise(I,'salt & pepper',0.02);
    axes(handles.Fig2);
    imshow(I);title('添加椒盐噪声');
else
    I=imnoise(I,'poisson');
    axes(handles.Fig2);
    imshow(I);title('添加泊松噪声');
end


% --- Executes on selection change in noise_type.
function noise_type_Callback(hObject, eventdata, handles)
% hObject    handle to noise_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noise_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noise_type


% --- Executes during object creation, after setting all properties.
function noise_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noise_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in medium_filter.
function medium_filter_Callback(hObject, eventdata, handles)
% hObject    handle to medium_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 中值滤波
global filename
global pathname
I = imread(fullfile(pathname,filename));
[hight, width] = size(I);
noise_type=get(handles.noise_type,'Value');
if noise_type==1
    I=imnoise(I,'gaussian');
elseif noise_type==2
    I=imnoise(I,'salt & pepper',0.02);
else
    I=imnoise(I,'poisson');
end
fsize = 3;
pad = (fsize - 1) / 2;
for i = 1+pad : hight-pad
    for j = 1+pad : width-pad
        filter = I(i-pad:i+pad, j-pad:j+pad);
        I(i,j) = median(filter(:));
    end
end
% I=Median_filter(I,3);
axes(handles.Fig2);
imshow(I);title('中值滤波');




% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% sobel算子锐化
global filename
global pathname
img = imread(fullfile(pathname,filename));
img = rgb2gray(img);
k_shape = [3, 3]; % set kernel size
padding = (k_shape(1)-1) / 2; % padding size
h_kernel = [1,2,1;0,0,0;-1,-2,-1]; % horizon sobel kernel
v_kernel = [-1,0,1;-2,0,2;-1,0,1]; % vertical sobel kernel
[hight, width] = size(img);
norm_img = zeros(hight + padding*2, width + padding*2);
% generate new image
norm_img(1+padding:hight+padding, 1+padding:width+padding) = double(img);
new_norm = zeros(hight + padding*2, width + padding*2);

for i = (1+padding) : (hight+padding)
    for j = (1+padding) : (width+padding)
        % execute grad_norm filter
        h_norm = sum(sum(norm_img(i-padding : i+padding, j-padding : j+padding) .* h_kernel));
        v_norm = sum(sum(norm_img(i-padding : i+padding, j-padding : j+padding) .* v_kernel));
        new_norm(i, j) = abs(h_norm) + abs(v_norm);
    end
end
new_norm = uint8(new_norm(1+padding:hight+padding, 1+padding:width+padding));
% I=Sharpen_filter(I,'Sobel');
axes(handles.Fig2);
imshow(new_norm);title('Sober算子');
% imshow(I);title('植入Sobel算子');


% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% prewitt算子锐化
global filename
global pathname
img = imread(fullfile(pathname,filename));
img = rgb2gray(img);
k_shape = [3, 3]; % set kernel size
padding = (k_shape(1)-1) / 2; % padding size
h_kernel = [1,1,1;0,0,0;-1,-1,-1]; % horizon prewitt kernel
v_kernel = [-1,0,1;-1,0,1;-1,0,1]; % vertical prewitt kernel
[hight, width] = size(img);
norm_img = zeros(hight + padding*2, width + padding*2);
% generate new image
norm_img(1+padding:hight+padding, 1+padding:width+padding) = double(img);
new_norm = zeros(hight + padding*2, width + padding*2);

for i = (1+padding) : (hight+padding)
    for j = (1+padding) : (width+padding)
        % execute grad_norm filter
        h_norm = sum(sum(norm_img(i-padding : i+padding, j-padding : j+padding) .* h_kernel));
        v_norm = sum(sum(norm_img(i-padding : i+padding, j-padding : j+padding) .* v_kernel));
        new_norm(i, j) = abs(h_norm) + abs(v_norm);
    end
end
new_norm = uint8(new_norm(1+padding:hight+padding, 1+padding:width+padding));
% I=Sharpen_filter(I,'Prewitt');
axes(handles.Fig2);
imshow(new_norm);title('Prewitt算子');
% imshow(I);title('植入Prewitt算子');


% --- Executes on button press in low_pass.
function low_pass_Callback(hObject, eventdata, handles)
% hObject    handle to low_pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 低通滤波器
global filename
global pathname
I=imread(fullfile(pathname,filename));
data=get(handles.low_pass_data, 'String');
data=str2num(data);
I=Low_pass_filter(I,data);
axes(handles.Fig2);
imshow(I);title('低通滤波器图');


% --- Executes on button press in high_pass.
function high_pass_Callback(hObject, eventdata, handles)
% hObject    handle to high_pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 巴特沃斯高通滤波器
global filename
global pathname
I=imread(fullfile(pathname,filename));
data=get(handles.high_pass_data, 'String');
data=str2num(data);
I=Butterworth_high_pass_filter(I,data);
axes(handles.Fig2);
imshow(I);title('巴特沃斯高通滤波器图');



function low_pass_data_Callback(hObject, eventdata, handles)
% hObject    handle to low_pass_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of low_pass_data as text
%        str2double(get(hObject,'String')) returns contents of low_pass_data as a double


% --- Executes during object creation, after setting all properties.
function low_pass_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to low_pass_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function high_pass_data_Callback(hObject, eventdata, handles)
% hObject    handle to high_pass_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of high_pass_data as text
%        str2double(get(hObject,'String')) returns contents of high_pass_data as a double


% --- Executes during object creation, after setting all properties.
function high_pass_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to high_pass_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in operator_type.
function operator_type_Callback(hObject, eventdata, handles)
% hObject    handle to operator_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns operator_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from operator_type


% --- Executes during object creation, after setting all properties.
function operator_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to operator_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boundary_test.
function boundary_test_Callback(hObject, eventdata, handles)
% hObject    handle to boundary_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 基于算子的边缘检测
global filename
global pathname
I=imread(fullfile(pathname,filename));
[hight, width, ~] = size(I);
type_operator=get(handles.operator_type, 'Value');
if type_operator==1
    rob_h = [-1,0;0,1];
    rob_v = [0,-1;1,0]; % Roberts template
    rob_img = double(I);
    new = double(I);
    for k = 1:3
        for i = 1:hight-1
            for j = 1:width-1
                grad1 = sum(sum(rob_img(i:i+1,j:j+1,k) .* rob_h));
                grad2 = sum(sum(rob_img(i:i+1,j:j+1,k) .* rob_v));
                new(i,j,k) = abs(grad1) + abs(grad2);
            end
        end
    end
    new = uint8(new);
%     I=Sharpen_filter(I,'Robert');
elseif type_operator==2
    sob_h = [1,2,1;0,0,0;-1,-2,-1];
    sob_v = [-1,0,1;-2,0,2;-1,0,1]; % Sober template
    sob_img = zeros(hight+2, width+2, 3);
    sob_img(2:hight+1, 2:width+1,:) = double(I);
    new = zeros(hight+2, width+2, 3);
    for k = 1:3
        for i = 2:hight+1
            for j = 2:width+1
                grad1 = sum(sum(sob_img(i-1:i+1,j-1:j+1,k).*sob_h));
                grad2 = sum(sum(sob_img(i-1:i+1,j-1:j+1,k).*sob_v));
                new(i,j,k) = abs(grad1) + abs(grad2);
            end
        end
    end
    new = uint8(new(2:hight+1,2:width+1));
%     I=Sharpen_filter(I,'Sobel');
else
    prew_h = [-1,-1,-1;0,0,0;1,1,1];
    prew_v = [-1,0,1;-1,0,1;-1,0,1]; % prewitt template
    prew_img = zeros(hight+2, width+2, 3);
    prew_img(2:hight+1, 2:width+1, :) = double(I);
    new = zeros(hight+2, width+2, 3);
    for k = 1:3
        for i = 2:hight+1
            for j = 2:width+1
                grad1 = sum(sum(prew_img(i-1:i+1,j-1:j+1,k).*prew_h));
                grad2 = sum(sum(prew_img(i-1:i+1,j-1:j+1,k).*prew_v));
                new(i,j,k) = abs(grad1) + abs(grad2);
            end
        end
    end
    new = uint8(new(2:hight+1,2:width+1));
%     I=Sharpen_filter(I,'Prewitt');
end
axes(handles.Fig2);
imshow(new);title('基于传统算子的边缘检测');


% --- Executes on button press in boundary_following.
function boundary_following_Callback(hObject, eventdata, handles)
% hObject    handle to boundary_following (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 边界跟踪
global filename
global pathname
I=imread(fullfile(pathname,filename));
I=boundary_tracking(I);
axes(handles.Fig2);
imshow(I);title('边界跟踪结果');


% --- Executes on button press in watershed.
function watershed_Callback(hObject, eventdata, handles)
% hObject    handle to watershed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global filename
global pathname
I = imread(fullfile(pathname, filename));
I = double(I);

hv = fspecial('prewitt');
hh = hv.';
gv = abs(imfilter(I, hv, 'replicate'));
gh = abs(imfilter(I, hh, 'replicate'));
g = sqrt(gv.^2 + gh.^2);
df = bwdist(I);
L = watershed(df);
em = L==0;
im = imextendedmax(I,20);
g2 = imimposemin(g, im|em);
L2 = watershed(g2);
wr2 = L2==0;
I(wr2) = 255;
axes(handles.Fig2);
imshow(uint8(I));title('分水岭分割');
