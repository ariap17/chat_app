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
    apiKey: 'AIzaSyA7Gi3MmetVbO5tZf-NPls_UzacBjxL6bg',
    appId: '1:597343278836:web:dbc35b3e5968d14d03f0a1',
    messagingSenderId: '597343278836',
    projectId: 'chat-658e2',
    authDomain: 'chat-658e2.firebaseapp.com',
    storageBucket: 'chat-658e2.firebasestorage.app',
    measurementId: 'G-FV8N8BCSD8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4eU_NLTOp6v6pGsBmWUSTa6gFSLXAaic',
    appId: '1:597343278836:android:61937883e634688103f0a1',
    messagingSenderId: '597343278836',
    projectId: 'chat-658e2',
    storageBucket: 'chat-658e2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_klqCrX9dh6CA3fKAnSF-7c-mZENux7M',
    appId: '1:597343278836:ios:32424005d9e0c08503f0a1',
    messagingSenderId: '597343278836',
    projectId: 'chat-658e2',
    storageBucket: 'chat-658e2.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7Gi3MmetVbO5tZf-NPls_UzacBjxL6bg',
    appId: '1:597343278836:web:9171e5775b7fb2fd03f0a1',
    messagingSenderId: '597343278836',
    projectId: 'chat-658e2',
    authDomain: 'chat-658e2.firebaseapp.com',
    storageBucket: 'chat-658e2.firebasestorage.app',
    measurementId: 'G-T9D99TER2W',
  );
}
