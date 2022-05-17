trainData=imageDatastore('train','IncludeSubfolders',true,'LabelSource','foldernames');
testData=imageDatastore('test','IncludeSubfolders',true,'LabelSource','foldernames');
net=darknet19;
layers=[
    imageInputLayer([400 400 3])  
    net.Layers(2:end-3); 
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];
opts=trainingOptions('adam','InitialLearnRate',0.0001,'MaxEpochs',10,'MiniBatchSize',4,'Plots','training-progress');
myNet=trainNetwork(trainData,layers,opts);
desiredLabel=testData.Labels;
predictedLabel=classify(myNet,testData);
accuracy=mean(desiredLabel==predictedLabel)
confMat=confusionmat(desiredLabel,predictedLabel)
for i=1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(i,:));
end
for i=1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(:,i));
end
precision
recall
F1=(2.*precision.*recall)/(precision+recall)


