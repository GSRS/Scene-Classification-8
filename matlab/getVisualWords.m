function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)
clc

    % TODO Implement your code here

%end
%img=imread('sun_test.jpg');
%load Dictionary.mat;
%dictionary=Dictionary;
%[x,y,~]=size(img);
dictionary=dictionary';

%Dictionary=dictionary;

filterResponses=extractFilterResponses(img,filterBank);
filterResponses=reshape(filterResponses,[],60);

[A,B,~]=size(img);
%[x,y,z]=size(img);
[x,~]=size(filterResponses);

wordmap=zeros(0,x);
for i=1:1:x
    a=pdist2(filterResponses(i,:),dictionary);
    [~,I]=min(a);
    wordmap(i)=I;
    
end
wordMap=reshape(wordmap,A,B);

%[wordMap]=pdist2(filterResponses,Dictionary);


%wordMap=reshape(wordmap,x,y,[]);
%imagesc(wordMap);



end