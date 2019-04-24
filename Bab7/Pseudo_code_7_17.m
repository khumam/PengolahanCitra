clear all;
 for k=2:23
    citra_k = strcat('ObjMotion_' ,num2str(k), '.png');   
    I1=imread(citra_k);                                       % baca citra ke k
    citra_k1 = strcat('ObjMotion_' ,num2str(k+1), '.png');
    I2=imread(citra_k1);                                      % baca citra ke k+1
    figure(1),imshow(I1);                                     % tampilkan citra ke k
    [N,M,L]=size(I1);                                         % baca ukurancitra
    blk=8;                                                    % ukuran blok
    th_obj =50;
    th_sim =5;
    for n=blk+1:blk:N-blk                                     % Pembagian blok baris
        for m=blk+1:blk:M-blk                                 % Pembagian blok kolom
            Mean=sum(sum(I1(n:n+blk-1,m:m+blk-1)))/blk;
            if Mean> th_obj                                   % cek blok citra k, lakukan proses bila ada objek
                I1(n:n+blk-1,m:m+blk-1)=255;
                a=0;                                          % set a=0 sebagai parameter break
                for n1=n-blk:blk:n+blk
                    for m1=m-blk:blk:m+blk
                        delta=sum(sum(abs(I2(n1:n1+blk-1,m1:m1+blk-1)-I1(n:n+blk-1,m:m+blk-1))));
                        if delta< th_sim                                % cek kemiripan nilai blok citra k dan citra k+1
                            hold on                                     % lakukan proses bila similar
                            quiver(m+(blk/2),n+(blk/2),(m-m1),(n-n1))   % tampilkan arah vector
                            a=1;                                        % set a=1 untuk break
                            break           % cek kemiripan nilai blok selesai
                        end
                        if a==1
                            break           % cek kemiripan nilai blok selesai
                        end
                     end
                  if a==1                                                                                                  
                  break                      % cek kemiripan nilai blok selesai
                  end
              end
          end
      end
   end     
end                                         % lanjutkan citra berikutnya hingga citra ke 23

