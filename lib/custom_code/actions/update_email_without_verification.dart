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

Future<String> updateEmailWithoutVerification(String newEmail) async {
  try {
    // Получаем текущего пользователя
    User? curuser = FirebaseAuth.instance.currentUser;

    // Проверяем, авторизован ли пользователь
    if (curuser != null) {
      // Обновляем email без отправки подтверждения
      await curuser.updateEmail(newEmail);
      return "Email успешно обновлен";
    } else {
      return "Пользователь не авторизован";
    }
  } on FirebaseAuthException catch (e) {
    // Обрабатываем возможные ошибки
    if (e.code == 'requires-recent-login') {
      return "Для изменения email необходимо повторно войти в систему.";
    } else if (e.code == 'invalid-email') {
      return "Некорректный email адрес.";
    } else {
      return "Ошибка: ${e.message}";
    }
  } catch (e) {
    return "Произошла неизвестная ошибка: ${e.toString()}";
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
