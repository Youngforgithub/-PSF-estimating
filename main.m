clear all;
clc;
%% 图像预处理
%读进图像
[filename, pathname] = uigetfile({ '*.bmp';'*.jpg'; '*.gif'}, '选择图片');

%没有图像
if filename == 0
    return;
end

imgsrc = imread([pathname, filename]);
[dim] = size(imgsrc,3);

%转换为灰度图
if dim>1
    imgsrc = rgb2gray(imgsrc);
end

% imgsrc=downsample2(imgsrc,4);%图像下采样
[y,x]=size(imgsrc);

%% 高斯滤波
sigma = 1;
gausFilter = fspecial('gaussian', [3,3], sigma);
img= imfilter(imgsrc, gausFilter, 'replicate');

zz = double(img);

%% canny边缘检测
 %自己的边缘检测函数
 [m theta sector canny1  canny2 bin] = canny1step(img,10);
%   [msrc thetasrc sectorsrc c1src  c2src binsrc] = canny1step(imgsrc, 22);
%  %Matlab自带的边缘检测
%  ed = edge(img, 'canny', 0.5); 


% [xx, yy] = meshgrid(1:x, 1:y);
%% 结果
figure(1),imshow(bin);
% figure(1)
%     %mesh(yy, xx, zz);
%     surf(yy, xx, zz);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Grayscale');
%     axis tight

% figure(2)    
%     subplot(4,2,1);
%         imshow(imgsrc);title('原图');
%     subplot(4,2,2);
%         imshow(img);title('高斯滤波后');
%     subplot(4,2,3);
%         imshow(uint8(m));title('导数');
%     subplot(4,2,4);
%         imshow(uint8(canny1));title('非极大值抑制');
%     subplot(4,2,5);
%         imshow(uint8(canny2));title('双阈值');
%     subplot(4,2,6);
%         imshow(ed);title('Matlab自带边缘检测');
%     subplot(4,2,7);
%         imshow(binsrc);title('未滤波的边缘检测');
%     subplot(4,2,8);
%         imshow(bin);title('我自己的bin');

% figure(3)
%     edzz = 255*double(ed);
%     mesh(yy,xx,edzz);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Grayscale');
%     axis tight 
% 
% 
% 
% figure(4)
%     mesh(yy,xx,m);%画偏导数
%     xlabel('y');
%     ylabel('x');
%     zlabel('Derivative');
%     axis tight 
% 
% figure(5)
%     mesh(yy,xx,theta);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Theta');
%     axis tight
% 
% figure(6)
%     mesh(yy,xx,sector);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Sector');
%     axis tight
% 
% figure(7)
%     mesh(yy,xx,canny2);
%     xlabel('y');
%     ylabel('x');
%     zlabel('Sector');
%     axis tight