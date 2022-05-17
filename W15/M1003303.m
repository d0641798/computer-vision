load('bird\train_gTruth.mat')
options=trainingOptions('adam','MaxEpochs',10,'MiniBatchSize',1,'InitialLearnRate',0.0001);
layers=deeplabv3plusLayers([400 400],2,"resnet18");
trainData=pixelLabelImageDatastore(gTruth);
myNet=trainNetwork(trainData,layers,options);

testImage=imageDatastore('bird_test');

test_data=load('bird_test\test_gTruth.mat')
desired=pixelLabelDatastore(test_data.gTruth);
predicted=semanticseg(testImage,myNet);


metrics=evaluateSemanticSegmentation(predicted,desired);
metrics.ClassMetrics

heatmap(["back" "bird"],["back" "bird"],metrics.ConfusionMatrix.Variables)
total_pixel=0;
total_predicted_correct=0;

for i=1:5

    x=labeloverlay(readimage(testImage,i),readimage(predicted,i));
    true=readimage(desired,i) == readimage(predicted,i);%預測的值跟label比較 一樣的話為1
    true_pixel=size(true(true==1));%取出 '1'的數量 [1的數量,1]
    true_pixel=true_pixel(1);%取[1的數量,1]的第一個元素
    y=readimage(desired,i)=='bird';
    ori=readimage(testImage,i); %原始圖
    lengthandwidth=size(readimage(desired,i));% 拿圖片的長寬
    total=lengthandwidth(1)*lengthandwidth(2);%算總pixel數
    total_pixel=total_pixel+total; %這張圖片的pixel數跟前面全部相加
    total_predicted_correct=total_predicted_correct+true_pixel; %這張圖片的pixel數跟前面全部相加
    
    y_to_unit8=zeros(400,400,3,'uint8');
    for row=1:400
        for col=1:400
            if y(row,col)==0
                y_to_unit8(row,col,1)=0;
                y_to_unit8(row,col,2)=0;
                y_to_unit8(row,col,3)=0;         
            else
                y_to_unit8(row,col,1)=255;
                y_to_unit8(row,col,2)=255;
                y_to_unit8(row,col,3)=255;
            end
        
        end
    end
    c=[ori,x,y_to_unit8];
    figure,imshow(c)
end
acc=total_predicted_correct/total_pixel
