
//conditional import as package:js is not suitable for mobile build
export 'fcm_unsupported.dart'
if (dart.library.html) "fcm_html.dart";