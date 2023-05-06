import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/components/small_map/small_map_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import '/navbars/helper_nav_bar/helper_nav_bar_widget.dart';
import 'dart:io';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HelperOrganizationModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? isOnboarding = false;

  String? imgPath;

  bool? isShowAll = true;

  bool? isSettings = true;

  String? editing = 'false';

  bool? isNew = false;

  LocationsRecord? locationToEdit;

  ProgramsRecord? programToEdit;

  LocationsRecord? parentLocation;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  String? _emailAddressController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3y6ayps1' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  String? _emailAddressController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l7wnmgpo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController3;
  String? Function(BuildContext, String?)? emailAddressController3Validator;
  List<UserRecord> simpleSearchResults = [];
  // State field(s) for CheckboxListTile widget.

  Map<UserRecord, bool> checkboxListTileValueMap1 = {};
  List<UserRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Bottom Sheet - deleteConfirmation] action in Button widget.
  bool? isDelete;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController4;
  String? Function(BuildContext, String?)? emailAddressController4Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController5;
  String? Function(BuildContext, String?)? emailAddressController5Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController6;
  String? Function(BuildContext, String?)? emailAddressController6Validator;
  // State field(s) for CheckboxListTile widget.

  Map<CategoryRecord, bool> checkboxListTileValueMap2 = {};
  List<CategoryRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController7;
  String? Function(BuildContext, String?)? emailAddressController7Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController8;
  final emailAddressMask8 = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? emailAddressController8Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController9;
  String? Function(BuildContext, String?)? emailAddressController9Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController10;
  String? Function(BuildContext, String?)? emailAddressController10Validator;
  String? _emailAddressController10Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3aiaph6u' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController11;
  String? Function(BuildContext, String?)? emailAddressController11Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController12;
  String? Function(BuildContext, String?)? emailAddressController12Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController13;
  String? Function(BuildContext, String?)? emailAddressController13Validator;
  // State field(s) for CheckboxListTile widget.

  Map<CategoryRecord, bool> checkboxListTileValueMap3 = {};
  List<CategoryRecord> get checkboxListTileCheckedItems3 =>
      checkboxListTileValueMap3.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController14;
  String? Function(BuildContext, String?)? emailAddressController14Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController15;
  String? Function(BuildContext, String?)? emailAddressController15Validator;
  DateTime? datePicked;
  // State field(s) for CheckboxListTile widget.

  Map<UserRecord, bool> checkboxListTileValueMap4 = {};
  List<UserRecord> get checkboxListTileCheckedItems4 =>
      checkboxListTileValueMap4.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for emailAddress1 widget.
  TextEditingController? emailAddress1Controller;
  String? Function(BuildContext, String?)? emailAddress1ControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController16;
  String? Function(BuildContext, String?)? emailAddressController16Validator;
  // Model for helperNavBar component.
  late HelperNavBarModel helperNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressController1Validator = _emailAddressController1Validator;
    emailAddressController2Validator = _emailAddressController2Validator;
    emailAddressController10Validator = _emailAddressController10Validator;
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
    emailAddressController10?.dispose();
    emailAddressController11?.dispose();
    emailAddressController12?.dispose();
    emailAddressController13?.dispose();
    emailAddressController14?.dispose();
    emailAddressController15?.dispose();
    emailAddress1Controller?.dispose();
    emailAddressController16?.dispose();
    helperNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
