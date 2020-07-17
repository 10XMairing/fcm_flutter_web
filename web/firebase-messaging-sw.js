// This service worker will handle the notification in background
// the click will be handled by sending a field `click_action` in the fcm notification payload
//{
//  "notification" : {
//      "title" : "notification title",
//      "body" : "notification message",
//      "click_action": "https://google.com"
//    },
//
//  "data" : {
//    "source" : "REFERRAL",
//    "metadata" : "{\"id\" : \"788ead82-d2aa-4255-9ac5-50e57bbe358d\"}"
//
//
//  },
//    "registration_ids" : []
//}

// Give the service worker access to Firebase Messaging.
// Note that you can only use Firebase Messaging here, other Firebase libraries
// are not available in the service worker.
importScripts('https://www.gstatic.com/firebasejs/7.15.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/7.15.0/firebase-messaging.js');

// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object

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


firebase.initializeApp(firebaseConfig);

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
const messaging = firebase.messaging();
// Handle incoming messages. Called when:
// - a message is received while the app has focus
// - the user clicks on an app notification created by a service worker
//   `messaging.setBackgroundMessageHandler` handler.


messaging.setBackgroundMessageHandler(function(payload) {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);
  // Customize notification here
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: 'favicon.png'
  };

  return self.registration.showNotification(notificationTitle,
    notificationOptions);
});