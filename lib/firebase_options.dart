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
    apiKey: 'AIzaSyC8kaV1bVOfWzpYAPR8tW7bxKod-9azihs',
    appId: '1:963950431682:web:4fbaf243aa92de0c811a5b',
    messagingSenderId: '963950431682',
    projectId: 'fitquest-dccc5',
    authDomain: 'fitquest-dccc5.firebaseapp.com',
    storageBucket: 'fitquest-dccc5.appspot.com',
    measurementId: 'G-KJG4JLZ76V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoVc-j3Sp78YL8HlwVb31Qd6D-kp6uKxs',
    appId: '1:963950431682:android:d38066072e04245a811a5b',
    messagingSenderId: '963950431682',
    projectId: 'fitquest-dccc5',
    storageBucket: 'fitquest-dccc5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChF5pM955zfzuC3OHheSEcOh2OBuVbiXU',
    appId: '1:963950431682:ios:e3696bdd68de7789811a5b',
    messagingSenderId: '963950431682',
    projectId: 'fitquest-dccc5',
    storageBucket: 'fitquest-dccc5.appspot.com',
    iosClientId: '963950431682-f8hibkl642tn5tm87laedvicikg15ean.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitquest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChF5pM955zfzuC3OHheSEcOh2OBuVbiXU',
    appId: '1:963950431682:ios:e3696bdd68de7789811a5b',
    messagingSenderId: '963950431682',
    projectId: 'fitquest-dccc5',
    storageBucket: 'fitquest-dccc5.appspot.com',
    iosClientId: '963950431682-f8hibkl642tn5tm87laedvicikg15ean.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitquest',
  );
}