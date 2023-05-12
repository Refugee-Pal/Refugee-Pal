import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SettingsAccInfoCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  String? _emailAddressController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3ym33lby' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'r6yysskt' /* Invalid email address */,
      );
    }
    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  final emailAddressMask2 = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  String? _emailAddressController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'odsz2r0z' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'nkzt7uwo' /* Invalid phone number */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'b674myor' /* Invalid phone number */,
      );
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - deleteConfirmation] action in Button widget.
  bool? isDelete;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressController1Validator = _emailAddressController1Validator;
    emailAddressController2Validator = _emailAddressController2Validator;
  }

  void dispose() {
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
  }

  /// Additional helper methods are added here.

}
