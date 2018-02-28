I = imread('original.jpg');
[m,n] = size(I);
mask = rand(m,n);
rate = 0.3;
mask(mask>rate)=1;
mask(mask<rate)=0;
for i=1:m
     for j=1:n
        if(mask(i,j)== 1)
           I(i,j) = 255;
        end
    end
end

%  M = imread('mask.jpg');
%  mask = I - M;
%  for i=1:m
%       for j=1:n
%          if(mask(i,j) > 2)
%             mask(i,j) = 1;
%             I(i,j) = 255;
%          else 
%              mask(i,j) = 0;
%          end
%       end
%  end%

figure
imshow(I);
I = double(I);
for i= 1:m
 for j= 1:n
     if mask(i,j)==1
        count = 0;
        x = (24); y = (24); b = (24);
        A = [24,24];
        for k=i-1:1:i+1
         for h=j-1:1:j+1
          if k >= 1 && k <= m && h >= 1 && h <= n
             if mask(k,h)==0
                 count = count + 1;
                 x(count) = k;
                 y(count) = h;
                 b(count) = I(k,h);
             end
          end  
         end
        end
        if (count>1)    
         for k=1:1:count
            for h=1:1:count
             r = (x(k)-x(h))*(x(k)-x(h)) + (y(k)-y(h))*(y(k)-y(h)); 
             A(k,h) = sqrt(1+0.3*r);
            end
         end
         b = b';
         w = A \ b;
         I(i,j)=0;
         for k = 1:1:count
           r = (i-x(k))*(i-x(k))+(j-y(k))*(j-y(k));  
           I(i,j) = I(i,j)+w(k)*sqrt(1+0.3*r);
         end  
        end
     end
 end
end
I = uint8(I);
result = I;
figure
imshow(result);