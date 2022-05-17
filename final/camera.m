webcamlist;
cam=webcam(1);
model = load('model.mat');
detector = model.detector;

while 1
    pause(3) 
    img=snapshot(cam);
    figure,imshow(img);
    [bboxes,scores,labels]=detect(detector,img);    
    count=0
    for i =1:size(scores)
        if scores(i)>0.5 %預測結果大於這個信心值才計算
            count=count+1;
            scores(i);
        end
    end
    if count>0
        I=insertObjectAnnotation(img,'rectangle',bboxes,scores);
        figure,imshow(I)
        pause(15)        
        data=timetable(datetime,count);
        thingSpeakWrite(1615763,data,'WriteKey','JZMEONZXZLIQCF4H')
    end
end





