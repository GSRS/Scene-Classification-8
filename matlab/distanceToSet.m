function histInter = distanceToSet(wordHist, histograms)
% Compute distance between a histogram of visual words with all training image histograms.
% Inputs:
% 	wordHist: visual word histogram - K * (4^(L+1) − 1 / 3) × 1 vector
% 	histograms: matrix containing T features from T training images - K * (4^(L+1) − 1 / 3) × T matrix
% Output:
% 	histInter: histogram intersection similarity between wordHist and each training sample as a 1 × T vector

	% TODO Implement your code here
    
%% Some variables  to check the function before moving to next step
%histograms=[2 2 2 2 2; 3 1 3 3 3;1 1 1 1 1;5 5 5 5 5;4 4 4 4 4];
%wordHist= [1 2 3 4 5]'; 



%% Making copies of wordhist using repmat command

[w,h]=size(histograms);  
inter=repmat(wordHist,1,h); 

%% Pre allocation
histInter=zeros(size(histograms));

%% To calcualte minimum values 
for i=1:1:w
    histInter(i,:)=min(inter(i,:),histograms(i,:));
end

%% Adds all the rows respectively
histInter=sum(histInter);

%% Normalization
histInter=histInter/sum(histInter);
end