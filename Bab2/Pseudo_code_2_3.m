
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Pengurangan antara dua citra        %%%
%%%  dapat digunakan untuk citra berwarna dan    %%%
%%%  citra gray-level                            %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan   %%%
%%%  Citra dan Video Digital: Teori, Aplikasi    %%%
%%%  dan Pemrograman Matlab",2015.               %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;		  	        % kosongkan semua variabel dalam sistim memori
P=imread('image1.jpg');     % baca file citra ‘image1.jpg’, simpan dalam matriks P
figure(1), imshow(P);       % tampilkan citra P
Q=imread('image2.jpg');     % baca file citra ‘image2.jpg’, simpan dalam matriks Q
figure(2), imshow(Q);		% tampilkan citra Q
a = 0.5; b = 1- a;          % nilai bobot a dan b dapat dipilih mengikuti a + b = 1
[N, M, K] = size(P);        % baca ukuran citra P (ukuran citra P=Q)
for  n = 1 : N,
    for  m = 1 : M,
       for  k = 1 : K,
         Citra_sub(n,m,k) = abs(a*P(n,m,k) - b*Q(n,m,k));  % setiap pixel citra P - Q  
       end 					 
    end				                    
end
figure(3), imshow(Citra_sub);	  % tampilkan citra hasil
Citra_sub1=abs(a*P - b*Q);		  % Pengurangan dua matriks citra 
figure(4), imshow(Citra_sub1);    % tampilkan citra hasil
