function I=downsample2(input,i)
%input 输入图像，i是下采样率
if i==2
    I=input(1:2:end,1:2:end);
end
if i==4
    I=input(1:4:end,1:4:end);
end
if i==8
    I=input(1:8:end,1:8:end);
end
if i==16
    I=input(1:16:end,1:16:end);
end

