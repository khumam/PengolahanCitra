clear all;
Fig=figure(1);
faceDetector = vision.CascadeObjectDetector();       % defenisikan fungsi detektor
vid = videoinput('winvideo',1,'MJPG_320x240');       % aquisisi video 
set(vid,'FramesPerTrigger',1);                       % set jumlah frame per diakuisisi: 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                          % mulai akuisisi video
 Nframe=30
for k=1: Nframe
    trigger(vid);
    im= getdata(vid,1);
    bbox = step(faceDetector,im);                                    % deteksi wajah dan posisinya
    videoOut = insertObjectAnnotation(im,'rectangle',bbox,'Face');   % beri bingkai pada wajah
    imshow(uint8(videoOut));
    drawnow                                                          % update figure window
end
stop(vid);
delete(vid);
clear vid; 
