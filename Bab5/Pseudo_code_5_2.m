clear all;
RGB_solid(1:425,1:425,1:3)=230;       % inisialisasi warna dasar matriks tampilan                                          
sudut = -5*pi/6;   Q=8;                         % inisialisasi sudut tampilan ke monitor dan kuantisasi Q
Th=round(255/Q)                                   % rentan jarak setiap kuantisasi warna
for b=1:255                                             % Variasi intensitas komponen warna Biru dari 0 s/d 255 
  for g=1:255                                           % Variasi intensitas komponen warna Hijau dari 0 s/d 255
    for r=1:255                                          % Variasi intensitas komponen warna Merah dari 0 s/d 255
       j = 150 + floor(g +(b*sin(sudut)));   % Konversi koordinat 3-D ke tampilan monitor 2-D
       i = 280 - floor(b*sin(sudut) +  r);
                                                                 % buat garis pemisah berwana putih antara 2 palette warna
       if mod(r,Th)==0 || mod((g),Th)==0 || mod((b),Th)==0|| (r==255 && g==255) ||...
           (r==255 && b==255) || (b==255 && g==255)
          RGB_solid(i,j,1)=0;  RGB_solid(i,j,2)=0;      
          RGB_solid(i,j,3)=0;
       else                                                    % bentuk peta warna 3D
         RGB_solid(i,j,1)= ceil(r/Th)*Th;                
         RGB_solid(i,j,2)= ceil(g/Th)*Th;  
         RGB_solid(i,j,3)= ceil(b/Th)*Th;  
       end                   
    end;
  end;
end;
figure, imshow(uint8(RGB_solid));            % Tampilkan peta warna 3D, ruang warna RGB
