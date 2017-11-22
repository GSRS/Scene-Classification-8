function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('Dictionary.mat');
	load('../data/traintest.mat');

	% TODO create train_features
    layerNum=2;
    [~,dictionarySize]=size(Dictionary);
    wordmap=strrep(train_imagenames,'.jpg','.mat');
 
    %% Loop to pass all the word maps to extract features by one
    for i=1:1:length(train_labels)
        a=wordmap{i,1};
        
        FileName   = a;
        FolderName = '../data/';
        File       = fullfile(FolderName, FileName);
        load(File)   % not: load('File')
        c=getImageFeaturesSPM(layerNum,wordMap,dictionarySize);
        if (i==1)
            train_features=c;
        end
        if (i>1)
            train_features=cat(2,train_features,c); % Train features contain all the histograms
        end
        fprintf("\n%d",i);
    end
   
   
    %% Save all the files and create vision.mat
	save('vision.mat', 'filterBank', 'Dictionary', 'train_features', 'train_labels');

end