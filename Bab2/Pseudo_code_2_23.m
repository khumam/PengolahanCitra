clear all;                         % kosongkan semua variabel dalam sistim memori
f=im2bw(imread('biner4.png'));     % baca citra ‘Image.bmp’,konversi ke citra biner 
K=5;                               % Set ukuran matriks B 
B=ones(K,K);                       % Set matriks B KxK dengan elemen K*K - 1 connectivity
figure(1), imshow(f);              % tampilkan citra biner f
 [N,M] = size(f);                  % baca ukuran citra f
[I,J] = size(B);                   % baca ukuran matriks B 
I=floor(I/2); 
J=floor(J/2);
for  n = I+1 : N-I,                % loop proses baris citra 
    for  m = J+1 : M-J,            % loop proses kolom citra
        dilasi=0;                  % Inisalisasi nilai dilasi
        for i= -I:I                % loop proses dilasi
            for j= -J:J
                 bit_dilasi= bitand(B(I+1+i,J+1+j),f(n+i,m+j));    % opeasi logika AND 
                 dilasi= bitor(dilasi,bit_dilasi);                 % operasi logika OR  
            end
        end  
         Citra_dilasi(n,m) = dilasi;     % simpan hasil dilasi kedalam matriks citra_dilasi 
    end                                                   
end                                      % proses dilasi selesai
 [N,M] = size(Citra_dilasi);             % baca ukuran citra hasil dilasi
for  n = I+1 : N-I,                      % mulai proses erosi
    for  m = J+1 : M-J,
        erosi=1;
        for i=-I:I
            for j=-J:J
                 bit_erosi= bitand(B(I+1+i,J+1+j),Citra_dilasi(n+i,m+j));   % opeasi logika AND
                 erosi= bitand(erosi,bit_erosi);                            % opeasi logika AND
            end
        end  
         Citra_closing(n,m) = erosi;
    end                                                   
end                                       % proses erosi selesai
 figure(2), imshow((Citra_closing));      % tampilkan citra hasil closing
 Citra_closing1 =  imclose(f,B);          % hitung citra closing menggunakan Matlab
 figure(3), imshow(Citra_closing1);       % tampilkan citra hasil closing Matlab
