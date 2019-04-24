function Video_Wavelet()
Fig1=figure(1); 
vid = videoinput('winvideo',1,'YUY2_320x240');              % aquisisi video format YUY2_320x240
set(vid,'FramesPerTrigger',1);                                                  % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                                                                                          % mulai akuisisi video
Stop=1;                                                                                                       % set kondisi stop akuisisi
while (Stop>0)                                                            % lakukan loop akusisi hingga kondisi stop=0 
    trigger(vid);                                                                                                    % akuisisi satu frame
    YCbCr= getdata(vid,1);                                                             % baca data citra dari frame video  
    if  ishandle(Fig1)==0                                        % jika window tampilan sudah ditutup set Stop=0
       Stop=0; 
    else                                                                       % jika window tampilan belum ditutup lakukan
         [Y, Cb, Cr] = sub_sampling(YCbCr);                                                     %  sub-sampling 4:2:0
         [A1,H1,V1,D1] = Wavelet(Y);                                                             % wavelet komponen Y
         imWavY=[A1/2.0 H1; V1 D1];                                % set tampilan citra wavelet komponen Y
         [A2,H2,V2,D2] = Wavelet(Cb);                                                          % wavelet komponen Cb
         imWavCb=[A2/2.0 H2; V2 D2];                             % set tampilan citra wavelet komponen Cb
         [A3,H3,V3,D3] = Wavelet(Cr);                                                           % wavelet komponen Cr
         imWavCr=[A3/2.0 H3; V3 D3];                             % set tampilan citra wavelet komponen Cr
         imRY = WaveletInvers(A1,H1,V1,D1);                                    % wavelet invers komponen Y
         imRCb = WaveletInvers(A2,H2,V2,D2);                                % wavelet invers komponen Cb
         imRCr = WaveletInvers(A3,H3,V3,D3);                                 % wavelet invers komponen Cr
         imR = rek_sampling(imRY, imRCb, imRCr);                            % rekonstruksi sub-sampling
         Stop=tampil(Fig1,YCbCr, imWavY, imWavCb, imWavCr, imR);     % tampilkan citra hasil
    end
end
stop(vid);                                                                                                                     % stop akuisisi
delete(vid);                                                                                                        % hapus semua frame
clear vid;                                                                                                             % hapus variable vid
end
function [Y, Cb, Cr] = sub_sampling(YCbCr)                                                 % sub-sampling 4:2:0
         Y=YCbCr(:,:,1);                        
         Cb=YCbCr(1:2:end,1:2:end,2);           
         Cr=YCbCr(1:2:end,1:2:end,3);           
end
function [A1,H1,V1,D1] = Wavelet(im)                                                          % wavelet Daubechies
      [A1,H1,V1,D1] = dwt2(im,'db1');      
end
function imR = WaveletInvers(A1,H1,V1,D1)                                     % wavelet invers Daubechies
    imR=idwt2(A1,H1,V1,D1,'db1');
end
function RGB = rek_sampling(Y, Cb, Cr)                                            % rekonstruksi sub-sampling
             iYCbCr=Y;
             iYCbCr(1:2:end-1,1:2:end-1,2)=Cb;
             iYCbCr(1:2:end-1,2:2:end,2)=Cb;
             iYCbCr(2:2:end,1:2:end-1,2)=Cb;
             iYCbCr(2:2:end,2:2:end,2)=Cb;
             iYCbCr(1:2:end-1,1:2:end-1,3)=Cr;
             iYCbCr(1:2:end-1,2:2:end,3)=Cr;
             iYCbCr(2:2:end,1:2:end-1,3)=Cr;
             iYCbCr(2:2:end,2:2:end,3)=Cr;
             RGB=ycbcr2rgb(uint8(iYCbCr));
end
function Stop = tampil(Fig1, YCbCr, imWavY, imWavCb, imWavCr, imR)
Stop=1;
    if  ishandle(Fig1)==0                                     % jika window tampilan sudah ditutup, set Stop=0
       Stop=0; 
    else                                                                      % jika window tampilan belum ditutup lakukan
         subplot(2,4,1:2), imshow(uint8(abs(imWavY))), title('Komponen Y'); 
         subplot(2,4,3), imshow(uint8(abs(imWavCb))), title('Komponen Cb');
         subplot(2,4,4), imshow(uint8(abs(imWavCr))), title('Komponen Cr'); 
         subplot(2,4,5:6), imshow(YCbCr), title('Citra Asli YCbCr'); 
         subplot(2,4,7:8), imshow(uint8(imR)), title('Citra RGB Rekonstruksi');
         truesize;
         drawnow;
    end
end
