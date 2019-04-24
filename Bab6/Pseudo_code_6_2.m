clear all;
datain='TOBEORNOTTOBEORTOBEORNOT';                               %  data masukan
j=1;                                     % digunakan untuk urutan kata dalam kamus dan keluaran
dictnew(1)={''};                                                                              % inisialisasi kamus
W=datain(1);                                                                                    % karakter pertama
i=1;                                                           % digunakan untuk urutan karakter masukan
lda=length(datain);                                                     % baca panjangnya data masukan
for ii=1:lda-1                                          % loop proses pembuatan kamus dan keluaran
     c=datain(i+1);                                                             % karakter yang akan diproses
     Wc=[W,c];                                                                                              % kata W+C 
     if strcmp(dictnew,Wc)==0;                               % cek kata bila belum ada di kamus
        dictnew(j)={Wc};                                                   % catat kata baru dalam kamus
        dout(j)={W};                                                                 % cata W sebagai keluaran
        j=j+1;
       W=c;                                                                                           % pindahan c ke W
    else
       W=Wc;                                          % jika sudah ada di kamus pindahkan Wc ke W
    end
  i=i+1;
end
 
c=datain(i);                                        % lakukan hal yang sama untuk karakter terakhir
Wc=[W,c];  
if strcmp(dictnew,Wc)==0;
   dictnew(j)={Wc};
   dout(j)={W};
end
dout                                                                          % keluaran bentuk simbol karakter
                                                       % Konversi keluaran kedalam bentuk nilai numerik
[tf, index] = ismember(dout,dictnew);
for i=1:length(index)
    if index(i) == 0 
        Dout(i)= double(char(dout(i)));
    else
        Dout(i)= 255+index(i);
    end
end
Dout                                                                                    % keluaran bentuk numerik
                                                   %%%% Konversi keluaran kedalam bentuk bitstream
Nb=ceil(log2(max(Dout)))                                                    % hitung panjang bit kode
bitstream=[];
for i=1:length(index)
    bitstream=[bitstream dec2bin(Dout(i), Nb)];                              % konversi ke biner
end
bitstream                                                                           % keluaran bentuk bit stream
