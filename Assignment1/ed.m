I=imread('G:\��������ѧ�ڣ�\course\ͼ����\��ҵ1\5.jpg');
G=rgb2gray(I);
AW = edge(G,'prewitt'); %��log���ӽ��б�Ե���
BW = edge(G,'sobel'); 
CW = edge(G,'canny');
DW =imread('G:\��������ѧ�ڣ�\course\ͼ����\��ҵ1\22.png');
figure(1);
subplot(2,3,1),imshow(I),title('input personal image');%ԭͼ
subplot(2,3,2),imshow(G),title('gray image');%�Ҷ�ͼ
subplot(2,3,3),imshow(AW,[]),title('prewitt');
subplot(2,3,4),imshow(BW,[]),title('sobel');
subplot(2,3,5),imshow(CW,[]),title('canny');
subplot(2,3,6),imshow(DW,[]),title('fdog');
