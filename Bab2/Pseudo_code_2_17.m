clear all;
I=imread('image5_gray.png'); % baca file citra 'image5_gray.png' dan simpan dalam matriks I
figure(1), imshow(I);		% tampilkan citra ke monitor
Histo=imhist(I);            % hitung histohram citra I.
figure(2), plot(Histo);		% plot histohram ke monitor.
[N,M]=size(I);              % baca ukuran citra
[L] = size(Histo);   		% baca ukuran vector histogram 
Hist_kum(1) = Histo(1);
   for  l = 2 : L,
          Hist_kum(l) = Histo(l) + Hist_kum(l-1);  	% hitung histrogram kumulatif
   end
Hist_kum=Hist_kum/(N*M);		% normalisasi histohram kumulatif.
figure(3), plot(Hist_kum);		% plot histohram kumulatif ke monitor.
