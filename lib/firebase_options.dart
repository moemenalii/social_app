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
    apiKey: 'AIzaSyBBMSRHOdzv5RCyyK2-ZSHkeuNLkY48_QU',
    appId: '1:149677013063:web:9066ada9c684021522d962',
    messagingSenderId: '149677013063',
    projectId: 'scoial-app-d4166',
    authDomain: 'scoial-app-d4166.firebaseapp.com',
    storageBucket: 'scoial-app-d4166.appspot.com',
    measurementId: 'G-TCB8PQLQEC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-pMIIVTYcvCz0VZB-yWPAtI11tRqOpZM',
    appId: '1:149677013063:android:1aaf953de461823922d962',
    messagingSenderId: '149677013063',
    projectId: 'scoial-app-d4166',
    storageBucket: 'scoial-app-d4166.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOiYoCaX4slLEPodTpgeXCbvWsPy1b_CM',
    appId: '1:149677013063:ios:ae0005b67b6b560d22d962',
    messagingSenderId: '149677013063',
    projectId: 'scoial-app-d4166',
    storageBucket: 'scoial-app-d4166.appspot.com',
    androidClientId: '149677013063-7em82pfbncj8f2aolpgi6n25io4bv6a4.apps.googleusercontent.com',
    iosClientId: '149677013063-2fdpm5h7if2eejdldj1s3m6nn3713q3b.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOiYoCaX4slLEPodTpgeXCbvWsPy1b_CM',
    appId: '1:149677013063:ios:ae0005b67b6b560d22d962',
    messagingSenderId: '149677013063',
    projectId: 'scoial-app-d4166',
    storageBucket: 'scoial-app-d4166.appspot.com',
    androidClientId: '149677013063-7em82pfbncj8f2aolpgi6n25io4bv6a4.apps.googleusercontent.com',
    iosClientId: '149677013063-2fdpm5h7if2eejdldj1s3m6nn3713q3b.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialApp',
  );
}
