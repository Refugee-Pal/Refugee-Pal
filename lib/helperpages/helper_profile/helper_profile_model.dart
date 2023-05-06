import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navbars/helper_nav_bar/helper_nav_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class HelperProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? editing = 'false';

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  final emailAddressMask1 = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  String? _emailAddressController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vldioulk' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'cx3rh3k7' /* Not a valid phone number */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'yry8ps34' /* Not a valid phone number */,
      );
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  String? _emailAddressController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dlscnhwl' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'p9ufo9ti' /* Invalid email address */,
      );
    }
    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController3;
  String? Function(BuildContext, String?)? emailAddressController3Validator;
  String? _emailAddressController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hoevt6f6' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'd422gttj' /* Invalid URL */,
      );
    }
    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController4;
  String? Function(BuildContext, String?)? emailAddressController4Validator;
  String? _emailAddressController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hphttipv' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '1ts34ql8' /* Invalid URL */,
      );
    }
    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController5;
  String? Function(BuildContext, String?)? emailAddressController5Validator;
  String? _emailAddressController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jkk86h86' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController6;
  String? Function(BuildContext, String?)? emailAddressController6Validator;
  String? _emailAddressController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0t2f0wr4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues1;
  FormFieldController<List<String>>? checkboxGroupValueController1;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues2;
  FormFieldController<List<String>>? checkboxGroupValueController2;
  // Model for helperNavBar component.
  late HelperNavBarModel helperNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressController1Validator = _emailAddressController1Validator;
    emailAddressController2Validator = _emailAddressController2Validator;
    emailAddressController3Validator = _emailAddressController3Validator;
    emailAddressController4Validator = _emailAddressController4Validator;
    emailAddressController5Validator = _emailAddressController5Validator;
    emailAddressController6Validator = _emailAddressController6Validator;
    helperNavBarModel = createModel(context, () => HelperNavBarModel());
  }

  void dispose() {
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
    emailAddressController3?.dispose();
    emailAddressController4?.dispose();
    emailAddressController5?.dispose();
    emailAddressController6?.dispose();
    helperNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
