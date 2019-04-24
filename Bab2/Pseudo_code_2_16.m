%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Penghitungan Histogram Citra dan visualisasinya %%%
%%%  digunakan untuk citra gray-level                        %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan               %%%
%%%  Citra dan Video Digital: Teori, Aplikasi                %%%
%%%  dan Pemrograman Matlab",2015.                           %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
I=imread('image5_gray.png'); % baca file citra 'citra_gray.png' dan simpan dalam matriks I
figure(1), imshow(I);		 % tampilkan citra ke monitor
[N, M] = size(I);            % baca ukuran matriks citra I 
Histo(1:256) = 0;		     % set vector histogram dengan nilai intensitas 0 s/d 255
for  n = 1 : N		         % hitung histogram citra
     for  m = 1 : M
         Histo( I(n,m) +1) = Histo( I(n,m) +1) + 1;    % naikan 1 frekuensi munculnya 
     end				        % intensitas I(n,m) yang terbaca
end
figure(2), plot(Histo);			% plot histohram ke monitor. 
Histo1=imhist(I);                                      	% hitung histohram citra I.
figure(3), plot(Histo1);		% plot histohram ke monitor.
