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
    apiKey: 'AIzaSyCXAVGbvP72vLlauWNeBn5KUYj7igUPDb4',
    appId: '1:1022049108472:web:fa7638447192381765960d',
    messagingSenderId: '1022049108472',
    projectId: 'app-envio-imagens',
    authDomain: 'app-envio-imagens.firebaseapp.com',
    storageBucket: 'app-envio-imagens.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGiXMHS6EDZLycxpptJQ6RO0Htgjd4694',
    appId: '1:1022049108472:android:f081102965fe17ac65960d',
    messagingSenderId: '1022049108472',
    projectId: 'app-envio-imagens',
    storageBucket: 'app-envio-imagens.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZId6h7moEX1CZxuhQFb2SNvyChpUhcFo',
    appId: '1:1022049108472:ios:97899c4040b575b465960d',
    messagingSenderId: '1022049108472',
    projectId: 'app-envio-imagens',
    storageBucket: 'app-envio-imagens.appspot.com',
    iosClientId: '1022049108472-bq9n418bb0nqqgds4k8bvjqu63bhc5j7.apps.googleusercontent.com',
    iosBundleId: 'com.example.appEnvioImagens',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZId6h7moEX1CZxuhQFb2SNvyChpUhcFo',
    appId: '1:1022049108472:ios:97899c4040b575b465960d',
    messagingSenderId: '1022049108472',
    projectId: 'app-envio-imagens',
    storageBucket: 'app-envio-imagens.appspot.com',
    iosClientId: '1022049108472-bq9n418bb0nqqgds4k8bvjqu63bhc5j7.apps.googleusercontent.com',
    iosBundleId: 'com.example.appEnvioImagens',
  );
}