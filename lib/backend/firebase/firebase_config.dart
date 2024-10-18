import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBl6rsbgj0xlMdXWsBLCEuslx3uYvG4Ktw",
            authDomain: "rough-6eq82q.firebaseapp.com",
            projectId: "rough-6eq82q",
            storageBucket: "rough-6eq82q.appspot.com",
            messagingSenderId: "724579600680",
            appId: "1:724579600680:web:d9c0328bf3ce3cdd19281d"));
  } else {
    await Firebase.initializeApp();
  }
}
