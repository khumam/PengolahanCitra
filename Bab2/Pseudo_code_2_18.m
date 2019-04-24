clear all;
I=imread('image5_gray.png'); % baca file citra 'image5_gray.png' dan simpan dalam matriks I
figure(1), imshow(I);		% tampilkan citra ke monitor
Histo=imhist(I);                            % hitung histohram citra I.
[N,M]=size(I);                              % baca ukuran citra
[L] = size(Histo);   		% baca ukuran vector histogram 
Hist_kum(1) = Histo(1);
   for  l = 2 : L,
          Hist_kum(l) = Histo(l) + Hist_kum(l-1);  	% hitung histrogram kumulatif
   end
Hist_kum=Hist_kum/(N*M);		% normalisasi histohram kumulatif.
for  n = 1 : N
    for  m = 1 : M
        Im_equal(n,m)  = round(Hist_kum(I(n,m)+1) *255);  % hitung citra equalization
    end
end
figure(2), imshow(uint8(Im_equal));     	% tampilkan hasil citra equalization ke monitor.
I_equal = histeq(I);             	% hitung citra equalization dengan fungsi histeq() MATLAB
figure(3), imshow(I_equal); 		% tampilkan hasil citra equalization ke monitor.
