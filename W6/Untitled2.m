inputPath='C:\Users\User\Desktop\computer_vision\W6_3\test\bird\';
outputPath='C:\Users\User\Desktop\computer_vision\W6_3\test\bird_resized\';


if ~exist(outputPath)
    mkdir(outputPath)
end

files=dir(inputPath);
disp(inputPath)
for i =3:length(files)
    pic_name=files(i).name;
    
    pic= imread([inputPath,pic_name]);
    pic_resized=imresize(pic,[400,400]);
    imwrite(pic_resized,[outputPath,pic_name]);
    
end