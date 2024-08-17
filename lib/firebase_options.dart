// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyABR_mULWyTsniKnZJp5f68OT7wMlJ0gvs',
    appId: '1:362958169527:web:bc5a7a91dd11d89a4fb432',
    messagingSenderId: '362958169527',
    projectId: 'workout-application-a1ff4',
    authDomain: 'workout-application-a1ff4.firebaseapp.com',
    storageBucket: 'workout-application-a1ff4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLN4u7CiW9pxPpEn7PxDP1nh6kHqk6sSI',
    appId: '1:362958169527:android:26766d8b29fd8b3d4fb432',
    messagingSenderId: '362958169527',
    projectId: 'workout-application-a1ff4',
    storageBucket: 'workout-application-a1ff4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPWiv7dvh26dPEn0F7HPMPQvWwHF6sp2I',
    appId: '1:362958169527:ios:a4e57cada8f33d364fb432',
    messagingSenderId: '362958169527',
    projectId: 'workout-application-a1ff4',
    storageBucket: 'workout-application-a1ff4.appspot.com',
    iosBundleId: 'com.example.flutterWorkoutApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPWiv7dvh26dPEn0F7HPMPQvWwHF6sp2I',
    appId: '1:362958169527:ios:a4e57cada8f33d364fb432',
    messagingSenderId: '362958169527',
    projectId: 'workout-application-a1ff4',
    storageBucket: 'workout-application-a1ff4.appspot.com',
    iosBundleId: 'com.example.flutterWorkoutApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyABR_mULWyTsniKnZJp5f68OT7wMlJ0gvs',
    appId: '1:362958169527:web:6862ac2fa5bac0104fb432',
    messagingSenderId: '362958169527',
    projectId: 'workout-application-a1ff4',
    authDomain: 'workout-application-a1ff4.firebaseapp.com',
    storageBucket: 'workout-application-a1ff4.appspot.com',
  );
}
