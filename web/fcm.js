 // this file will initialize the firebase instance for web


  var firebaseConfig = {
    apiKey: "",
    authDomain: "",
    databaseURL: "",
    projectId: "",
    storageBucket: "",
    messagingSenderId: "",
    appId: "",
    measurementId: ""
  };
  // Initialize Firebase
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();


// this javascript function returns a promise Promise<String>
//this function will be called from the dart side

function getFcmToken(){
  return messaging.getToken();
}


messaging.onMessage(function(payload){


  jsonString = JSON.stringify(payload);

//  this callback is implemented on the dart side . see fcm_web/fcm_html.dart
  onForegroundMessage(jsonString);
});