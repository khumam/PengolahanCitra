                   %%  Akuisisi video, segmentasi dan visualisasi  %%
clear all;
Fig=figure(1);
vid = videoinput('winvideo',1,'MJPG_320x240');   % aquisisi video 
set(vid,'FramesPerTrigger',1);                   % set jumlah frame per akuisisi
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                      % mulai akuisisi video
trigger(vid);
im= getdata(vid,1);
imshow(uint8(im));
p = impoint(gca,[]);                    % pembacaan posisi pixel
p = wait(p);                            % klik 2 kali pada warna area objek
x=round(p(1,1));                        % posisi x,y  pixel yang di klik
y=round(p(1,2));
Wref=double(im(y,x,:));                 % warna ref. pixel yang di klik
Th=47;                                  % tentukan nilai threshold
Nframe=10;
for k=1:Nframe                          % akuisisi frame selama Nframe 
    trigger(vid);                       % akuisisi frame ke k
    im= double(getdata(vid,1));         % data frame ke citra
%     Im=Segm_RGBpixel(im,Wref,Th);     % segmentasi dengan ruang RGB
%     imshow(uint8(Im));                % tampilkan hasilnya
%     drawnow                           % update figure window
    Im=Segm_HCLpixel(im,Wref,Th);       % segmentasi dengan ruang HCL
    imshow(uint8(Im));                  % tampilkan hasilnya
    drawnow                             % update figure window
end
stop(vid);
delete(vid);
clear vid;   
