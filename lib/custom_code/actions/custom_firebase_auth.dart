// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String> customFirebaseAuth(
    String emailAddress,
    String password,
    String messageInvalidEmail,
    String messageWrongPassword,
    String messageUserNotFound,
    String messageGenericError) async {
  String returnAuth;
  try {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress.trim(), password: password);
    returnAuth = "valid"; // Authentication successful
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      returnAuth = messageUserNotFound;
    } else if (e.code == 'wrong-password') {
      returnAuth = messageWrongPassword;
    } else if (e.code == 'invalid-email') {
      returnAuth = messageInvalidEmail;
    } else {
      returnAuth = messageGenericError;
    }
  }
  return returnAuth;
}
