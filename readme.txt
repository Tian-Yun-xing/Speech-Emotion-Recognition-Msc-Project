MAIN

ע�⣬ʹ��RAVDESSʱ����Ҫ�ı�feature extraction�е�fs
���һ���ã���ý�RAVDESSԤ����ѹ����16000HZ

%%-------------------------------------------------------------------------
creat_datastore_fit_type    : ��ԭ�е�datastore�д���һ����������Ҫ����������ֻ�и��ˣ���datastore
type_ds = creat_datastore_fit_type(audio_ds,type_location,Var0, Var1, Var2, Var3, Var4, Var5, Var6, Var7, Var8, Var9)
audio_ds��ԭ����datastore
type_location���ļ����б�������Ҫ�������ĵط�����.wav��ǰ������һ����0���ڶ�����1�Դ�����
Var0-Var9����Ҫ�������Ĵ��ţ�ע��ʹ���ַ�(��'1')��ע�⣬��Ҫ�������������ü���Var�����õ�������nan
%%-------------------------------------------------------------------------
put_emotion_labels          : ��datastore���϶�Ӧ��������ǩ
function audio_ds = put_emotion_labels(audio_ds)
������EDMOB��RAVDESS
%%-------------------------------------------------------------------------