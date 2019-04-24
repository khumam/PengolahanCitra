Dinput='this is an example of a huffman tree'   % data masukan
L=length(Dinput);                                   % hitung panjang data
DinputNum(1:L)=0;                                            % insialisasi vektor konversi data masukan
Hist(1:256)=0;                                         % insialisasi vektor histogram 256 karakter ASCII                                                                             
for i=1:L;                                                 % loop konversi ASCII data masukan dan histogram
    DinputNum(i)=double(Dinput(i));
    Hist(DinputNum(i))=Hist(DinputNum(i))+1;
end
 PHist=Hist/L;                                                % hitung probabilitas
 [PHist symbols]=sort(PHist,'descend');         % pengurutan besar ke kecil
 eobi=max(find(PHist~=0));                           % tentukan batas non-zero             
 PHist=PHist(1:eobi);                                     % hilangkan bagian histogram tidak terisi
 symbols=symbols(1:eobi);                            % hilangkan bagian karakter yang tidak ada
                                                                        % proses coding
 dict = huffmandict(symbols,PHist);              % buat tabel kamus.
 hcode = huffmanenco(DinputNum,dict);      % encode data masukan dengan kamus.
                                                                       % proses decoding atau rekonstruksi
 dhsig = huffmandeco(hcode,dict);                % decode bit stream dengan kamus
 Drec = char(dhsig(:))'                                    % konversi ASCII ke karakter
