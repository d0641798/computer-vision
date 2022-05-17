allData=imageDatastore('data','IncludeSubfolders',true,'LabelSource','foldernames')
layers=[
    imageInputLayer([400 400 3])
    convolution2dLayer([5 5],10)
    reluLayer
    maxPooling2dLayer(5,'Stride',5)
    convolution2dLayer([3 3],10)
    reluLayer
    maxPooling2dLayer(5,'Stride',3)
    fullyConnectedLayer(200)
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer
];
[imds60,imds40]=splitEachLabel(allData,0.6,'randomized');
opts=trainingOptions('adam','InitialLearnRate',0.0011,'MaxEpochs',50,'MiniBatchSize',8,'Plots','training-progress','ValidationData',imds40);
myNet=trainNetwork(imds60,layers,opts);
desiredLabel=imds40.Labels;
predictedLabel=classify(myNet,imds40);
accuracy=mean(desiredLabel==predictedLabel);
confMat=confusionmat(desiredLabel,predictedLabel)
accuracy=sum(diag(confMat))/sum(confMat(:))

for i=1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(i,:));
end

for i=1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(:,i));
end

F1=(2.*precision.*recall)/(precision+recall)

act_1=activations(myNet,imds40,'fc_1');
input_ANN=reshape(act_1,length(desiredLabel),[]);
label_ANN=double(desiredLabel)-1;
DATA=cat(2,input_ANN,label_ANN);






