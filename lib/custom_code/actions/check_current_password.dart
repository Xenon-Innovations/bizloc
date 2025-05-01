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

Future<bool> checkCurrentPassword(String? currentPassword) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = auth.currentUser!;

  // Получение учетных данных пользователя для входа в аккаунт
  AuthCredential credential = EmailAuthProvider.credential(
      email: user.email!, password: currentPassword!);

  try {
    // Попытка входа в аккаунт с использованием учетных данных
    await user.reauthenticateWithCredential(credential);
    return true; // Верный текущий пароль
  } catch (e) {
    print("Auth error: $e");
    return false; // Неверный текущий пароль
  }
  // Add your function code here!
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
