import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mapsheet/mapsheet_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InteractivemapModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? isFiltering = false;

  String? categorySelected = 'none';

  bool? showMapSheet = false;

  LocationsRecord? locationSelected;

  List<LocationsRecord> allLocations = [];
  void addToAllLocations(LocationsRecord item) => allLocations.add(item);
  void removeFromAllLocations(LocationsRecord item) =>
      allLocations.remove(item);
  void removeAtIndexFromAllLocations(int index) => allLocations.removeAt(index);

  bool? isEdit = false;

  bool? isSelectingLocation;

  LocationsRecord? locationtoEdit;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for mapsheet component.
  late MapsheetModel mapsheetModel;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
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
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController10;
  String? Function(BuildContext, String?)? emailAddressController10Validator;
  // State field(s) for CheckboxListTile widget.

  Map<CategoryRecord, bool> checkboxListTileValueMap = {};
  List<CategoryRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mapsheetModel = createModel(context, () => MapsheetModel());
  }

  void dispose() {
    mapsheetModel.dispose();
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
  }

  /// Additional helper methods are added here.

}
