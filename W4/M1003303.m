dog_1=imread('Images\dog_1.jpg');
tree_1=imread('Images\tree_1.jpg');
car_1=imread('Images\car_1.jpg');

dog_1=rgb2gray(dog_1);
dog_1_features=extractLBPFeatures(dog_1);

tree_1=rgb2gray(tree_1);
tree_1_features=extractLBPFeatures(tree_1);

car_1=rgb2gray(car_1);
car_1_features=extractLBPFeatures(car_1);

for i=1:3
    temp=['test_',int2str(i)];
    test=imread(['Images\',temp,'.jpg']);
    test=rgb2gray(test);
    test_features=extractLBPFeatures(test);
    distance_dog=(dog_1_features-test_features).^2;
    distance_tree=(tree_1_features-test_features).^2;
    distance_car=(car_1_features-test_features).^2;

    if min([sum(distance_dog),sum(distance_tree),sum(distance_car)])==sum(distance_dog)
        disp([temp,'像狗啦~~'])
        disp(['狗 : ',num2str(sum(distance_dog))])
        disp(['樹 : ',num2str(sum(distance_tree))])
        disp(['車 : ',num2str(sum(distance_car))])
    elseif min([sum(distance_dog),sum(distance_tree),sum(distance_car)])==sum(distance_tree)
        disp([temp,'像樹啦~~'])
        disp(['狗 : ',num2str(sum(distance_dog))])
        disp(['樹 : ',num2str(sum(distance_tree))])
        disp(['車 : ',num2str(sum(distance_car))])
    else
        disp([temp,'像車子啦~~'])
        disp(['狗 : ',num2str(sum(distance_dog))])
        disp(['樹 : ',num2str(sum(distance_tree))])
        disp(['車 : ',num2str(sum(distance_car))])
    end
 end


