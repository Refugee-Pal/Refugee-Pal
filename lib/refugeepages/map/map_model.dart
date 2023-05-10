import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mapsheet/mapsheet_widget.dart';
import '/components/user_profile/user_profile_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapModel extends FlutterFlowModel {
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

  bool? isLocation = true;

  bool? showBlocker = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for userProfile component.
  late UserProfileModel userProfileModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userProfileModel = createModel(context, () => UserProfileModel());
  }

  void dispose() {
    userProfileModel.dispose();
  }

  /// Additional helper methods are added here.

}
