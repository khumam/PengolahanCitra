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
        erosi=1;                   % Inisalisasi nilai erosi
        for i= -I:I                % loop proses erosi
            for j= -J:J
                 bit_erosi= bitand(B(I+1+i,J+1+j),f(n+i,m+j));  % opeasi logika AND
                 erosi= bitand(erosi,bit_erosi);                % operasi logika AND 
            end
        end  
         Citra_erosi(n,m) = erosi;   % simpan hasil erosi kedalam matriks citra_erosi 
    end                                                   
end                                  % akhir proses erosi
 
[N,M] = size(Citra_erosi);           % baca ukuran citra hasil erosi
for  n = I+1 : N-I,                  % mulai proses dilasi
    for  m = J+1 : M-J,
        dilasi=0;
        for i=-I:I
            for j=-J:J
                 bit_dilasi= bitand(B(I+1+i,J+1+j),Citra_erosi(n+i,m+j));   % opeasi logika AND
                 dilasi= bitor(dilasi,bit_dilasi);                          % opeasi logika OR
            end
        end  
         Citra_opening(n,m) = dilasi;
    end                                                   
end                                      % akhir proses dilasi
 figure(2), imshow((Citra_opening));     % tampilkan citra hasil opening
 Citra_opening1 =   imopen(f,B);         % hirung citra opening menggunakan Matlab
 figure(3), imshow((Citra_opening1));    % tampilkan citra hasil opening Matlab
