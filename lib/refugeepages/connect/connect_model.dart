import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/components/input/input_widget.dart';
import '/components/material2_action_sheet_simple/material2_action_sheet_simple_widget.dart';
import '/components/material_action_sheet_simple/material_action_sheet_simple_widget.dart';
import '/components/new_sheet/new_sheet_widget.dart';
import '/components/no_answers_yet_widget.dart';
import '/components/user_profile/user_profile_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ConnectModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? language = 'none';

  String? profession = 'none';

  bool? isQA = true;

  bool? isChat = true;

  ChatsRecord? chat;

  MessagesRecord? messages;

  bool? filtering = false;

  bool? chatting = false;

  bool? closeChat = false;

  bool? isShowAll = true;

  bool? isDialogue = false;

  bool? isAddPeople = false;

  String? storedValue;

  bool? openContactWindow = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Model for input component.
  late InputModel inputModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for CheckboxListTile widget.

  Map<CategoryRecord, bool> checkboxListTileValueMap1 = {};
  List<CategoryRecord> get checkboxListTileCheckedItems1 =>
      checkboxListTileValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newQChat;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MessagesRecord? newQMessages;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for nameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  List<UserRecord> simpleSearchResults = [];
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for CheckboxListTile widget.

  Map<UserRecord, bool> checkboxListTileValueMap2 = {};
  List<UserRecord> get checkboxListTileCheckedItems2 =>
      checkboxListTileValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChat1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MessagesRecord? messageDoc1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChat2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MessagesRecord? messageDoc2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for chatList widget.
  ScrollController? chatList;
  // Stores action output result for [Bottom Sheet - deleteConfirmation] action in IconButton widget.
  bool? toDelete;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // State field(s) for chatField widget.
  TextEditingController? chatFieldController;
  String? Function(BuildContext, String?)? chatFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in chatField widget.
  MessagesRecord? theDocument1;
  // Stores action output result for [Backend Call - Create Document] action in chatField widget.
  MessagesRecord? theDocument2;
  // Stores action output result for [Backend Call - Create Document] action in chatField widget.
  MessagesRecord? theDocument3;
  // Stores action output result for [Backend Call - Create Document] action in chatField widget.
  MessagesRecord? theDocument4;
  // Stores action output result for [Backend Call - Create Document] action in chatField widget.
  MessagesRecord? theDocument5;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // Model for userProfile component.
  late UserProfileModel userProfileModel;
  // Stores action output result for [Bottom Sheet - newSheet] action in IconButton widget.
  List<bool>? isQandA;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for Column widget.
  ScrollController? columnController5;
  // Model for refugeeNavBar component.
  late RefugeeNavBarModel refugeeNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController1 = ScrollController();
    inputModel = createModel(context, () => InputModel());
    listViewController1 = ScrollController();
    columnController2 = ScrollController();
    listViewController2 = ScrollController();
    columnController3 = ScrollController();
    chatList = ScrollController();
    listViewController3 = ScrollController();
    listViewController4 = ScrollController();
    userProfileModel = createModel(context, () => UserProfileModel());
    columnController4 = ScrollController();
    columnController5 = ScrollController();
    refugeeNavBarModel = createModel(context, () => RefugeeNavBarModel());
  }

  void dispose() {
    columnController1?.dispose();
    inputModel.dispose();
    listViewController1?.dispose();
    columnController2?.dispose();
    nameFieldController?.dispose();
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
    listViewController2?.dispose();
    columnController3?.dispose();
    chatList?.dispose();
    listViewController3?.dispose();
    chatFieldController?.dispose();
    listViewController4?.dispose();
    userProfileModel.dispose();
    columnController4?.dispose();
    columnController5?.dispose();
    refugeeNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
