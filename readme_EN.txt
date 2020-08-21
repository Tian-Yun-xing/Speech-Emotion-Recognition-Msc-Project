MAIN part:
code for Yunxing Tian's 
Msc project, Human Robot Interaction - Speech Emotion Recognition

Note that, EMODB, SAVEE, RAVDESS databases are used and they are free and available online
for making the sample rate the same, RAVDESS and SAVEE should be compressed to 16000HZ, it can be done by the code provided in the tools folder

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Functions:

%%-------------------------------------------------------------------------

creat_datastore_fit_type    : create a special dataset fit the experiment aim (dataset includes specific emotions)

function:
type_ds = creat_datastore_fit_type(audio_ds,type_location,Var0, Var1, Var2, Var3, Var4, Var5, Var6, Var7, Var8, Var9)

input arguments:
audio_ds: the original datastore
type_location: the location in the filename which can represent the characterise. Count backward from '.' in '.wav', the first digit is zero, the second digit is 1 and so on
Var0-Var9 is the code of the required characteristic (in the file name). NOTE: use char eg '1' not 1 NOTE, use X characteristices  then use X vars, others use nan

output:
datastore fit the goal

example1:
type_FN_ds = creat_datastore_fit_type(audio_ds,1,'F','N',nan,nan,nan,nan,nan,nan,nan,nan);      % try happy (F) + nutural (N)
example2:
type_a01_ds = creat_datastore_fit_type(audio_ds,4,'a',nan,nan,nan,nan,nan,nan,nan,nan,nan);       % try a01 (lyris is The tablecloth is lying on the frigde.)
type_a01_ds = creat_datastore_fit_type(type_a01_ds,3,'0',nan,nan,nan,nan,nan,nan,nan,nan,nan);  % try a01
type_a01_ds = creat_datastore_fit_type(type_a01_ds,2,'1',nan,nan,nan,nan,nan,nan,nan,nan,nan);  % try a01

%%-------------------------------------------------------------------------

put_emotion_labels          : put emotion labels in the datastore

function:
audio_ds = put_emotion_labels(audio_ds)

input arguments:
datastore without emotion labels

output:
datastore with emotion labels 

NOTE: just for EMODB, RAVDESS and SAVEE (after my SAVEE_16000 compress code)

%%-------------------------------------------------------------------------

feature_extraction          : automatically extract the features 

function:
[audio_feature,info_out]= feature_extraction(audio_in, info_in, aFE)   

input arguments:
audio_in: the audio 
info_in: it is the information of the audio, it can be get automatically when the audio is read from the datastore
aFE: a structure that indicates which features should be extracted, see the main code, it will show how to set it
aFE also can be set by using feature extraction tool in my tool folder

output:
info_out: can be ignored
audio_feature: it is the feature table (with corresponding emotions)

%%-------------------------------------------------------------------------

feature_extraction_voicing         : same as feature_extraction function but use some method to ignore frames with fs>1000Hz and with energy <-50dB

%%-------------------------------------------------------------------------

creat_feature_label         : for an aFE structure, find out what features can be got (This is a function to create the head for the feature table)

function:
feature_label = creat_feature_label(aFE)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Tools:

%%-------------------------------------------------------------------------

RAVDESS_fs_16000.mlx and SAVEE_fs_16000

In order to control the variables in the experiment, the sample rate of each database should be unified. Take the smallest fs EMODB), 16000HZ as the benchmark.
The RAVDESS and SAVEE database should be compressed. These two tools can change the fs of two databases downloaded online to 16000Hz

%%-------------------------------------------------------------------------
  
Get_database_info

It is a tool that can visually shows the basic info of an database (eg EMODB, RAVDESS...)
It can shows how many audio files in the database
how many emotions
how many audios for each emotion
And a Pie chart of each emotions

%%-------------------------------------------------------------------------

feature_table_info

After feature extraction, a table is generated. This tool can help you find out, for each emotion, how many frames (lines) are there in your table. 

%%-------------------------------------------------------------------------

Feature_extractor

Through the visual operation on the control panel, help you set the feature extraction parameters (aFE) you needed in your main function