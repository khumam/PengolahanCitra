clear all;
I=imread('images.png');
figure(1),imshow(I);
I(1:10,1:10,1)
[N,M,L]=size(I)
HSV_Edge(1:350,1:400,1:3)=128;
for n=1:N
    for m=1:M
       b=double(I(n,m,3)); g=double(I(n,m,2)); r=double(I(n,m,1));
       Max = max(r,max(g,b));
         Min = min(r,min(g,b));
         C = Max-Min;
         V = Max;            % hitung Value atau Luninance
                                                     
          if (Max == Min) S = 0;         % hitung Saturation
             else  S = C;
          end;
                                                    
         if (Max==Min) H=0;                   % hitung Hue
         elseif (r == Max)   H = ((g - b))/C;
           elseif (g == Max) H = 2 + (b - r)/C;
           elseif (b == Max)   H = 4 + (r - g)/C;
         end;
         H=H*pi/3;

          j=200 + floor(S*cos(H)/1.5);              % koordinat silinder 3-D 
    i=325 - floor(S*sin(H)/6.0 + V);     % ke tampilan 2-D
       HSV_Edge(i,j,1)=r;
        HSV_Edge(i,j,2)=g;
        HSV_Edge(i,j,3)=b;
    end;
end;

for b=0:255
  for g=0:255
    for r=0:255
       
         Max = max(r,max(g,b));
         Min = min(r,min(g,b));
         C = Max-Min;
         V = Max;            % hitung Value atau Luninance
                                                     
          if (Max == Min) S = 0;         % hitung Saturation
             else  S = C;
          end;
                                                    
         if (Max==Min) H=0;                   % hitung Hue
         elseif (r == Max)   H = ((g - b))/C;
           elseif (g == Max) H = 2 + (b - r)/C;
           elseif (b == Max)   H = 4 + (r - g)/C;
         end;
         H=H*pi/3;

          j=200 + floor(S*cos(H)/1.5);              % koordinat silinder 3-D 
    i=325 - floor(S*sin(H)/6.0 + V);     % ke tampilan 2-D

         if ((r==b&&g==255) || (r==g&&b==255) || (b==g&&r==255) ...
           || (r==255&&g==255) || (g==255&&b==255) || (b==255&&r==255)...
           || (b==0&&g==0)|| (r==0&&g==0)|| (b==0&&r==0) || (b==r&&g==0)...
           || (r==g&&b==0)|| (b==g&&r==0) || (b==255&&r==0)...
           || (b==255&&g==0) || (g==255&&r==0) || (g==255&&b==0) || ...
           (r==255&&b==0)|| (r==255&&g==0) || (r==g&&g==b))
        HSV_Edge(i,j,1)=r;
        HSV_Edge(i,j,2)=g;
        HSV_Edge(i,j,3)=b;
         end;
    end;
  end;
end;
figure(2), imshow(uint8(HSV_Edge));
imwrite(uint8(HSV_Edge),'HSV_image.png');
    