import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? categorySelected = 'all';

  bool? showAll = true;

  List<String> searchResults = [];
  void addToSearchResults(String item) => searchResults.add(item);
  void removeFromSearchResults(String item) => searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);

  List<String> resourceSearchResults = [];
  void addToResourceSearchResults(String item) =>
      resourceSearchResults.add(item);
  void removeFromResourceSearchResults(String item) =>
      resourceSearchResults.remove(item);
  void removeAtIndexFromResourceSearchResults(int index) =>
      resourceSearchResults.removeAt(index);

  String? categoryID;

  bool? showHelperInterface = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  List<LocationsRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailAddressController?.dispose();
  }

  /// Additional helper methods are added here.

}
