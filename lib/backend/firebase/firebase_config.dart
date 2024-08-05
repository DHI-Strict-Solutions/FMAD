import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCb0v6oduLV-vjYjfy7T4z8sMX3SMlE9EY",
            authDomain: "fmad-yvn4ct.firebaseapp.com",
            projectId: "fmad-yvn4ct",
            storageBucket: "fmad-yvn4ct.appspot.com",
            messagingSenderId: "1061506670476",
            appId: "1:1061506670476:web:7eef85c20d0b3d3c6fc0a9",
            measurementId: "G-KT86G4EJ2G"));
  } else {
    await Firebase.initializeApp();
  }
}
