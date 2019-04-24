%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Operasi Logika AND dan NAND antara dua citra  %%%
%%%  digunakan untuk citra biner                 %%%%%%%%%%%%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan   %%%
%%%  Citra dan Video Digital: Teori, Aplikasi    %%%
%%%  dan Pemrograman Matlab",2015.               %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;		  	        % kosongkan semua variabel dalam sistim memori
P=imread('biner1.bmp');     % baca file citra 'biner1.bmp', simpan dalam matriks P
P=im2bw(P,0.1);             % gray-level konversi ke biner
figure(1), imshow(P,[]);    % tampilkan citra P
Q=imread('biner2.bmp');     % baca file citra 'biner2.bmp', simpan dalam matriks Q
Q=im2bw(Q,0.1);             % gray-level konversi ke biner
figure(2), imshow(Q,[]);    % tampilkan citra Q
[N, M] = size(P);           % baca ukuran citra P (ukuran citra Q = P)
for  n = 1 : N,
    for  m = 1 : M,         
         Citra_and(n,m) = bitand (P(n,m) , Q(n,m) );     % operasi AND antara dua pixel   
         Citra_nand(n,m) = ~bitand (P(n,m),Q(n,m));      % operasi NAND antara dua pixel 
    end				      		                          
end
figure(3), imshow( Citra_and);	      % tampilkan citra hasil AND
Citra_and1 = bitand (P, Q);           % operasi AND antara matriks citra P dan Q   
figure(4), imshow(Citra_and1);        % tampilkan citra hasil
figure(5), imshow(Citra_nand);	      % tampilkan citra hasil NAND
Citra_nand1 = ~bitand (P, Q);         % operasi NAND antara matriks citra P dan Q   
figure(6), imshow(Citra_nand1);       % tampilkan citra hasil
