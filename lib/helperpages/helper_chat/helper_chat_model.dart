import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navbars/helper_nav_bar/helper_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HelperChatModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for helperNavBar component.
  late HelperNavBarModel helperNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    helperNavBarModel = createModel(context, () => HelperNavBarModel());
  }

  void dispose() {
    helperNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
