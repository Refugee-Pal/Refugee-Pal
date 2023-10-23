import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navbars/helper_nav_bar/helper_nav_bar_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HelperEditModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? isShowAll = true;

  String? searchField;

  bool? isEditing = false;

  ResourceproviderRecord? docToEdit;

  bool? isEditSubcategory;

  SubcategoryRecord? subcategoryToEdit;

  bool? isNew;

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  List<SubcategoryRecord> simpleSearchResults = [];
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController3;
  String? Function(BuildContext, String?)? emailAddressController3Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController4;
  String? Function(BuildContext, String?)? emailAddressController4Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController5;
  String? Function(BuildContext, String?)? emailAddressController5Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController6;
  String? Function(BuildContext, String?)? emailAddressController6Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController7;
  String? Function(BuildContext, String?)? emailAddressController7Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController8;
  String? Function(BuildContext, String?)? emailAddressController8Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController9;
  String? Function(BuildContext, String?)? emailAddressController9Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Model for helperNavBar component.
  late HelperNavBarModel helperNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    helperNavBarModel = createModel(context, () => HelperNavBarModel());
  }

  void dispose() {
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
    emailAddressController3?.dispose();
    emailAddressController4?.dispose();
    emailAddressController5?.dispose();
    emailAddressController6?.dispose();
    emailAddressController7?.dispose();
    emailAddressController8?.dispose();
    emailAddressController9?.dispose();
    helperNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
