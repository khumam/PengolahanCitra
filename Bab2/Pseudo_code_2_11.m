%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Operasi konvolusi matriks ukuran KxK  %%%
%%%  digunakan untuk citra berwarna dan gray-level %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan     %%%
%%%  Citra dan Video Digital: Teori, Aplikasi      %%%
%%%  dan Pemrograman Matlab",2015.                 %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
K=3;                         %  Set ukuran matriks filter 3x3
F=ones(K,K)/(K*K) ;          %  Set matriks filter rata-rata F 3x3  
K1=(K+1)/2; 
I=[164 63 75 95 157          %  Set matriks citra I 5x5 pixel
      120 135 55 75 116	                            
       99 132 60 54 100
       64 150 113 50 81
       110 130 162 60 76];
[N,M]=size(I);                         %  Baca ukuran matriks I
Citra = zeros(N+K-1, M+K-1);           %  Set matriks nol berukuran N+K-1, M+K-1 pixel
Citra(K1:N+K1-1, K1:M+K1-1)=I(:,:)     %  letakkan matrik I ditengah citra		
for  n = K1 : N+K1-1                   % Loop baris
    for  m = K1 : M+K1-1               % Loop kolom
        konv=0;  
        for l = 1 : K                  % Loop proses konvolusi
            for k = 1 : K
            konv = konv +(F(l,k) * Citra(n+l-K1,m+k-K1));   % Proses konvolusi
            end
        end
       Citra_konv(n-K1+1,m-K1+1) = konv;     % Citra hasil konvolusi 
    end
end
Citra_konv		                 % tampilkan hasil konvolusi
Citra_konv1=conv2(I,F,'same')    % konvolusi menggunakan fungsi conv2 dari MATLAB
