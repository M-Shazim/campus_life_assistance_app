import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'signup_page_widget.dart' show SignupPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupPageModel extends FlutterFlowModel<SignupPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for signupemail widget.
  FocusNode? signupemailFocusNode;
  TextEditingController? signupemailTextController;
  String? Function(BuildContext, String?)? signupemailTextControllerValidator;
  // State field(s) for signuusername widget.
  FocusNode? signuusernameFocusNode;
  TextEditingController? signuusernameTextController;
  String? Function(BuildContext, String?)? signuusernameTextControllerValidator;
  // State field(s) for signuppassword widget.
  FocusNode? signuppasswordFocusNode;
  TextEditingController? signuppasswordTextController;
  late bool signuppasswordVisibility;
  String? Function(BuildContext, String?)?
      signuppasswordTextControllerValidator;
  // State field(s) for cfnsignuppassword widget.
  FocusNode? cfnsignuppasswordFocusNode;
  TextEditingController? cfnsignuppasswordTextController;
  late bool cfnsignuppasswordVisibility;
  String? Function(BuildContext, String?)?
      cfnsignuppasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signuppasswordVisibility = false;
    cfnsignuppasswordVisibility = false;
  }

  @override
  void dispose() {
    signupemailFocusNode?.dispose();
    signupemailTextController?.dispose();

    signuusernameFocusNode?.dispose();
    signuusernameTextController?.dispose();

    signuppasswordFocusNode?.dispose();
    signuppasswordTextController?.dispose();

    cfnsignuppasswordFocusNode?.dispose();
    cfnsignuppasswordTextController?.dispose();
  }
}
