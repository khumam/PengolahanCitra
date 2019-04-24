function Im_seg = Segm_RGBpixel(im,Wref,Th)
[m,n,l]=size(im);
Im_seg(1:m,1:n,1:l)=uint8(30);
for i=1:m
  for j=1:n
     d=abs((im(i,j,:))-(Wref(1,1,:)));
     if sqrt(d(1,1)^2 + d(1,2)^2 + d(1,3)^2)<=Th
        Im_seg(i,j,:)= im(i,j,:);
     end;    
  end;
end;
