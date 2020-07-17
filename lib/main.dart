import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'fcm_web/fcm_web.dart' as fcm_web;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String token = '';

  @override
  Widget build(BuildContext context) {
    fcm_web.onForegroundMessage((data) {
      Flushbar(
        title: data["notification"]["title"] ?? 'unknown title',
        message: data["notification"]["message"] ?? 'unknown message',
        duration: Duration(seconds: 3),
      )..show(context);
    });

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('FCM TOKEN ::: $token'),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                token = '';
              });
              Future.delayed(Duration(milliseconds: 1500));
              fcm_web.getFcmToken().then((value) {
                print(value);
                setState(() {
                  token = value;
                });
              });
            },
            child: Text('GET TOKEN'),
          )
        ],
      ),
    );
  }
}
