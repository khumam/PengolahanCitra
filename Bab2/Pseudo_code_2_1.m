%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program membaca dan menampilkan citra       %%%
%%%  berbagai fiel citra dapat dibaca seperti:   %%%
%%%  .bmp, .jpg, .png, .tiff, .gif dan lainnya   %%%
%%%  menampilkan nilai intensitas warna pixel    %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan   %%%
%%%  Citra dan Video Digital: Teori, Aplikasi    %%%
%%%  dan Pemrograman Matlab",2015.               %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;		              % kosongkan semua variabel dalam memori
Img=imread('images.png');     % baca file citra ‘images.png’, simpan dalam matriks Img
figure(1), imshow(Img) , title('Tampilan Citra');    % tampilkan citra
[N,M,K] = size(Img)	          % baca ukuran citra dan jumlah komponen warnanya
for i=N-5:N,	              % mulai dari baris ke N-5 sampai baris ke N
    for j=M-5:M,		      % mulai dari kolom ke M-5 sampai kolom ke M
        for k=1:K,		      % untuk komponen warna dari 1 sampai K
            Img(i,j,k)	      % tampilkan nilai pixel pada posisi i,j dan komponen ke k
        end	                   
    end                                                  
end	                                          
Img(N-5:N,M-5:M,:)	          % tampilkan nilai pixel pada posisi matriks citra N-5, M-5 
                              % sampai posisi N,M dengan semua komponen wananya.
 