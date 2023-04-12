import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_box/chat_box_widget.dart';
import '/components/chat_interface/chat_interface_widget.dart';
import '/components/input/input_widget.dart';
import '/components/new_sheet/new_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnecthealthcareModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? language = 'none';

  String? profession = 'none';

  bool? isQA = true;

  bool? isChat = true;

  ChatsRecord? chat;

  MessagesRecord? messages;

  bool? filtering = false;

  bool? chatting = false;

  bool? showFAB = true;

  bool? closeChat = false;

  bool? isEdit = false;

  bool? isNew = false;

  ProfessionalsRecord? professionalToEdit;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Bottom Sheet - newSheet] action in FloatingActionButton widget.
  List<bool>? isQandA;
  // Model for input component.
  late InputModel inputModel1;
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
  // Model for chatInterface component.
  late ChatInterfaceModel chatInterfaceModel;
  // Model for chatBox component.
  late ChatBoxModel chatBoxModel;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputModel1 = createModel(context, () => InputModel());
    inputModel2 = createModel(context, () => InputModel());
    chatInterfaceModel = createModel(context, () => ChatInterfaceModel());
    chatBoxModel = createModel(context, () => ChatBoxModel());
  }

  void dispose() {
    inputModel1.dispose();
    inputModel2.dispose();
    chatInterfaceModel.dispose();
    chatBoxModel.dispose();
    emailAddressController?.dispose();
  }

  /// Additional helper methods are added here.

}
