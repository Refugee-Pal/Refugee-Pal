import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/components/material2_action_sheet_simple/material2_action_sheet_simple_widget.dart';
import '/components/new_sheet/new_sheet_widget.dart';
import '/components/user_profile/user_profile_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/navbars/helper_nav_bar/helper_nav_bar_widget.dart';
import 'dart:ui';
import 'helper_chat_widget.dart' show HelperChatWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HelperChatModel extends FlutterFlowModel<HelperChatWidget> {
  ///  Local state fields for this page.

  bool? chatting = false;

  bool? isShowAll = true;

  ChatsRecord? chat;

  String? storedValue;

  bool? isAddPeople = false;

  bool? isViewingProfile = false;

  bool? isQA = true;

  bool? closeChat;

  MessagesRecord? message;

  List<bool> masterState = [];
  void addToMasterState(bool item) => masterState.add(item);
  void removeFromMasterState(bool item) => masterState.remove(item);
  void removeAtIndexFromMasterState(int index) => masterState.removeAt(index);
  void insertAtIndexInMasterState(int index, bool item) =>
      masterState.insert(index, item);
  void updateMasterStateAtIndex(int index, Function(bool) updateFn) =>
      masterState[index] = updateFn(masterState[index]);

  bool hasFirstPost = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
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
  // State field(s) for nameField widget.
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController3;
  String? Function(BuildContext, String?)? emailAddressController3Validator;
  List<UserRecord> simpleSearchResults = [];
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
  // Stores action output result for [Bottom Sheet - deleteConfirmation] action in IconButton widget.
  bool? toDelete;
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

  // Model for userProfile component.
  late UserProfileModel userProfileModel;
  // Stores action output result for [Bottom Sheet - newSheet] action in IconButton widget.
  List<bool>? isQandA;
  // Model for helperNavBar component.
  late HelperNavBarModel helperNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userProfileModel = createModel(context, () => UserProfileModel());
    helperNavBarModel = createModel(context, () => HelperNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressController1?.dispose();
    nameFieldController?.dispose();
    emailAddressController2?.dispose();
    emailAddressController3?.dispose();
    chatFieldController?.dispose();
    userProfileModel.dispose();
    helperNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
