import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC-N-ZPYivYiMapQaIND-G2f2Bl9teqy_k",
            authDomain: "refugee-pal-476d6.firebaseapp.com",
            projectId: "refugee-pal-476d6",
            storageBucket: "refugee-pal-476d6.appspot.com",
            messagingSenderId: "939869975986",
            appId: "1:939869975986:web:919eaf2235143d5144a0ab"));
  } else {
    await Firebase.initializeApp();
  }
}
