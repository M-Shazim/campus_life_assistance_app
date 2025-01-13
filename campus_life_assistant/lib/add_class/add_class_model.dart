import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_class_widget.dart' show AddClassWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddClassModel extends FlutterFlowModel<AddClassWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for addSubject widget.
  FocusNode? addSubjectFocusNode;
  TextEditingController? addSubjectTextController;
  String? Function(BuildContext, String?)? addSubjectTextControllerValidator;
  // State field(s) for addRoom widget.
  FocusNode? addRoomFocusNode;
  TextEditingController? addRoomTextController;
  String? Function(BuildContext, String?)? addRoomTextControllerValidator;
  // State field(s) for addDay widget.
  FocusNode? addDayFocusNode;
  TextEditingController? addDayTextController;
  String? Function(BuildContext, String?)? addDayTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addSubjectFocusNode?.dispose();
    addSubjectTextController?.dispose();

    addRoomFocusNode?.dispose();
    addRoomTextController?.dispose();

    addDayFocusNode?.dispose();
    addDayTextController?.dispose();
  }
}
