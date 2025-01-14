import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'edit_assignment_widget.dart' show EditAssignmentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAssignmentModel extends FlutterFlowModel<EditAssignmentWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for updateTitle widget.
  FocusNode? updateTitleFocusNode;
  TextEditingController? updateTitleTextController;
  String? Function(BuildContext, String?)? updateTitleTextControllerValidator;
  // State field(s) for updateSubject widget.
  FocusNode? updateSubjectFocusNode;
  TextEditingController? updateSubjectTextController;
  String? Function(BuildContext, String?)? updateSubjectTextControllerValidator;
  // State field(s) for updateDescription widget.
  FocusNode? updateDescriptionFocusNode;
  TextEditingController? updateDescriptionTextController;
  String? Function(BuildContext, String?)?
      updateDescriptionTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    updateTitleFocusNode?.dispose();
    updateTitleTextController?.dispose();

    updateSubjectFocusNode?.dispose();
    updateSubjectTextController?.dispose();

    updateDescriptionFocusNode?.dispose();
    updateDescriptionTextController?.dispose();
  }
}
