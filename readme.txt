MAIN

注意，使用RAVDESS时候，需要改变feature extraction中的fs
如果一起用，最好将RAVDESS预处理，压缩成16000HZ

%%-------------------------------------------------------------------------
creat_datastore_fit_type    : 从原有的datastore中创建一个符合我想要的特征（如只有高兴）的datastore
type_ds = creat_datastore_fit_type(audio_ds,type_location,Var0, Var1, Var2, Var3, Var4, Var5, Var6, Var7, Var8, Var9)
audio_ds是原来的datastore
type_location是文件名中表现我想要的特征的地方，从.wav向前数，第一个是0，第二个是1以此类推
Var0-Var9是需要的特征的代号，注意使用字符(如'1')，注意，需要几种特征，就用几个Var，不用的请填上nan
%%-------------------------------------------------------------------------
put_emotion_labels          : 将datastore加上对应的情绪标签
function audio_ds = put_emotion_labels(audio_ds)
适用于EDMOB和RAVDESS
%%-------------------------------------------------------------------------