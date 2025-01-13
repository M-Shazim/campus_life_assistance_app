import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'edit_classes_widget.dart' show EditClassesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditClassesModel extends FlutterFlowModel<EditClassesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for editSubject widget.
  FocusNode? editSubjectFocusNode;
  TextEditingController? editSubjectTextController;
  String? Function(BuildContext, String?)? editSubjectTextControllerValidator;
  // State field(s) for editRoom widget.
  FocusNode? editRoomFocusNode;
  TextEditingController? editRoomTextController;
  String? Function(BuildContext, String?)? editRoomTextControllerValidator;
  // State field(s) for editDay widget.
  FocusNode? editDayFocusNode;
  TextEditingController? editDayTextController;
  String? Function(BuildContext, String?)? editDayTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editSubjectFocusNode?.dispose();
    editSubjectTextController?.dispose();

    editRoomFocusNode?.dispose();
    editRoomTextController?.dispose();

    editDayFocusNode?.dispose();
    editDayTextController?.dispose();
  }
}
