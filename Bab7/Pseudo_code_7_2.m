clear all;
clear vid;                                       % stop akuisisi
figure(1);
vid = videoinput('winvideo',1,'MJPG_640x480');   % aquisisi video dengan format MJPG_640x480
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                      % mulai akuisisi video
Nf=30;                                           % set jumlah frame
for i=1:Nf                                       % loop akuisisi Nf kali 
    trigger(vid);                                % akuisisi satu frame
    im= getdata(vid,1);                          % baca data citra dari frame video
    imshow(im);                                  % tampilkan citra
    drawnow                                      % update figure window
end
stop(vid);                                       % stop akuisisi
delete(vid);                                                                                                         