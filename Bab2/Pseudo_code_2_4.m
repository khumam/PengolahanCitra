%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Perkalian antara dua citra          %%%
%%%  dapat digunakan untuk citra berwarna dan    %%%
%%%  citra gray-level                            %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan   %%%
%%%  Citra dan Video Digital: Teori, Aplikasi    %%%
%%%  dan Pemrograman Matlab",2015.               %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;		  	                % kosongkan semua variabel dalam sistim memori
P= double(imread('image1.jpg'));    % baca file citra ‘image1.jpg’, simpan dalam matriks P
figure(1), imshow(uint8(P));        % tampilkan citra P
Q= double(imread('image2.jpg'));    % baca file citra ‘image2.jpg’, simpan dalam matriks Q
figure(2), imshow(uint8(Q));	    % tampilkan citra Q
[N, M, K] = size(P);                % baca ukuran citra P (ukuran citra Q = P)
for  n = 1 : N,
    for  m = 1 : M,
       for  k = 1 : K,
         Citra_mul(n,m,k) = P(n,m,k)  * Q(n,m,k);    % Kalikan setiap pixel dari citra P dan Q
       end 					                               
    end				      		                          
end
if K==3 d = max( max(max(Citra_mul)));	% hitung nilai maksimum hasil citra P * Q
    else d =  max(max(Citra_mul));
end
Citra_mul =Citra_mul*255/d;		        % Kalikan setiap pixel dari citra
figure(3), imshow(uint8(Citra_mul));	% tampilkan citra hasilnya
