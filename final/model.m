
imgTrain=imageDatastore('train_resized','IncludeSubfolders',true,'LabelSource','foldernames');

train_data=load('train_resized\train_label.mat');
trainingData=objectDetectorTrainingData(train_data.gTruth);
layers='vgg19';

options=trainingOptions('adam','MaxEpochs',50,'MiniBatchSize',4,'InitialLearnRate',0.0001);
detector=trainFasterRCNNObjectDetector(trainingData,layers,options);

save('model.mat','detector')

