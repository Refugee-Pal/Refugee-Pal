import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_box/chat_box_widget.dart';
import '/components/input/input_widget.dart';
import '/components/new_sheet/new_sheet_widget.dart';
import '/components/user_profile/user_profile_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:url_launcher/url_launcher.dart';

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

  bool? isEdit = false;

  bool? isNew = false;

  ProfessionalsRecord? professionalToEdit;

  bool? isShowAll = true;

  bool? isDialogue = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Model for input component.
  late InputModel inputModel1;
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
  // Model for input component.
  late InputModel inputModel2;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
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
  ScrollController? columnController2;
  // State field(s) for chatList widget.
  ScrollController? chatList;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;
  // Model for chatBox component.
  late ChatBoxModel chatBoxModel;
  // State field(s) for ListView widget.
  ScrollController? listViewController4;
  // Model for userProfile component.
  late UserProfileModel userProfileModel;
  // Stores action output result for [Bottom Sheet - newSheet] action in IconButton widget.
  List<bool>? isQandA;
  // State field(s) for HealthcareCr widget.
  ScrollController? healthcareCr;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for Column widget.
  ScrollController? columnController4;
  // State field(s) for ListView widget.
  ScrollController? listViewController5;
  // State field(s) for Column widget.
  ScrollController? columnController5;
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
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Model for refugeeNavBar component.
  late RefugeeNavBarModel refugeeNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController1 = ScrollController();
    inputModel1 = createModel(context, () => InputModel());
    listViewController1 = ScrollController();
    inputModel2 = createModel(context, () => InputModel());
    listViewController2 = ScrollController();
    columnController2 = ScrollController();
    chatList = ScrollController();
    listViewController3 = ScrollController();
    chatBoxModel = createModel(context, () => ChatBoxModel());
    listViewController4 = ScrollController();
    userProfileModel = createModel(context, () => UserProfileModel());
    healthcareCr = ScrollController();
    columnController3 = ScrollController();
    columnController4 = ScrollController();
    listViewController5 = ScrollController();
    columnController5 = ScrollController();
    refugeeNavBarModel = createModel(context, () => RefugeeNavBarModel());
  }

  void dispose() {
    columnController1?.dispose();
    inputModel1.dispose();
    listViewController1?.dispose();
    inputModel2.dispose();
    emailAddressController1?.dispose();
    listViewController2?.dispose();
    columnController2?.dispose();
    chatList?.dispose();
    listViewController3?.dispose();
    chatBoxModel.dispose();
    listViewController4?.dispose();
    userProfileModel.dispose();
    healthcareCr?.dispose();
    columnController3?.dispose();
    columnController4?.dispose();
    listViewController5?.dispose();
    columnController5?.dispose();
    emailAddressController2?.dispose();
    emailAddressController3?.dispose();
    emailAddressController4?.dispose();
    emailAddressController5?.dispose();
    emailAddressController6?.dispose();
    refugeeNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
