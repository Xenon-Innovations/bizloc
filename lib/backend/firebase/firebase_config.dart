import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAFH8QpM0EKfElA3hg7HqJou1PABfQ4V3Y",
            authDomain: "biz-loc-blmajx.firebaseapp.com",
            projectId: "biz-loc-blmajx",
            storageBucket: "biz-loc-blmajx.appspot.com",
            messagingSenderId: "520117707552",
            appId: "1:520117707552:web:7aeeaa90ce2db68371ad45",
            measurementId: "G-CXC74SQWCJ"));
  } else {
    await Firebase.initializeApp();
  }
}
