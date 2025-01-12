import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjH62y5piu9YLsCVrnue_64dmV6tCcjhE",
            authDomain: "campus-life-app-svivsj.firebaseapp.com",
            projectId: "campus-life-app-svivsj",
            storageBucket: "campus-life-app-svivsj.firebasestorage.app",
            messagingSenderId: "746189740344",
            appId: "1:746189740344:web:25b90d39cb90a59492c9cd"));
  } else {
    await Firebase.initializeApp();
  }
}
