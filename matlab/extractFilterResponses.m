function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses

% TODO Implement your code here

A=im2double(img);

%%To check if an image is RGB

if size(A,3)~=0
    A=cat(3,A,A,A);
end

% Conversion to L*a*b co-ordinates
I=RGB2Lab(A);
a=false(1, 20);
a=num2cell(a);


%% Extracting Filter Responses
for idx=1:1:20
    a{idx}=imfilter(I,filterBank{idx});
    if(idx==1) 
        filterResponses1=a{idx};
        filterResponses=a{idx};
    end
    if(idx>1)
        filterResponses1=cat(4,filterResponses1,a{idx});
        filterResponses=cat(3,filterResponses,a{idx});
    end
end


%% Montage function for visualizing the responses of a single image
%montage(filterResponses1, 'Size',[4 NaN]);


end



























