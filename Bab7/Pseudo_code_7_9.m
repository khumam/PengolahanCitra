clear all;
Fig=figure(1);
vid = videoinput('winvideo',1,'MJPG_640x480');   % aquisisi video dengan format MJPG_640x480
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                      % mulai akuisisi video
Stop=1;                                          % set kondisi stop akuisisi
se=strel('disk',1)
while (Stop>0)                                   % lakukan loop akusisi hingga kondisi stop=0 
    trigger(vid);                                % akuisisi satu frame
    im= getdata(vid,1);                          % baca data citra dari frame video      
    if  ishandle(Fig)==1                         % jika window tampilan belum ditutup
         imDil= imdilate(im(:,:,1),se);          % dilasi komponen R
         imDil(:,:,2)= imdilate(im(:,:,2),se);   % dilasi komponen G
         imDil(:,:,3)= imdilate(im(:,:,3),se);   % dilasi komponen B
         imEr= imerode(im(:,:,1),se);            % erosi komponen R
         imEr(:,:,2)= imerode(im(:,:,2),se);     % erosi komponen G
         imEr(:,:,3)= imerode(im(:,:,3),se);     % erosi komponen B
         imEdg= abs(imDil-imEr);                 % Tepi morfologi : dilasi - erosi 
        imshow(uint8(imEdg));                    % tampilkan citra hasil deteksi tepi 
        drawnow                                  % update figure window
    else                                         % jika window tampilan sudah ditutup
        Stop=0;                                  % stop loop
    end
end
stop(vid);                                       % stop akuisisi
delete(vid);                                     % hapus semua frame
