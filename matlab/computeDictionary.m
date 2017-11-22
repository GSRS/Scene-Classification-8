function computeDictionary()
% Computes filter bank and dictionary, and saves it in dictionary.mat 
clc;
close all;
clear ;

	load('../data/traintest.mat'); 
    
	[filterBank,Dictionary] = getFilterBankAndDictionary(strcat(('/Users/muthuvel/Documents/MATLAB/Hw1/Assignment 2/data/'),train_imagenames));

	save('Dictionary.mat','filterBank','Dictionary'); 

end
