import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navbars/helper_nav_bar/helper_nav_bar_widget.dart';
import 'dart:ui';
import 'helper_edit_widget.dart' show HelperEditWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HelperEditModel extends FlutterFlowModel<HelperEditWidget> {
  ///  Local state fields for this page.

  bool? isShowAll = true;

  String? searchField;

  bool? isEditing = false;

  ResourceproviderRecord? docToEdit;

  bool? isEditSubcategory = false;

  SubcategoryRecord? subcategoryToEdit;

  bool? isNew = false;

  String parentSubcategoryName = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  List<SubcategoryRecord> simpleSearchResults = [];
  // State field(s) for newscName widget.
  TextEditingController? newscNameController;
  String? Function(BuildContext, String?)? newscNameControllerValidator;
  // State field(s) for newscInfo widget.
  TextEditingController? newscInfoController;
  String? Function(BuildContext, String?)? newscInfoControllerValidator;
  // State field(s) for subcategoryName widget.
  TextEditingController? subcategoryNameController;
  String? Function(BuildContext, String?)? subcategoryNameControllerValidator;
  // State field(s) for subcategoryInformation widget.
  TextEditingController? subcategoryInformationController;
  String? Function(BuildContext, String?)?
      subcategoryInformationControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Bottom Sheet - deleteConfirmation] action in Button widget.
  bool? doDeleteSC;
  // State field(s) for rpName widget.
  TextEditingController? rpNameController;
  String? Function(BuildContext, String?)? rpNameControllerValidator;
  // State field(s) for rpInformation widget.
  TextEditingController? rpInformationController;
  String? Function(BuildContext, String?)? rpInformationControllerValidator;
  // State field(s) for rpLink widget.
  TextEditingController? rpLinkController;
  String? Function(BuildContext, String?)? rpLinkControllerValidator;
  // State field(s) for newrpName widget.
  TextEditingController? newrpNameController;
  String? Function(BuildContext, String?)? newrpNameControllerValidator;
  // State field(s) for newrpInfo widget.
  TextEditingController? newrpInfoController;
  String? Function(BuildContext, String?)? newrpInfoControllerValidator;
  // State field(s) for newrpLink widget.
  TextEditingController? newrpLinkController;
  String? Function(BuildContext, String?)? newrpLinkControllerValidator;
  // State field(s) for parentSubcategory widget.
  String? parentSubcategoryValue;
  FormFieldController<String>? parentSubcategoryValueController;
  // Stores action output result for [Bottom Sheet - deleteConfirmation] action in Button widget.
  bool? doDelete;
  // Model for helperNavBar component.
  late HelperNavBarModel helperNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    helperNavBarModel = createModel(context, () => HelperNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressController?.dispose();
    newscNameController?.dispose();
    newscInfoController?.dispose();
    subcategoryNameController?.dispose();
    subcategoryInformationController?.dispose();
    rpNameController?.dispose();
    rpInformationController?.dispose();
    rpLinkController?.dispose();
    newrpNameController?.dispose();
    newrpInfoController?.dispose();
    newrpLinkController?.dispose();
    helperNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
