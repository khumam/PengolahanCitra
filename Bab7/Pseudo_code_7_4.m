clear all;
figure(1);
vid = videoinput('winvideo',1,'MJPG_320x240');   % aquisisi video dengan format MJPG_320x240
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                      % mulai akuisisi video
for k=1:2                                        % loop akuisisi 25 kali 
    trigger(vid);                                % akuisisi satu frame
    im= getdata(vid,1);                          % baca data citra dari frame video
    imshow(im);                                  % tampilkan citra
    drawnow                                      % update figure window
    savename = strcat('image_' ,num2str(k), '.png');      % set nama file “image_k” dalam format png
    imwrite(im, savename);                       % save citra pada file image_k
end
stop(vid);                                       % stop akuisisi
delete(vid);                                     % hapus semua frame
