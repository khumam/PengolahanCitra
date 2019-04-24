%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Transformasi Geometri: Translasi Citra        %%%
%%%  digunakan untuk citra berwarna, gray-level dan biner  %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan             %%%
%%%  Citra dan Video Digital: Teori, Aplikasi              %%%
%%%  dan Pemrograman Matlab",2015.                         %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
I=imread('image4.png');	 %  Baca file citra 'images.png' dan simpan pada matriks I
figure(1), imshow(I);	 % tampilkan citra I
[N,M,L]=size(I);		 % baca ukura citra I
x0=input('masukan nilai translasi x0 : ');  % masukan nilai translasi x0
y0=input('masukan nilai translasi y0 : ');  % masukan nilai translasi y0
It(1:N+y0,1:M+x0,1:L)=127;                  % set matriks citra transformasi dengan warna abu-abu
T = [ 1 0 x0; 0 1 y0; 0 0 1 ];    % set matriks transformasi T
for y=1:N                         % mulai proses translasi pixel per pixel
    for x=1:M
        v=[x; y; 1];
        V=T*v;                             % hitung koordinat transformasi setiap pixel
        It(V(2,1),V(1,1),1:L)=I(y,x,1:L);  % simpan nilai pixel pada koordinat translasi
    end
end                                        % proses translasi selesai
figure(2), imshow(uint8(It));              % tampilkan citra hasil translasi It
