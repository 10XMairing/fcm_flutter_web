// this is for unsupported platform
//this errors will be thrown if the functions are called without the kIsWeb checker

void onForegroundMessage(void Function(dynamic) f){
  throw Exception('onForegroundMessage : Unsupported platform . This function is available only for web');
}

Future<String> getFcmToken(){
  throw Exception('getFcmToken : Unsupported platform . This function is available only for web');
}
