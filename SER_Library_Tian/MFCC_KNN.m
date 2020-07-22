function [mdl] = MFCC_KNN(audio_ds,fs,MFCC_Coe,frame_length_sec,overlap_percentage)
%% Documentation
% This fuction is for traing models by KNN and gives its accuracy by K folder validation
% the KNN is using the parameter as (same as Changrui's work):
%   k = 5
%   Euclidean
%   weight: inverse squared
%   Not normalized (because the normalization is done in the first part of the code)
% the Validation take 5 folder
%
% the Fuction's input is:
%   audio_ds is the datastore for the database you chose
%   fs is the sample frequency of the database you chose
%   MFCC_Coe is how many coe num you want, it is a good choice to set it as 13
%   frame_length_sec is the frame size you chose in seconds (NOT ms)
%   overlap_percentage is the overlap you want in percentage (eg. 75% overlap means overlap_percentage = 0.75)
%
% the Function's output is:
% mdl is the model, you can use it then by predict function
% validationAccuracy is the model's accuracy by 5 folder cross validation
%% Feature Extraction
% Set the feature extraction parameter
aFE = audioFeatureExtractor( ...             % ask the MATLAB help to extract features with parameters:
    "SampleRate", fs, ...                    
    "Window",hamming(round(frame_length_sec*fs),"periodic"), ...
    "OverlapLength",round(frame_length_sec*(1-overlap_percentage)*fs), ...
    "mfcc",true ...                          % require MFCC as features
    );
setExtractorParams(aFE,"mfcc","NumCoeffs",MFCC_Coe);    % set MFCC coe numbers
feature_label = creat_feature_label(aFE);               % create a label for what features did we chose

% feature extraction
feature_ds = transform(audio_ds,@(audio_in, info_in) feature_extraction_voicing(audio_in, info_in, aFE), "IncludeInfo",true);           % automatic feature extraction
feature = readall(feature_ds);  
% put feature labels on the result table from the previous step (For easy observation)
feature = cell2table(feature);
feature.Properties.VariableNames = feature_label;
feature.Emotion = categorical(feature.Emotion);
% normalization
Normalize_features = table2array(feature(:,1:end-1));
m = mean(Normalize_features);
s = std(Normalize_features);
Normalize_features = (Normalize_features-m)./s;
feature(:,1:end-1) = array2table(Normalize_features);
%% Training the model and validation
% prepare for training
inputTable = feature;
predictors = inputTable(:, 1:end-1);
response = inputTable.Emotion;
% the Model, the KNN parameters can be adjusted here
mdl = fitcknn(...
    predictors, ...
    response, ...
    'Distance', 'Euclidean', ...
    'Exponent', [], ...
    'NumNeighbors', 5, ...
    'DistanceWeight', 'SquaredInverse', ...
    'Standardize', false, ...
    'ClassNames', unique(feature.Emotion));
% Validation
%{
partitionedModel = crossval(mdl, 'KFold', 5);
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
%}
end