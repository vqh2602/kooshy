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
    apiKey: 'AIzaSyDjvcAJLDDTNfyIlavcjMRNl8HITKXodeU',
    appId: '1:864210940068:web:07b8a114b81a4d2e2e3631',
    messagingSenderId: '864210940068',
    projectId: 'kooshy-74a34',
    authDomain: 'kooshy-74a34.firebaseapp.com',
    storageBucket: 'kooshy-74a34.appspot.com',
    measurementId: 'G-0BCXB9KV46',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaU1CQjaXy6PVgrakjgILQaCmoG0FcLMw',
    appId: '1:864210940068:android:2809a16efba6411a2e3631',
    messagingSenderId: '864210940068',
    projectId: 'kooshy-74a34',
    storageBucket: 'kooshy-74a34.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxvtMP9kZg2qAQp2VXF66ASyX0JKGcoFY',
    appId: '1:864210940068:ios:e157b531615f263c2e3631',
    messagingSenderId: '864210940068',
    projectId: 'kooshy-74a34',
    storageBucket: 'kooshy-74a34.appspot.com',
    iosClientId: '864210940068-4gf5h0c3d1f2s9r8hqncdtpdphjk1oom.apps.googleusercontent.com',
    iosBundleId: 'com.example.kooshy',
  );
}
