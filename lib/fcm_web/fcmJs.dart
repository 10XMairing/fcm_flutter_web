@JS()
library alertjs;

import 'package:js/js.dart';



//makes the `onForegroundMessage` function available to javascript side
// user in file web/fcm.js after a notification is triggered
@JS('onForegroundMessage')
external set onForegroundMessage(void Function(String) f);




//calls the custom javascript function `getFcmToken` in web/fcm.js
//returns a promise with a string token
@JS('getFcmToken')
external Future<String> getToken();