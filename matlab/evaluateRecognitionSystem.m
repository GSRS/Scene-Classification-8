%function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix
    
	load('vision.mat');
	load('../data/traintest.mat');
    
    %% Declare confusion matrix
    conf=zeros(8,8);
    
    %% Wait bar for checking progress
    h=waitbar(0,'Please  Wait.... LOADINGGG.....!!');
    
    %% Test images are passed to guess image fucntion and the output after checking with labels are effected on confusion matrix respectively(value incremented by 1)
    for i=1:1:160
        a=test_labels(i);
        guessedImage=guessImage(test_imagenames{i});
        [~,y]=find(contains(mapping,guessedImage));
        conf(a,y)=conf(a,y)+1; %% (Respective value incresed by 1)
        fprintf('%d',i);
        waitbar(i/length(test_imagenames));
        
        % Efficiency percentage calculation
        Efficiency_Percent=trace(conf)/sum(conf(:))*100;
    end
    

%end