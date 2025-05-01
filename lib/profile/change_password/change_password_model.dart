import '/auth/firebase_auth/auth_util.dart';
import '/components/alert_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CurrentPasswordTextField widget.
  FocusNode? currentPasswordTextFieldFocusNode;
  TextEditingController? currentPasswordTextFieldTextController;
  String? Function(BuildContext, String?)?
      currentPasswordTextFieldTextControllerValidator;
  // State field(s) for NewPasswordTextField widget.
  FocusNode? newPasswordTextFieldFocusNode;
  TextEditingController? newPasswordTextFieldTextController;
  String? Function(BuildContext, String?)?
      newPasswordTextFieldTextControllerValidator;
  // State field(s) for ConfirmPasswordTextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode;
  TextEditingController? confirmPasswordTextFieldTextController;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextControllerValidator;
  // Stores action output result for [Custom Action - checkCurrentPassword] action in Button widget.
  bool? currentPasswordConfirmed;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    currentPasswordTextFieldFocusNode?.dispose();
    currentPasswordTextFieldTextController?.dispose();

    newPasswordTextFieldFocusNode?.dispose();
    newPasswordTextFieldTextController?.dispose();

    confirmPasswordTextFieldFocusNode?.dispose();
    confirmPasswordTextFieldTextController?.dispose();
  }
}
