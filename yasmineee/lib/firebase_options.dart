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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC0u9eJhSk8kDVa1IzLPiPrDuQrhLJgWns',
    appId: '1:157308130936:web:e998884daa3045d7e47f8d',
    messagingSenderId: '157308130936',
    projectId: 'xray-1956e',
    authDomain: 'xray-1956e.firebaseapp.com',
    storageBucket: 'xray-1956e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiJSBo_CADK9chq1bhxTBbyqsixwT4TM0',
    appId: '1:157308130936:android:77227b6f4eb37be7e47f8d',
    messagingSenderId: '157308130936',
    projectId: 'xray-1956e',
    storageBucket: 'xray-1956e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAc6s9Pe13L-CQjGGRe1eoIxar6IUDcpB8',
    appId: '1:157308130936:ios:8ed0634a99fd6f7be47f8d',
    messagingSenderId: '157308130936',
    projectId: 'xray-1956e',
    storageBucket: 'xray-1956e.appspot.com',
    iosBundleId: 'com.yasminee.yes.yasmineee',
  );
}
