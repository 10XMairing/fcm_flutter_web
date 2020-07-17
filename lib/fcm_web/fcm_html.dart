import 'dart:convert';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'fcmJs.dart' as fcm_js;


//helper functions to call use javascript interop


// sets a callback to onForegroundMessage to the corresponding javascript function defined in fcmjs.dart
void onForegroundMessage(void Function(dynamic) f){

//  allowInterop -> allows calling of dart functions from javascript side
  fcm_js.onForegroundMessage = allowInterop((jsonString) {
    dynamic map = jsonDecode(jsonString);
    f(map);
  });
}

// gets the string token after calling the getFcmToken defined in web/fcm.js
Future<String> getFcmToken(){

  // promiseToFuture --> converts the returned javascript promise to a future type
  return promiseToFuture(fcm_js.getToken());
}
