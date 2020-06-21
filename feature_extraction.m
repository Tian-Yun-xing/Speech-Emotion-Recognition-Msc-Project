function [audio_feature,info_out]= feature_extraction(audio_in, info_in)        % A function can extract feature automatically
    
    aFE = audioFeatureExtractor( ...                % ask the MATLAB help to extract features:
        "SampleRate", info_in.SampleRate, ...       % that is for EMODB, fs = 16000
        "pitch",true, ...                           % pitch
        "harmonicRatio",true, ...                   % harmonic Ratio
        "mfcc",true, ...
        "mfccDelta", true ...
        );
    audio_feature = extract(aFE,audio_in);
    audio_feature = num2cell(audio_feature);
    audio_feature(:,length(audio_feature(1,:))+1) = info_in.Label(1);
    info_out = info_in;
end