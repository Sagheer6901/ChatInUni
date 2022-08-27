// import 'package:chatinunii/authScreens/login.dart';
// import 'package:chatinunii/core/apis.dart';
// import 'package:chatinunii/firebase_options.dart';
// import 'package:chatinunii/test.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// import '/screens/splashscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await FirebaseMessaging.instance.setAutoInitEnabled(true);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   IO.Socket socket = IO.io('https://test-api.chatinuni.com', <String, dynamic>{
//     'transports': ['websocket']
//   });
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     socket.onConnect((data) async {
//       print('connected');
//       print(socket.connected);
//     });
//   }
//
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/login': (context) => Login(),
//       },
//       debugShowCheckedModeBanner: false,
//       supportedLocales:  [
//         Locale('en', 'US'),
//         Locale('tr', 'TR'),
//         Locale('ur', 'PK'),
//         Locale('uk ', 'UA'),
//         // Locale('zh', 'sg'),
//
//
//       ],
//       localizationsDelegates:  [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       home:
//
//           // Test()
//           SafeArea(child: SplashScreen()
//               // Test()
//               ),
//       // EditProfile()),
//     );
//   }
// }






import 'package:chatinunii/authScreens/login.dart';
import 'package:chatinunii/core/apis.dart';
import 'package:chatinunii/firebase_options.dart';
import 'package:chatinunii/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  IO.Socket socket = IO.io('https://test-api.chatinuni.com', <String, dynamic>{
    'transports': ['websocket']
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket.onConnect((data) async {
      print('connected');
      print(socket.connected);
    });
  }

  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => Login(),
      },
      translations: Languages(),
      locale: Get.deviceLocale,
      // fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,

      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home:        SafeArea(child: SplashScreen()),
    );
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => Login(),
      },
      debugShowCheckedModeBanner: false,
      supportedLocales:  [
        Locale('en', 'US'),
        Locale('tr', 'TR'),
        Locale('ur', 'PK'),
        Locale('uk ', 'UA'),
        // Locale('zh', 'sg'),


      ],
      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home:

      // Test()
      SafeArea(child: SplashScreen()
        // Test()
      ),
      // EditProfile()),
    );
  }
}
