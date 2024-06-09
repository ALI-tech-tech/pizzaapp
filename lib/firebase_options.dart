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
    apiKey: 'AIzaSyBGTJu1wAYnVCkUwLqwzWEKHagfPm5B6Xg',
    appId: '1:413407778956:web:96c8da8dc3132e6f9b43a9',
    messagingSenderId: '413407778956',
    projectId: 'pizza-delevry',
    authDomain: 'pizza-delevry.firebaseapp.com',
    storageBucket: 'pizza-delevry.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBr83e0biUBiDVgzg9XDjeakuAzrz_6Rnk',
    appId: '1:413407778956:android:a531f095cc2c9ad89b43a9',
    messagingSenderId: '413407778956',
    projectId: 'pizza-delevry',
    storageBucket: 'pizza-delevry.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuwBn-ruziu-Ql1KdgfYSyidqsVeUTpFg',
    appId: '1:413407778956:ios:51fcde5edf586bed9b43a9',
    messagingSenderId: '413407778956',
    projectId: 'pizza-delevry',
    storageBucket: 'pizza-delevry.appspot.com',
    iosBundleId: 'com.example.pizzaapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuwBn-ruziu-Ql1KdgfYSyidqsVeUTpFg',
    appId: '1:413407778956:ios:51fcde5edf586bed9b43a9',
    messagingSenderId: '413407778956',
    projectId: 'pizza-delevry',
    storageBucket: 'pizza-delevry.appspot.com',
    iosBundleId: 'com.example.pizzaapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBGTJu1wAYnVCkUwLqwzWEKHagfPm5B6Xg',
    appId: '1:413407778956:web:43fb055aeb2683db9b43a9',
    messagingSenderId: '413407778956',
    projectId: 'pizza-delevry',
    authDomain: 'pizza-delevry.firebaseapp.com',
    storageBucket: 'pizza-delevry.appspot.com',
  );
}
