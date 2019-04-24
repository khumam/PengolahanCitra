%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Operasi Logika OR dan NOR antara dua citra  %%%
%%%  digunakan untuk citra biner                 %%%%%%%%%%%
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
         Citra_or(n,m) = bitor (P(n,m),Q(n,m));    % operasi OR antara dua pixel 
         Citra_nor(n,m) =~ bitor (P(n,m),Q(n,m));  % operasi NOR antara dua pixel 
    end				      		                          
end
figure(3), imshow(Citra_or);		% tampilkan citra hasil OR
Citra_or1 = bitor (P, Q);           % operasi OR antara matriks citra P dan Q   
figure(4), imshow(Citra_or1);       % tampilkan citra hasil
figure(5), imshow(Citra_nor);		% tampilkan citra hasil NOR
Citra_nor1 = ~bitor (P, Q);         % operasi NOR antara matriks citra P dan Q   
figure(6), imshow(Citra_nor1);      % tampilkan citra hasil
