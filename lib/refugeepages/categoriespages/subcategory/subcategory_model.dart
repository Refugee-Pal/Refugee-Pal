import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubcategoryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for refugeeNavBar component.
  late RefugeeNavBarModel refugeeNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    refugeeNavBarModel = createModel(context, () => RefugeeNavBarModel());
  }

  void dispose() {
    refugeeNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
