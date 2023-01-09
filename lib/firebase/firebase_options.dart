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
    apiKey: 'AIzaSyA24H-COuTOm88PZVj45uwXNiSbRrDZ-HA',
    appId: '1:189238426488:web:4a172a2f484f9d25c3e68d',
    messagingSenderId: '189238426488',
    projectId: 'amera-edc55',
    authDomain: 'amera-edc55.firebaseapp.com',
    storageBucket: 'amera-edc55.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkVRwtdoZJBtqjFM4tmJW-sF_FbT9YQ5Q',
    appId: '1:189238426488:android:fba92f48ed770ba3c3e68d',
    messagingSenderId: '189238426488',
    projectId: 'amera-edc55',
    storageBucket: 'amera-edc55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTKsEBjkb4-FLehgKqGkbwksjdOLQYXvQ',
    appId: '1:189238426488:ios:ea99b41a0fbdc272c3e68d',
    messagingSenderId: '189238426488',
    projectId: 'amera-edc55',
    storageBucket: 'amera-edc55.appspot.com',
    iosClientId:
        '189238426488-6cgq1ae2817ahph9vo8ngm8s00670svj.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatBlueFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTKsEBjkb4-FLehgKqGkbwksjdOLQYXvQ',
    appId: '1:189238426488:ios:ea99b41a0fbdc272c3e68d',
    messagingSenderId: '189238426488',
    projectId: 'amera-edc55',
    storageBucket: 'amera-edc55.appspot.com',
    iosClientId:
        '189238426488-6cgq1ae2817ahph9vo8ngm8s00670svj.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatBlueFirebase',
  );
}