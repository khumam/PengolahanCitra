clear all;
RGB_solid(1:425,1:425,1:3)=128;   	% inisialisasi matriks tampilan ruang warna RGB 
RGB_Edge(1:425,1:425,1:3)=128;      
Imax =255;                       	% inisialisasi Imax,  
sudut = -5*pi/6;             		% set sudut tampilan koordinat ke-3  
for b=0: Imax                  		% Variasin intensitas B dari 0 s/d Imax, 
  for g=0: Imax                		% Variasin intensitas G dari 0 s/d Imax, 
    for r=0: Imax               		    % Variasin intensitas R dari 0 s/d Imax, 
       j = 150 + floor(g +(b*sin(sudut)));  % Konversi koordinat 3-D ke visualisasi 2-D
       i = 280 - floor(b*sin(sudut) +  r);      	%
       RGB_solid(i,j,1)=r;      		% Simpan warna R, G, B dalam matriks          
       RGB_solid(i,j,2)=g;      		% ruang 3-D solid
       RGB_solid(i,j,3)=b;  
                                % Simpan warna R, G, B dalam matriks ruang 3-D edge
       if ((r==b&&g== Imax) || (r==g&&b== Imax) || (b==g&&r== Imax) || (r== Imax &&g== Imax) ||...
          (g== Imax &&b== Imax) || (b== Imax &&r== Imax) || (b==0&&g==0)|| (r==0&&g==0)|| ...
          (b==0&&r==0) || (b==r&&g==0) || (r==g&&b==0)|| (b==g&&r==0) ||...
          (b== Imax &&r==0) || (b==Imax &&g==0) || (g==Imax &&r==0) || (g==Imax &&b==0) || ... 
          (r==Imax &&b==0) || (r== Imax &&g==0) || (r==g&&g==b))
           RGB_Edge(i,j,1)=r;           	% simpan warna R, G, B dalam matriks 
          RGB_Edge(i,j,2)=g;           		% ruang 3-D Edge                              
          RGB_Edge(i,j,3)=b;                              
      end
    end;
  end;
end;
figure(1), imshow(uint8(RGB_solid));       	% Tampilkan ruang warna RGB 3-D solid
figure(2), imshow(uint8(RGB_Edge));       	% Tampilkan ruang warna RGB 3-D Edge
