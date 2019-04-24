clear all;
HSV_solid(1:375,1:575,1:3)=128;    		% Inisialisasi matriks tampilan
HSV_Edge(1:375,1:570,1:3)=128;    		% ruang HSV
for b=0:255
  for g=0:255
    for r=0:255
         Max = max(r,max(g,b));    Min = min(r,min(g,b));  C = Max-Min;
         V = Max;            			% hitung Value atau Luminance                                        
          if (Max == Min) S = 0;        % hitung Saturation
             else  S = C;
          end;                                 
         if (Max==Min) H=0;                   	% hitung Hue
           elseif (r == Max) H = ((g - b))/C;
           elseif (g == Max) H = 2 + (b - r)/C;
         else                H = 4 + (r - g)/C;
         end;
         H=H*pi/3;
    j=285 + floor(S*cos(H));              		% koordinat silinder 3-D 
    i=350 - floor(S*sin(H)/4.0 + V);     		% ke tampilan 2-D
    HSV_solid(i,j,1)=r;              			% Letakan warna R, G, B  pada 
    HSV_solid(i,j,2)=g;              			% matriks tampilan 3-D solid
    HSV_solid(i,j,3)=b;
                               % RGB ke HSV, 3-G edge
if ((r==b&&g==255) || (r==g&&b==255) || (b==g&&r==255) || ...  
     (r==255&&g==255) || (g==255&&b==255) || ...
     (b==255&&r==255) || (b==0&&g==0)|| (r==0&&g==0)|| ...
     (b==0&&r==0) || (b==r&&g==0) || (r==g&&b==0)||... 
     (b==g&&r==0) || (b==255&&r==0) || (b==255&&g==0) || ... 
     (g==255&&r==0) || (g==255&&b==0) || (r==255&&b==0)|| ... 
     (r==255&&g==0) || (r==g&&g==b))
      HSV_Edge(i,j,1)=r;           % Letakan warna R, G, b  pada 
      HSV_Edge(i,j,2)=g;           % matriks tampilan 3-D edge
      HSV_Edge(i,j,3)=b;
      end;
    end;
  end;
end;                                
figure(1), imshow(uint8(HSV_solid));    % Tampilkan ruang warna 
figure(2), imshow(uint8(HSV_Edge));     % HSV solid dan edge 
