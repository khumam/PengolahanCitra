%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Pemfilteran Citra melalui Operasi     %%%
%%%  konvolusi matriks ukuran KxK                  %%%
%%%  digunakan untuk citra berwarna dan gray-level %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan     %%%
%%%  Citra dan Video Digital: Teori, Aplikasi      %%%
%%%  dan Pemrograman Matlab",2015.                 %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
K=3;                        %  Set ukuran matriks filter 3x3
F=ones(K,K)/(K*K) ;         %  Set matriks filter rata-rata F 3x3   
I=imread('image3.png');	    %  Baca file citra format png dan simpan pada matriks I
figure(1), imshow(I);		% tampilkan citra I
[N,M,L]=size(I);		    % baca ukura citra I
for p=1:L                   %  Loop komponen warna
    Konv(1:N,1:M,p)=conv2(double(I(: , : , p)), F, 'same');       % proses konvolusi citra
end
figure(2), imshow(uint8(Konv)); 	% tampilkan hasil konvolusi
