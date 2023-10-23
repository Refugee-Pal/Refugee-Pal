import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'mapsheet_widget.dart' show MapsheetWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsheetModel extends FlutterFlowModel<MapsheetWidget> {
  ///  Local state fields for this component.

  bool? showDates = false;

  List<DateTime> dateToShow = [];
  void addToDateToShow(DateTime item) => dateToShow.add(item);
  void removeFromDateToShow(DateTime item) => dateToShow.remove(item);
  void removeAtIndexFromDateToShow(int index) => dateToShow.removeAt(index);
  void insertAtIndexInDateToShow(int index, DateTime item) =>
      dateToShow.insert(index, item);
  void updateDateToShowAtIndex(int index, Function(DateTime) updateFn) =>
      dateToShow[index] = updateFn(dateToShow[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
