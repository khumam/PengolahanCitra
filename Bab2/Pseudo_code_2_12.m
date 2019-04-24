%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Pemfilteran Citra melalui Operasi     %%%
%%%  konvolusi matriks ukuran KxK                  %%%
%%%  digunakan untuk citra berwarna dan gray-level %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan     %%%
%%%  Citra dan Video Digital: Teori, Aplikasi      %%%
%%%  dan Pemrograman Matlab",2015.                 %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
K=3;                            %  Set ukuran matriks filter KxK
F=ones(K,K)/(K*K) ;             %  Set matriks filter rata-rata F KxK  
K1=(K+1)/2; 
I=imread('image3.png');	        %  Baca file citra format png dan simpan pada matriks I
figure(1), imshow(I);           % tampilkan citra asli
[N,M,L]=size(I);                %  Baca ukuran matriks citra I
Citra = zeros(N+K-1, M+K-1,L);           %  Set matriks nol berukuran N+K-1, M+K-1 pixel
Citra(K1:N+K1-1, K1:M+K1-1,:)=I(:,:,:)   %  letakkan matrik I ditengah citra	
for p =1:L	                             %  Loop komponen warna
   for  n = K1 : N+K1-1                  %  Loop baris citra
     for  m = K1 : M+K1-1                %  Loop kolom citra
          konv=0;  
        for l = 1 : K
            for k = 1 : K
               konv = konv +(F(l,k) * Citra(n+l-K1,m+k-K1,p)); % Proses konvolusi
            end
        end
        Citra_konv(n-K1+1,m-K1+1,p) = konv;     % Citra hasil konvolusi 
     end
  end
end
figure(2), imshow(uint8(Citra_konv));           % tampilkan hasil konvolusi
%imwrite(uint8(Citra_konv), 'File_hasil.png');  % simpan hasil konvolusi kedalam file
