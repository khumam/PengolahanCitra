clear all;                         % kosongkan semua variabel dalam sistim memori
f=im2bw(imread('biner3.bmp'));     % baca citra ‘biner3.bmp’,konversi ke citra biner 
B=[1 1 1; 1 1 1; 1 1 1];           % Set matriks B dengan elemen 8 connectivity
figure(1), imshow(f);              % tampilkan citra biner f
 [N,M] = size(f);                  % baca ukuran citra f
[I,J] = size(B);                   % baca ukuran matriks B 
I=floor(I/2); 
J=floor(J/2);
for  n = I+1 : N-I,                % loop proses baris citra 
    for  m = J+1 : M-J,            % loop proses kolom citra
        erosi=1;                   % Inisalisasi nilai erosi
        for i= -I:I                % loop proses erosi
            for j= -J:J
                 bit_erosi= bitand(B(I+1+i,J+1+j),f(n+i,m+j));    % opeasi logika AND 
                 erosi= bitand(erosi,bit_erosi);                  % operasi logika AND 
            end
        end  
         Citra_erosi(n,m) = erosi;    % simpan hasil erosi kedalam matriks citra_erosi 
    end                                                   
end
 figure(2), imshow((Citra_erosi));    % tampilkan citra hasil erosi
 Citra_erosi1 =  imerode (f,B);       % Citra erosi menggunakan fungsi erosi pada Matlab
 figure(3), imshow(Citra_erosi1);     % tampilkan citra hasil erosi.
