clear all;
CMY_solid(1:425,1:425,1:3)=128;  	% Inisialisasi matriks tampilan
CMY_Edge(1:425,1:425,1:3)=128;
Imax =255;    sudut = -5*pi/6;      % inisialisasi Imax,  dan sudut tampilan
for b=0: Imax                 		% Variasi intensitas B dari 0 s/d Imax, = 255 
  for g=0: Imax              		% Variasi intensitas G dari 0 s/d Imax, = 255
    for r=0: Imax              		% Variasi intensitas R dari 0 s/d Imax, = 255	
       j = 150 + floor(g + (b*sin(-5*pi/6)));   %  Koordinat 3-D ke tampilan koordinat 2-D
       i = 280 - floor(b*sin(-5*pi/6) +  r);
       CMY_solid(i,j,1)= Imax  - r;             % Konversi dari RGB ke CMY, 3-D solid
       CMY_solid(i,j,2)= Imax  - g;                                  
       CMY_solid(i,j,3)= Imax  - b;  
                         			% Konversi dari RGB ke CMY, 3-G edge
if ((r==b&&g== Imax) || (r==g&&b== Imax) || (b==g&&r== Imax) || (r== Imax &&g== Imax) ||...
    (g== Imax &&b== Imax) || (b== Imax &&r== Imax) || (b==0&&g==0)|| (r==0&&g==0)|| ...
    (b==0&&r==0) || (b==r&&g==0) || (r==g&&b==0)|| (b==g&&r==0) || (b== Imax &&r==0) ||...
    (b==Imax &&g==0) || (g==Imax &&r==0) || (g==Imax &&b==0) || (r==Imax &&b==0)|| ... 
    (r== Imax &&g==0) || (r==g&&g==b))
     CMY_Edge(i,j,1)= Imax  - r;        
     CMY_Edge(i,j,2)= Imax - g;                                 
     CMY_Edge(i,j,3)= Imax  - b;                                 
       end
    end;  
  end;  
end;
figure(1), imshow(uint8(CMY_solid));
figure(2), imshow(uint8(CMY_Edge));    
