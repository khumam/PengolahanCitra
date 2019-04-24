clear all;
figure(1);
global movie name vid;
vid = videoinput('winvideo',1,'MJPG_320x240');   % aquisisi video dengan format MJPG_320x240
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);                   % set akuisisi video secara berulang
triggerconfig(vid, 'Manual');
name = 'Cuplikan_Video';                        % set nama file 
 movie=avifile(name,'compression','none');       % set var. movie sebagai file AVI tanpa compresi
start(vid);                                      % mulai akuisisi video
Nf=25;
for k=1:Nf                                       % loop akuisisi Nf kali 
    trigger(vid);                                % akuisisi satu frame
    im= getdata(vid,1);                          % baca data citra dari frame video
    imshow(im);                                  % tampilkan citra
    drawnow                                      % update figure window
    movie=addframe(movie,im);                    % tambahkan frame citra kedalam file AVI
end
stop(vid);                                       % stop akuisisi
delete(vid);  clear vid;                         % hapus semua frame dan hapus variable vid
movie=close(movie);                              % tutup file AVI
