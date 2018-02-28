I = imread('original.jpg');
figure
imshow(I);
[m,n] = size(I);
mask = imread('mask2.jpg');
tmpx = [-2,-1,0,1,2];
tmpy = [-2,-1,0,1,2];
power=zeros(5,5);
    for k=1:5
        for w=1:5
            if( tmpx(k)*tmpx(k)+tmpy(w)*tmpy(w)~=0)
                power(k,w)=1/sqrt(tmpx(k)*tmpx(k)+tmpy(w)*tmpy(w));
            else
                power(k,w)=0;
            end
        end
   end
b=rand(494,303);
rate=0.05;
for i=1:494
     for j=1:303
        %if(mask(i,j,1)<100|| mask(i,j,2)<100  || mask(i,j,3)<100 )
        if(b(i,j)<rate) %white
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
      %if(mask(i,j,1)<100|| mask(i,j,2)<100  || mask(i,j,3)<100)
       if(b(i,j)<rate) 
           tarr=0;
           targ=0;
           tarb=0;
           rr=zeros(5,5);
           gg=zeros(5,5);
           bb=zeros(5,5);
     for k=1:5
        for w=1:5
          if(((i+tmpx(k))>0)&&((i+tmpx(k))<494-1) && ((j+tmpy(w))>0)&&((j+tmpy(w))<303-1))
             rr(k,w) = I(i+tmpx(k),j+tmpy(w),1);
             gg(k,w) = I(i+tmpx(k),j+tmpy(w),2);
             bb(k,w) = I(i+tmpx(k),j+tmpy(w),3);
          end
        end
     end
     sr=0;
     sg=0;
     sb=0;
      
    for k=1:5
        for w=1:5
           if(rr(k,w)~=255)
               sr =sr+power(k,w);
           end
           if(gg(k,w)~=255)
               sg =sg+power(k,w);
           end
           if(bb(k,w)~=255)
               sb =sb+power(k,w);
           end
        end
    end
    for  k=1:5
     for w=1:5
        if(rr(k,w)~=255) 
         tarr = tarr+rr(k,w)*(power(k,w)/sr);
        end
        if(gg(k,w)~=255) 
         targ = targ+gg(k,w)*(power(k,w)/sg);
        end
        if(bb(k,w)~=255)
         tarb = tarb+bb(k,w)*(power(k,w)/sb);
        end
     end
    end
         I(i,j,1)=tarr;
         I(i,j,2)=targ;
         I(i,j,3)=tarb;
     end
 end
end
imshow(I);
