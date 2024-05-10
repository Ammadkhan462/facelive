// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB8R6LUni3yKSjykNrEU15Oh_WsHVrCrG0',
    appId: '1:441691791355:web:6485e3605827abfe46b55e',
    messagingSenderId: '441691791355',
    projectId: 'listintolist',
    authDomain: 'listintolist.firebaseapp.com',
    storageBucket: 'listintolist.appspot.com',
    measurementId: 'G-JP17EWNMMN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByq2Hq9neRxjrKoybUFwx4p0A8g162okY',
    appId: '1:441691791355:android:77ccd98a35e8864b46b55e',
    messagingSenderId: '441691791355',
    projectId: 'listintolist',
    storageBucket: 'listintolist.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_NpvJZaYDwhOPAi6HhPfBEGY2DTEPoWE',
    appId: '1:441691791355:ios:2e9b9d25fe10642f46b55e',
    messagingSenderId: '441691791355',
    projectId: 'listintolist',
    storageBucket: 'listintolist.appspot.com',
    iosBundleId: 'com.facelive.facelive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_NpvJZaYDwhOPAi6HhPfBEGY2DTEPoWE',
    appId: '1:441691791355:ios:e7d9534fafa26d2646b55e',
    messagingSenderId: '441691791355',
    projectId: 'listintolist',
    storageBucket: 'listintolist.appspot.com',
    iosBundleId: 'com.facelive.facelive.RunnerTests',
  );
}
