I=imread('G:\大三（下学期）\course\图像处理\作业1\5.jpg');
G=rgb2gray(I);
AW = edge(G,'prewitt'); %用log算子进行边缘检测
BW = edge(G,'sobel'); 
CW = edge(G,'canny');
DW =imread('G:\大三（下学期）\course\图像处理\作业1\22.png');
figure(1);
subplot(2,3,1),imshow(I),title('input personal image');%原图
subplot(2,3,2),imshow(G),title('gray image');%灰度图
subplot(2,3,3),imshow(AW,[]),title('prewitt');
subplot(2,3,4),imshow(BW,[]),title('sobel');
subplot(2,3,5),imshow(CW,[]),title('canny');
subplot(2,3,6),imshow(DW,[]),title('fdog');
