
imgTrain=imageDatastore('bird','IncludeSubfolders',true,'LabelSource','foldernames');

train_data=load('bird\train_bird_label.mat');
trainingData=objectDetectorTrainingData(train_data.gTruth);
layers='vgg16';

options=trainingOptions('adam','MaxEpochs',10,'MiniBatchSize',1,'InitialLearnRate',0.0001);
detector=trainFasterRCNNObjectDetector(trainingData,layers,options);

test_data=load('bird_test\test_bird_label.mat');
testingData=objectDetectorTrainingData(test_data.gTruth);
overlapRatio=[];
for i=1:size(testingData,1)
    
    img=imread(testingData.imageFilename{i});
    bbox_g=testingData.bird{i};
    [bboxes,scores,labels]=detect(detector,img);
    if ~isempty(bboxes)
        temp_overlapRatio=bboxOverlapRatio(bboxes,bbox_g);
        temp_overlapRatio(temp_overlapRatio==0)=[];
        overlapRatio(i)=mean(temp_overlapRatio(:))
        I=insertObjectAnnotation(img,'rectangle',bboxes,scores);
        figure,imshow(I)
    else
        overlapRatio(i)=0;
        figure,imshow(image)
    end
end