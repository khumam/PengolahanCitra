clear all;
Img=imread('CitraWarna.jpg'); % baca file citra warna
figure(1), imshow(Img);		     % tampilakan citra warna
figure(2), imshow(Img(:,:,1));   % tampilakan komponen R
figure(3), imshow(Img(:,:,2));	 % tampilakan komponen G
figure(4), imshow(Img(:,:,3));	 % tampilakan komponen B
[N,M,L]=size(Img);			     % baca ukuran citra
RGB_Citra(1:425,1:425,1:3)=128;  % set matriks tampilan dalam ruang RGB
sudut = -5*pi/6;			     % set sudut tampilan koor. ke-3
for n=1:N                  
  for m=1:M
      r=double(Img(n,m,1));		 % baca komponen R pixel (n,m)
  g=double(Img(n,m,2));		     % baca komponen G pixel (n,m)
      b=double(Img(n,m,3));		 % baca komponen B pixel (n,m)
      j = 150 + floor(g +(b*sin(sudut)));   	% hitung koordinat tampilan (i,j)
      i = 280 - floor(b*sin(sudut) +  r);     	%   
     RGB_Citra(i,j,1)=r;   		 % simpan warna pixel dalam 
     RGB_Citra(i,j,2)=g;   		 % matriks citra tampilan                              
     RGB_Citra(i,j,3)=b;
  end
end
figure(5), imshow(uint8(RGB_Citra));   % tampilkan distribusi warna citra 
                                       % dalam ruang RGB 
