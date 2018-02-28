I = imread('original.jpg');
figure
imshow(I);
[m,n] = size(I);
mask = imread('mask2.jpg');
b=rand(494,303);
rate=0.05;
for i=1:494
     for j=1:303
        %if(mask(i,j,1)<100|| mask(i,j,2)<100  || mask(i,j,3)<100 )
        if(b(i,j)<rate&&i>1&&j>1) 
          I(i,j,1) = 255;
          I(i,j,2) = 255;
          I(i,j,3) = 255;
        end
     end
end
figure
imshow(I);
figure
for i= 1:494
 for j= 1:303
     %if(mask(i,j,1)<100|| mask(i,j,2)<100  || mask(i,j,3)<100)%mask
        if(b(i,j)<rate&&i>1&&j>1) %loss
          I(i,j,1) = I(i-1,j-1,1);
          I(i,j,2) = I(i-1,j-1,2);
          I(i,j,3) = I(i-1,j-1,3);
     end
 end
end
imshow(I);
