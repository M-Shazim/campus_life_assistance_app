import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'add_assignment_widget.dart' show AddAssignmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAssignmentModel extends FlutterFlowModel<AddAssignmentWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for addTitle widget.
  FocusNode? addTitleFocusNode;
  TextEditingController? addTitleTextController;
  String? Function(BuildContext, String?)? addTitleTextControllerValidator;
  // State field(s) for addSubject widget.
  FocusNode? addSubjectFocusNode;
  TextEditingController? addSubjectTextController;
  String? Function(BuildContext, String?)? addSubjectTextControllerValidator;
  // State field(s) for addDescription widget.
  FocusNode? addDescriptionFocusNode;
  TextEditingController? addDescriptionTextController;
  String? Function(BuildContext, String?)?
      addDescriptionTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addTitleFocusNode?.dispose();
    addTitleTextController?.dispose();

    addSubjectFocusNode?.dispose();
    addSubjectTextController?.dispose();

    addDescriptionFocusNode?.dispose();
    addDescriptionTextController?.dispose();
  }
}
