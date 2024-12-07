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
    apiKey: 'AIzaSyCJdL39oJBTSrfnCirPCXK8GYPzonjO9r0',
    appId: '1:160462562699:web:51f1f53d95a672364fbb8e',
    messagingSenderId: '160462562699',
    projectId: 'todo-f4e96',
    authDomain: 'todo-f4e96.firebaseapp.com',
    storageBucket: 'todo-f4e96.firebasestorage.app',
    measurementId: 'G-YTMTS6M41X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl_7w6t6wj2h4sPw1WceBJkQeJfGfVk5o',
    appId: '1:160462562699:android:fc84282b0c1ca3f84fbb8e',
    messagingSenderId: '160462562699',
    projectId: 'todo-f4e96',
    storageBucket: 'todo-f4e96.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoUIf6WvvdHihgum56FoANjfsEZTpRGGQ',
    appId: '1:160462562699:ios:b1cd85243064abdf4fbb8e',
    messagingSenderId: '160462562699',
    projectId: 'todo-f4e96',
    storageBucket: 'todo-f4e96.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBoUIf6WvvdHihgum56FoANjfsEZTpRGGQ',
    appId: '1:160462562699:ios:b1cd85243064abdf4fbb8e',
    messagingSenderId: '160462562699',
    projectId: 'todo-f4e96',
    storageBucket: 'todo-f4e96.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCJdL39oJBTSrfnCirPCXK8GYPzonjO9r0',
    appId: '1:160462562699:web:039e08f478483a074fbb8e',
    messagingSenderId: '160462562699',
    projectId: 'todo-f4e96',
    authDomain: 'todo-f4e96.firebaseapp.com',
    storageBucket: 'todo-f4e96.firebasestorage.app',
    measurementId: 'G-WPWX7Z221L',
  );
}
