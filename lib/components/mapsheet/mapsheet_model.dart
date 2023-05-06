import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsheetModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool? showDates = false;

  List<DateTime> dateToShow = [];
  void addToDateToShow(DateTime item) => dateToShow.add(item);
  void removeFromDateToShow(DateTime item) => dateToShow.remove(item);
  void removeAtIndexFromDateToShow(int index) => dateToShow.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
