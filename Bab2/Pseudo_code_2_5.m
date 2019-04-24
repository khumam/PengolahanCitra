%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Operasi Logika AND dan NAND antara dua citra  %%%
%%%  digunakan untuk citra biner                 %%%%%%%%%%%%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan   %%%
%%%  Citra dan Video Digital: Teori, Aplikasi    %%%
%%%  dan Pemrograman Matlab",2015.               %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;		        	% kosongkan semua variabel dalam sistim memori
P=imread('biner1.bmp');     % baca file citra 'biner1.bmp', simpan dalam matriks P
P=im2bw(P,0.1);             % gray-level konversi ke biner
figure(1), imshow(P,[]);    % tampilkan citra P
Q=imread('biner2.bmp');     % baca file citra 'biner2.bmp', simpan dalam matriks Q
Q=im2bw(Q,0.1);             % gray-level konversi ke biner
figure(2), imshow(Q,[]);    % tampilkan citra Q
[N, M] = size(P);           % baca ukuran citra P (ukuran citra Q = P)
for  n = 1 : N,
    for  m = 1 : M,
        if (P(n,m)==1 && Q(n,m)==1)  
                Citra_and(n,m)=1;        % operasi AND antara setiap pixel citra P dan Q
        else  Citra_and(n,m)=0;
        end
        if (P(n,m)==1 && Q(n,m)==1) 
                Citra_nand(n,m)=0;     % operasi NAND antara setiap pixel citra P dan Q
        else  Citra_nand(n,m)=1;
        end
    end				      		                          
end
figure(3), imshow( Citra_and);		% tampilkan citra hasil operasi AND
figure(4), imshow(Citra_nand);      % tampilkan citra hasil operasi NAND
