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
    apiKey: 'AIzaSyAasOMUqGzUa9YRPLZI_CTbsVZc6WkyJ9o',
    appId: '1:117676979566:web:68ab4a755eb4953c93bd7f',
    messagingSenderId: '117676979566',
    projectId: 'ninja-foods-48ff8',
    authDomain: 'ninja-foods-48ff8.firebaseapp.com',
    storageBucket: 'ninja-foods-48ff8.appspot.com',
    measurementId: 'G-G2W62T77JH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6Nt11lwuMBQrOhvGuE5HpcEXbCQz--NU',
    appId: '1:117676979566:android:9b5020e96a11160393bd7f',
    messagingSenderId: '117676979566',
    projectId: 'ninja-foods-48ff8',
    storageBucket: 'ninja-foods-48ff8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxebEls67pBPhMpWryUMTB-0ZyuphtXKI',
    appId: '1:117676979566:ios:65272a7a9a70c72593bd7f',
    messagingSenderId: '117676979566',
    projectId: 'ninja-foods-48ff8',
    storageBucket: 'ninja-foods-48ff8.firebasestorage.app',
    iosBundleId: 'com.ninjafoods.app',
  );

}