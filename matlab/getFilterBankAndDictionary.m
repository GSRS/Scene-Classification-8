function [filterBank, Dictionary] = getFilterBankAndDictionary(train_imagenames)

% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

%%Filter Bank Calling and Creation%%
[filterBank]=createFilterBank();

alpha=200;

%%ADDING WAITBAR
h=waitbar(0,'Processing');


%% Extracting filter Responses by calling extractfilterresponse.m function
%% for training images
AlphaFilterResponses(:,:)=zeros(length(train_imagenames)*alpha,60);
for i=1:1:length(train_imagenames)
    p=imread(train_imagenames{i});
    [filterResponses]=extractFilterResponses(p,filterBank);
    [filterResponses]=reshape(filterResponses,[],60);
    [x,~]=size(filterResponses);
    
    %% Choosing ALPHA = 50 randomg pixels - X and Y co-ordinates and extracting the pixels withing the loop
    X=randperm(x,alpha);
    for idx=1:1:60
        
        for j=1:1:alpha %for every pixel
            AlphaFilterResponses(((i-1)*alpha)+j,idx)=filterResponses(X(j),idx);
        end
        waitbar((i*10000+idx*100)/(length(train_imagenames)*10000+6000));
      
        
    end
    
end
delete(h);

%% Variable is copied so that original variable is unaffected in case of error and can be used again
BetaFilterResponses=AlphaFilterResponses;

feat=BetaFilterResponses;

[~,Dictionary]=kmeans(feat,250);
Dictionary=Dictionary';


end

