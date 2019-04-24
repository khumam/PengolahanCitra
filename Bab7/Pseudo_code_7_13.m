function Video_sub_sampling()
Fig1=figure(1); 
vid = videoinput('winvideo',1,'MJPG_320x240');   % aquisisi video dengan format MJPG_640x480
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                      % mulai akuisisi video
sk=2; sb=2;
Stop=1;                                          % set kondisi stop akuisisi
 while (Stop>0)                                  % lakukan loop akusisi hingga kondisi stop=0 
    trigger(vid);                                % akuisisi satu frame
    im= getdata(vid,1);                          % baca data citra dari frame video      
    YCbCr=rgb2ycbcr(im);
    if  ishandle(Fig1)==0                        % jika window tampilan telah ditutup
       Stop=0;                                   % Stop=0, hentikan proses
    else                                         % jika belum ditutup, teruskan proses
        Y=YCbCr(:,:,1);                          % kompnen Y
        Cb=YCbCr(1:sb:end,1:sk:end,2);           % sub-sampling kompnen Cb
        Cr=YCbCr(1:sb:end,1:sk:end,3);           % sub-sampling kompnen Cr
         RGB = rekonstruksi_sampling(Y, Cb, Cr, sb, sk);        % lakukan rekonstruksi
         Stop=tampil(Fig1,im,YCbCr, Y, Cb, Cr, sb, sk, RGB);    % tamplkan semua citra
    end
 end
stop(vid);                                                      % stop akuisisi
delete(vid);                                                    % hapus semua frame
clear vid;                                                      % hapus variable vid
end                                                             % Selesai

function Stop = tampil(Fig1, im, YCbCr, Y, Cb, Cr, sb, sk,RGB)
Stop=1;
    if  ishandle(Fig1)==0  % jika window tampilan belum ditutup
       Stop=0; 
    else                              % jika window tampilan sudah ditutup
         if sb==1 && sk==1
            subplot(3,4,1:2), imshow(YCbCr), title('Citra YCbCr'); 
            subplot(3,4,3:4), imshow(Y), title('Komponen Y');
            subplot(3,4,5:6), imshow(Cb), title('Komponen Cb'); 
            subplot(3,4,7:8), imshow(Cr), title('Komponen Cr');
            drawnow;
         else 
            subplot(3,4,1:2), imshow(YCbCr), title('Citra YCbCr');
            subplot(3,4,3:4), imshow(Y), title('Komponen Y'); 
            subplot(3,4,6), imshow(Cb), title('Komponen Cb'); 
            subplot(3,4,7), imshow(Cr), title('Komponen Cr');
            drawnow;
         end
            subplot(3,4,9:10), imshow(im), title('Citra Asli'); 
            subplot(3,4,11:12), imshow(RGB), title('Citra Rekonstruksi');
            drawnow;
    end
end

function RGB = rekonstruksi_sampling(Y, Cb, Cr, sb, sk)
         if sb==1 && sk==1                    % jika format video 4:4:4
             iYCbCr=Y;
             iYCbCr(:,:,2)=Cb;
             iYCbCr(:,:,3)=Cr;
             RGB=ycbcr2rgb(iYCbCr);          % konversi YCbCr ke RGB
         elseif sb==1 && sk==2               % jika format video 4:2:2
             iYCbCr=Y;
             iYCbCr(:,1:2:end-1,2)=Cb;       %  komponen Cb: kolom ganjil semua baris = Cb
             iYCbCr(:,2:2:end,2)=Cb;         %  komponen Cb: kolom genap semua baris = Cb
             iYCbCr(:,1:2:end-1,3)=Cr;       %  komponen Cr: kolom ganjil semua baris = Cr
             iYCbCr(:,2:2:end,3)=Cr; ;       %  komponen Cr: kolom genap semua baris = Cr
             RGB=ycbcr2rgb(iYCbCr);          % konversi YCbCr ke RGB
         elseif sb==2 && sk==2               % jika format video 4:2:0
             iYCbCr=Y;
             iYCbCr(1:2:end-1,1:2:end-1,2)=Cb;  %  komponen Cb: baris ganjil dan kolom ganjil = Cb
             iYCbCr(1:2:end-1,2:2:end,2)=Cb;    %  komponen Cb: baris ganjil dan kolom genap = Cb
             iYCbCr(2:2:end,1:2:end-1,2)=Cb;    %  komponen Cb: baris genap dan kolom ganjil = Cb
             iYCbCr(2:2:end,2:2:end,2)=Cb;      %  komponen Cb: baris genap dan kolom genap = Cb
             iYCbCr(1:2:end-1,1:2:end-1,3)=Cr;  %  komponen Cr: baris ganjil dan kolom ganjil = Cr
             iYCbCr(1:2:end-1,2:2:end,3)=Cr;    %  komponen Cr: baris ganjil dan kolom genap = Cr
             iYCbCr(2:2:end,1:2:end-1,3)=Cr;    %  komponen Cr: baris genap dan kolom ganjil = Cr
             iYCbCr(2:2:end,2:2:end,3)=Cr;      %  komponen Cr: baris genap dan kolom genap = Cr
             RGB=ycbcr2rgb(iYCbCr);             % konversi YCbCr ke RGB
         end                                    %  selesai rekonstruksi sub-sampling
    end
                                                
