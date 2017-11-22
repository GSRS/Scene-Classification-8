function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    
    


[x,y]=size(wordMap);


%% Segmentaion of word Map into 16 cells - Layer 2

%remainder==0
if rem(x,4)==0
    if rem(y,4)==0
        Layer3wordMap=mat2cell(wordMap,[x/4, x/4, x/4, x/4],[y/4, y/4, y/4, y/4]);
    end
    if rem(y-3,4)==0
        Layer3wordMap=mat2cell(wordMap,[x/4, x/4, x/4, x/4],[(y+1)/4, (y+1)/4, (y+1)/4, (y-3)/4]);
    end
    if rem(y-2,4)==0
        Layer3wordMap=mat2cell(wordMap,[x/4, x/4, x/4, x/4],[(y+2)/4, (y+2)/4, (y-2)/4, (y-2)/4]);
    end
    if rem(y-1,4)==0
        Layer3wordMap=mat2cell(wordMap,[x/4, x/4, x/4, x/4],[(y-1)/4, (y-1)/4, (y-1)/4, (y+3)/4]);
    end
end

%remainder==1
if rem(x+3,4)==0
    if rem(y,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x-1)/4, (x-1)/4, (x-1)/4, (x+3)/4],[y/4, y/4, y/4, y/4]);
    end
    if rem(y-3,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x-1)/4, (x-1)/4, (x-1)/4, (x+3)/4],[(y+1)/4, (y+1)/4, (y+1)/4, (y-3)/4]);
    end
    if rem(y-2,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x-1)/4, (x-1)/4, (x-1)/4, (x+3)/4],[(y+2)/4, (y+2)/4, (y-2)/4, (y-2)/4]);
    end
    if rem(y-1,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x-1)/4, (x-1)/4, (x-1)/4, (x+3)/4],[(y-1)/4, (y-1)/4, (y-1)/4, (y+3)/4]);
    end
end

%remainder=2
if rem(x+2,4)==0
    if rem(y,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+2)/4, (x+2)/4, (x-2)/4, (x-2)/4],[y/4, y/4, y/4, y/4]);
    end
    if rem(y-3,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+2)/4, (x+2)/4, (x-2)/4, (x-2)/4],[(y+1)/4, (y+1)/4, (y+1)/4, (y-3)/4]);
    end
    if rem(y-2,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+2)/4, (x+2)/4, (x-2)/4, (x-2)/4],[(y+2)/4, (y+2)/4, (y-2)/4, (y-2)/4]);
    end
    if rem(y-1,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+2)/4, (x+2)/4, (x-2)/4, (x-2)/4],[(y-1)/4, (y-1)/4, (y-1)/4, (y+3)/4]);
    end
end

%remainder=3
if rem(x+1,4)==0
    if rem(y,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+1)/4, (x+1)/4, (x+1)/4, (x-3)/4],[y/4, y/4, y/4, y/4]);
    end
    if rem(y-3,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+1)/4, (x+1)/4, (x+1)/4, (x-3)/4],[(y+1)/4, (y+1)/4, (y+1)/4, (y-3)/4]);
    end
    if rem(y-2,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+1)/4, (x+1)/4, (x+1)/4, (x-3)/4],[(y+2)/4, (y+2)/4, (y-2)/4, (y-2)/4]);
    end
    if rem(y-1,4)==0
        Layer3wordMap=mat2cell(wordMap,[(x+1)/4, (x+1)/4, (x+1)/4, (x-3)/4],[(y-1)/4, (y-1)/4, (y-1)/4, (y+3)/4]);
    end
end







%% Statements to calculate individual histogram of cells and concatenate
%a=zeros(1,dictionarySize);

for i=1:1:4
    for j=1:1:4
       wordmap=Layer3wordMap{i,j};
       h=histcounts(wordmap,dictionarySize);
       if (i==1)
           if (j==1)
               atest=h;
               continue;
           end
       end
       atest=cat(1,atest,h);
    end
end


%% Segmenation in 4 cells - Layer 1
if rem(x,2)==0
    if rem(y,2)==0
        Layer3wordMap=mat2cell(wordMap,[x/2, x/2],[y/2, y/2]);
    end
    if rem(y+1,2)==0
        Layer3wordMap=mat2cell(wordMap,[x/2, x/2],[(y+1)/2, (y-1)/2]);
    end
end
if rem(x+1,2)==0
    if rem(y,2)==0
        Layer3wordMap=mat2cell(wordMap,[(x+1)/2, (x-1)/2],[y/2, y/2]);
    end
    if rem(y+1,2)==0
        Layer3wordMap=mat2cell(wordMap,[(x+1)/2, (x-1)/2],[(y+1)/2, (y-1)/2]);
    end
end


%% Histogram for Layer 1
%a=zeros(1,dictionarySize);
for i=1:1:2
    for j=1:1:2
       wordmap=Layer3wordMap{i,j};
       h=histcounts(wordmap,dictionarySize);
       
 
       if (i==1)
           if (j==1)
               atest1=h;
               continue;
           end
       end
       atest1=cat(1,atest1,h);
    end
end


%% Histogram for Layer 0
wordMap1=reshape(wordMap,[],1);
a=histcounts(wordMap1,dictionarySize);

atest2 = a;

%% Transposing all variables
atest2=atest2';
atest=atest';
atest1=atest1';




%% Concatenation of all histogram layers - 0,1 and 2
h=cat(2,atest2*1/4,atest1*1/4,atest*1/2);
h=reshape(h,[],1);

%% Histogram normalization
h=h/sum(h);

% Command for visulizing histogram
%bar(h)

end