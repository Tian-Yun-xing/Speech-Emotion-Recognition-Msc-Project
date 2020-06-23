MAIN
Yunxing Tian的Msc projcet，Speech Emotion Recognition对应代码

注意，使用RAVDESS需使用已经经由RAVDESS_fs_16000工具转换过的database：RAVDESS_16000

%%-------------------------------------------------------------------------
creat_datastore_fit_type    : 从原有的datastore中创建一个符合我想要的特征（如只有高兴）的datastore
type_ds = creat_datastore_fit_type(audio_ds,type_location,Var0, Var1, Var2, Var3, Var4, Var5, Var6, Var7, Var8, Var9)
audio_ds是原来的datastore
type_location是文件名中表现我想要的特征的地方，从.wav向前数，第一个是0，第二个是1以此类推
Var0-Var9是需要的特征的代号(文件名中的)，注意使用字符(如'1')，注意，需要几种特征，就用几个Var，不用的请填上nan
example:
type_FN_ds = creat_datastore_fit_type(audio_ds,1,'F','N',nan,nan,nan,nan,nan,nan,nan,nan);      % try happy (F) + nutural (N)

type_a01_ds = creat_datastore_fit_type(audio_ds,4,'a',nan,nan,nan,nan,nan,nan,nan,nan,nan);     % try a01 (lyris is The tablecloth is lying on the frigde.)
type_a01_ds = creat_datastore_fit_type(type_a01_ds,3,'0',nan,nan,nan,nan,nan,nan,nan,nan,nan);  % try a01
type_a01_ds = creat_datastore_fit_type(type_a01_ds,2,'1',nan,nan,nan,nan,nan,nan,nan,nan,nan);  % try a01

%%-------------------------------------------------------------------------
put_emotion_labels          : 将datastore加上对应的情绪标签
function audio_ds = put_emotion_labels(audio_ds)
仅仅适用于EDMOB和RAVDESS
%%-------------------------------------------------------------------------
feature_extraction          : 提取音频文件的feature
function [audio_feature,info_out]= feature_extraction(audio_in, info_in, aFE)       
aFE 为外部指定，他可以决定提取哪些特征
%%-------------------------------------------------------------------------
creat_feature_label         : 创建一系列对应feature_extraction输出的表格每一列的标签，写明这一列是对应的哪种feature
feature_label = creat_feature_label(aFE)
aFE 为外部指定
