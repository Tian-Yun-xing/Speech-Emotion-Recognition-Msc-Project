MAIN
Yunxing Tian��Msc projcet��Speech Emotion Recognition��Ӧ����

ע�⣬ʹ��RAVDESS��ʹ���Ѿ�����RAVDESS_fs_16000����ת������database��RAVDESS_16000

%%-------------------------------------------------------------------------
creat_datastore_fit_type    : ��ԭ�е�datastore�д���һ����������Ҫ����������ֻ�и��ˣ���datastore
type_ds = creat_datastore_fit_type(audio_ds,type_location,Var0, Var1, Var2, Var3, Var4, Var5, Var6, Var7, Var8, Var9)
audio_ds��ԭ����datastore
type_location���ļ����б�������Ҫ�������ĵط�����.wav��ǰ������һ����0���ڶ�����1�Դ�����
Var0-Var9����Ҫ�������Ĵ���(�ļ����е�)��ע��ʹ���ַ�(��'1')��ע�⣬��Ҫ�������������ü���Var�����õ�������nan
example:
type_FN_ds = creat_datastore_fit_type(audio_ds,1,'F','N',nan,nan,nan,nan,nan,nan,nan,nan);      % try happy (F) + nutural (N)

type_a01_ds = creat_datastore_fit_type(audio_ds,4,'a',nan,nan,nan,nan,nan,nan,nan,nan,nan);     % try a01 (lyris is The tablecloth is lying on the frigde.)
type_a01_ds = creat_datastore_fit_type(type_a01_ds,3,'0',nan,nan,nan,nan,nan,nan,nan,nan,nan);  % try a01
type_a01_ds = creat_datastore_fit_type(type_a01_ds,2,'1',nan,nan,nan,nan,nan,nan,nan,nan,nan);  % try a01

%%-------------------------------------------------------------------------
put_emotion_labels          : ��datastore���϶�Ӧ��������ǩ
function audio_ds = put_emotion_labels(audio_ds)
����������EDMOB��RAVDESS
%%-------------------------------------------------------------------------
feature_extraction          : ��ȡ��Ƶ�ļ���feature
function [audio_feature,info_out]= feature_extraction(audio_in, info_in, aFE)       
aFE Ϊ�ⲿָ���������Ծ�����ȡ��Щ����
%%-------------------------------------------------------------------------
creat_feature_label         : ����һϵ�ж�Ӧfeature_extraction����ı��ÿһ�еı�ǩ��д����һ���Ƕ�Ӧ������feature
feature_label = creat_feature_label(aFE)
aFE Ϊ�ⲿָ��
