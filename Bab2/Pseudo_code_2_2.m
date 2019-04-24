%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Penjumlahan antara dua citra        %%%
%%%  dapat digunakan untuk citra berwarna dan    %%%
%%%  citra gray-level                            %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan   %%%
%%%  Citra dan Video Digital: Teori, Aplikasi    %%%
%%%  dan Pemrograman Matlab",2015                %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;		  	        % kosongkan semua variabel dalam sistim memori
P=imread('image1.png');     % baca file citra ‘image1.png’, simpan dalam matriks P
figure(1), imshow(P);       % tampilkan citra P
Q=imread('image2.png');     % baca file citra ‘image2.png’, simpan dalam matriks Q
figure(2), imshow(Q);		% tampilkan citra Q
a = 0.5; b = 1- a;          % nilai bobot a dan b dapat dipilih mengikuti a + b = 1
[N, M, K] = size(P);        % baca ukuran citra P (ukuran citra Q = P)
[N1, M1, K1] = size(Q);
N=min(N,N1); M=min(M,M1); K=min(K,K1);   % sesuaikan ukuran citra P dan Q
for  n = 1 : N,
    for  m = 1 : M,
       for  k = 1 : K,
         Citra_sum(n,m,k) = a*P(n,m,k) + b*Q(n,m,k); % Jumlah dua pixel P dan Q 
       end 					                         % dengan bobot a dan b.
    end				                    
end
figure(3), imshow(Citra_sum);   % tampilkan citra hasil
Citra_sum1=a*P(1:N,1:M)+b*Q(1:N,1:M);	            % Penjumlahan matriks antara dua matriks P dan Q
figure(4), imshow(Citra_sum1);  % tampilkan citra hasil
