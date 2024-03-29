import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'category_widget.dart' show CategoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryModel extends FlutterFlowModel<CategoryWidget> {
  ///  Local state fields for this page.

  bool? isEditing = false;

  bool? isAdding = false;

  ResourceproviderRecord? resourceToEdit;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for refugeeNavBar component.
  late RefugeeNavBarModel refugeeNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    refugeeNavBarModel = createModel(context, () => RefugeeNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    refugeeNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
