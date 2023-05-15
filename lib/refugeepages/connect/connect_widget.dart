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
import 'connect_model.dart';
export 'connect_model.dart';

class ConnectWidget extends StatefulWidget {
  const ConnectWidget({
    Key? key,
    this.chatToLoad,
    this.messagesToLoad,
    required this.professionToLoad,
  }) : super(key: key);

  final ChatsRecord? chatToLoad;
  final List<MessagesRecord>? messagesToLoad;
  final String? professionToLoad;

  @override
  _ConnectWidgetState createState() => _ConnectWidgetState();
}

class _ConnectWidgetState extends State<ConnectWidget> {
  late ConnectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.chatToLoad != null) {
        setState(() {
          _model.chatting = true;
          _model.chat = widget.chatToLoad;
          _model.isQA = true;
        });
      }
      await _model.chatList?.animateTo(
        _model.chatList!.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });

    _model.emailAddressController1 ??= TextEditingController();
    _model.emailAddressController2 ??= TextEditingController();
    _model.chatFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<UserRecord> connectUserRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 30.0,
                ),
                onPressed: () async {
                  if (_model.chatting!) {
                    setState(() {
                      _model.chatting = false;
                    });
                  } else {
                    context.pop();
                  }
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '8wdg9w47' /* Connect */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: FaIcon(
                    FontAwesomeIcons.cog,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('settings');
                  },
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<LanguagesRecord>>(
                  stream: queryLanguagesRecord(
                    queryBuilder: (languagesRecord) => languagesRecord.where(
                        'Name',
                        isEqualTo:
                            valueOrDefault(currentUserDocument?.name, '')),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitPulse(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<LanguagesRecord> stackLanguagesRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final stackLanguagesRecord =
                        stackLanguagesRecordList.isNotEmpty
                            ? stackLanguagesRecordList.first
                            : null;
                    return Stack(
                      children: [
                        StreamBuilder<List<Translations18Record>>(
                          stream: queryTranslations18Record(
                            parent: _model.chat!.reference,
                            limit: 1,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<Translations18Record>
                                blurTranslations18RecordList = snapshot.data!;
                            return ClipRect(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 0.0,
                                  sigmaY: 0.0,
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: DefaultTabController(
                                        length: 2,
                                        initialIndex: min(
                                            valueOrDefault<int>(
                                              widget.professionToLoad != 'none'
                                                  ? 1
                                                  : 0,
                                              0,
                                            ),
                                            1),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 17.0,
                                                        ),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                tabs: [
                                                  Tab(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'zwydjgx2' /* Chats */,
                                                    ),
                                                  ),
                                                  Tab(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'u8ih4uo7' /* Find Professionals */,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) => Stack(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            if (_model.isQandA
                                                                    ?.first ==
                                                                true)
                                                              Form(
                                                                key: _model
                                                                    .formKey1,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .disabled,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    controller:
                                                                        _model
                                                                            .columnController1,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              25.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.inputModel,
                                                                            updateCallback: () =>
                                                                                setState(() {}),
                                                                            child:
                                                                                InputWidget(
                                                                              inputname: 'Question',
                                                                              callBack: () async {},
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                40.0,
                                                                                0.0,
                                                                                20.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'd3tgc8z3' /* Which categories do your quest... */,
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).titleLarge,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        FutureBuilder<
                                                                            List<CategoryRecord>>(
                                                                          future:
                                                                              queryCategoryRecordOnce(),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: SpinKitPulse(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 50.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<CategoryRecord>
                                                                                listViewCategoryRecordList =
                                                                                snapshot.data!;
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewCategoryRecordList.length,
                                                                              itemBuilder: (context, listViewIndex) {
                                                                                final listViewCategoryRecord = listViewCategoryRecordList[listViewIndex];
                                                                                return StreamBuilder<List<Translations7Record>>(
                                                                                  stream: queryTranslations7Record(
                                                                                    parent: listViewCategoryRecord.reference,
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: SpinKitPulse(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 50.0,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<Translations7Record> blurTranslations7RecordList = snapshot.data!;
                                                                                    return ClipRect(
                                                                                      child: ImageFiltered(
                                                                                        imageFilter: ImageFilter.blur(
                                                                                          sigmaX: 0.0,
                                                                                          sigmaY: 0.0,
                                                                                        ),
                                                                                        child: Theme(
                                                                                          data: ThemeData(
                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(25),
                                                                                              ),
                                                                                            ),
                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                          ),
                                                                                          child: CheckboxListTile(
                                                                                            value: _model.checkboxListTileValueMap1[listViewCategoryRecord] ??= false,
                                                                                            onChanged: (newValue) async {
                                                                                              setState(() => _model.checkboxListTileValueMap1[listViewCategoryRecord] = newValue!);
                                                                                            },
                                                                                            title: Text(
                                                                                              valueOrDefault<String>(
                                                                                                stackLanguagesRecord!.name != 'English' ? blurTranslations7RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : listViewCategoryRecord.title,
                                                                                                'no value',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                            dense: false,
                                                                                            controlAffinity: ListTileControlAffinity.trailing,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              controller: _model.listViewController1,
                                                                            );
                                                                          },
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 15.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    if (_model.checkboxListTileCheckedItems1.length > 0) {
                                                                                      if (_model.inputModel.emailAddressController.text == null || _model.inputModel.emailAddressController.text == '') {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'No question name provided',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        final chatsCreateData = {
                                                                                          ...createChatsRecordData(
                                                                                            name: _model.inputModel.emailAddressController.text,
                                                                                            type: 'QA',
                                                                                          ),
                                                                                          'users': [
                                                                                            valueOrDefault(currentUserDocument?.name, '')
                                                                                          ],
                                                                                          'categories': _model.checkboxListTileCheckedItems1.map((e) => e.title).withoutNulls.toList(),
                                                                                          'preexistingTimestamps': [
                                                                                            'placeholder'
                                                                                          ],
                                                                                        };
                                                                                        var chatsRecordReference = ChatsRecord.collection.doc();
                                                                                        await chatsRecordReference.set(chatsCreateData);
                                                                                        _model.newQChat = ChatsRecord.getDocumentFromData(chatsCreateData, chatsRecordReference);

                                                                                        final messagesCreateData = createMessagesRecordData(
                                                                                          text: 'Created chat',
                                                                                        );
                                                                                        var messagesRecordReference = MessagesRecord.createDoc(_model.newQChat!.reference);
                                                                                        await messagesRecordReference.set(messagesCreateData);
                                                                                        _model.newQMessages = MessagesRecord.getDocumentFromData(messagesCreateData, messagesRecordReference);
                                                                                        setState(() {
                                                                                          _model.chat = _model.newQChat;
                                                                                          _model.messages = _model.newQMessages;
                                                                                          _model.chatting = true;
                                                                                          _model.closeChat = true;
                                                                                        });
                                                                                      }

                                                                                      await _model.chatList?.animateTo(
                                                                                        _model.chatList!.position.maxScrollExtent,
                                                                                        duration: Duration(milliseconds: 1000),
                                                                                        curve: Curves.ease,
                                                                                      );
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Must select at least 1 category',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    setState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '1v9fgrzl' /* Submit Question */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: 130.0,
                                                                                    height: 50.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((_model.isQandA
                                                                        ?.first ==
                                                                    false) ||
                                                                _model
                                                                    .isAddPeople!)
                                                              Form(
                                                                key: _model
                                                                    .formKey2,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .disabled,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  controller: _model
                                                                      .columnController2,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (_model.isAddPeople ?? true)
                                                                                  StreamBuilder<ChatsRecord>(
                                                                                    stream: ChatsRecord.getDocument(_model.chat!.reference),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 50.0,
                                                                                            height: 50.0,
                                                                                            child: SpinKitPulse(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 50.0,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      final wrapChatsRecord = snapshot.data!;
                                                                                      return Wrap(
                                                                                        spacing: 0.0,
                                                                                        runSpacing: 0.0,
                                                                                        alignment: WrapAlignment.start,
                                                                                        crossAxisAlignment: WrapCrossAlignment.start,
                                                                                        direction: Axis.horizontal,
                                                                                        runAlignment: WrapAlignment.start,
                                                                                        verticalDirection: VerticalDirection.down,
                                                                                        clipBehavior: Clip.none,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 40.0, 5.0, 0.0),
                                                                                            child: TextFormField(
                                                                                              controller: _model.nameFieldController ??= TextEditingController(
                                                                                                text: wrapChatsRecord.name,
                                                                                              ),
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  'ca38l2ov' /* Chat name */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: Color(0xFF57636C),
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: Color(0xFF57636C),
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0xFFDBE2E7),
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: Colors.white,
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 15.0,
                                                                                                  ),
                                                                                              maxLines: null,
                                                                                              validator: _model.nameFieldControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                if (!_model.isAddPeople!)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                    child: TextFormField(
                                                                                      controller: _model.emailAddressController1,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          'yqdeq4tg' /* Name your chat */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0xFFDBE2E7),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: Colors.white,
                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 15.0,
                                                                                          ),
                                                                                      maxLines: null,
                                                                                      validator: _model.emailAddressController1Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '38iynzcp' /* Add people */,
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).titleLarge,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
                                                                                child: Stack(
                                                                                  children: [
                                                                                    TextFormField(
                                                                                      controller: _model.emailAddressController2,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                          'aps5bki4' /* Search... */,
                                                                                        ),
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: Color(0xFF57636C),
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0xFFDBE2E7),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 2.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: Colors.white,
                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      maxLines: null,
                                                                                      validator: _model.emailAddressController2Validator.asValidator(context),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 30.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 60.0,
                                                                                        icon: FaIcon(
                                                                                          FontAwesomeIcons.search,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 25.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          setState(() {
                                                                                            _model.simpleSearchResults = TextSearch(
                                                                                              connectUserRecordList
                                                                                                  .map(
                                                                                                    (record) => TextSearchItem(record, [record.name!]),
                                                                                                  )
                                                                                                  .toList(),
                                                                                            ).search(_model.emailAddressController2.text).map((r) => r.object).toList();
                                                                                          });
                                                                                          setState(() {
                                                                                            _model.isShowAll = false;
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.68, 0.0),
                                                                                      child: FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 30.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 60.0,
                                                                                        icon: Icon(
                                                                                          Icons.close_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 30.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          setState(() {
                                                                                            _model.isShowAll = true;
                                                                                          });
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final people = (_model.isShowAll! ? connectUserRecordList : _model.simpleSearchResults).toList();
                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: people.length,
                                                                                    itemBuilder: (context, peopleIndex) {
                                                                                      final peopleItem = people[peopleIndex];
                                                                                      return Card(
                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(25.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  peopleItem.photoUrl != null && peopleItem.photoUrl != '' ? peopleItem.photoUrl! : 'https://picsum.photos/seed/862/600',
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: StreamBuilder<List<Translations14Record>>(
                                                                                                  stream: queryTranslations14Record(
                                                                                                    parent: peopleItem.reference,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 50.0,
                                                                                                          height: 50.0,
                                                                                                          child: SpinKitPulse(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 50.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<Translations14Record> checkboxListTileTranslations14RecordList = snapshot.data!;
                                                                                                    return Theme(
                                                                                                      data: ThemeData(
                                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(25),
                                                                                                          ),
                                                                                                        ),
                                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                                      ),
                                                                                                      child: CheckboxListTile(
                                                                                                        value: _model.checkboxListTileValueMap2[peopleItem] ??= () {
                                                                                                          if (!_model.isAddPeople!) {
                                                                                                            return false;
                                                                                                          } else if (_model.chat!.users!.toList().contains(peopleItem.name)) {
                                                                                                            return true;
                                                                                                          } else {
                                                                                                            return false;
                                                                                                          }
                                                                                                        }(),
                                                                                                        onChanged: (newValue) async {
                                                                                                          setState(() => _model.checkboxListTileValueMap2[peopleItem] = newValue!);
                                                                                                        },
                                                                                                        title: Text(
                                                                                                          peopleItem.name!,
                                                                                                          style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                        ),
                                                                                                        subtitle: Text(
                                                                                                          () {
                                                                                                            if (valueOrDefault(currentUserDocument?.isRefugee, '') == 'true') {
                                                                                                              return 'Refugee';
                                                                                                            } else if (peopleItem.displayName != null && peopleItem.displayName != '') {
                                                                                                              return valueOrDefault<String>(
                                                                                                                stackLanguagesRecord!.name != 'English' ? checkboxListTileTranslations14RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : peopleItem.displayName,
                                                                                                                'n',
                                                                                                              );
                                                                                                            } else {
                                                                                                              return 'Helper';
                                                                                                            }
                                                                                                          }(),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                        ),
                                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        dense: false,
                                                                                                        controlAffinity: ListTileControlAffinity.trailing,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                    controller: _model.listViewController2,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 100.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        if (_model.isAddPeople!) {
                                                                                          final chatsUpdateData = {
                                                                                            ...createChatsRecordData(
                                                                                              name: _model.nameFieldController.text,
                                                                                            ),
                                                                                            'users': (List<String> var1, String var2) {
                                                                                              return var1 + [var2];
                                                                                            }(_model.checkboxListTileCheckedItems2.map((e) => e.name).withoutNulls.toList(), valueOrDefault(currentUserDocument?.name, '')),
                                                                                          };
                                                                                          await _model.chat!.reference.update(chatsUpdateData);
                                                                                          setState(() {
                                                                                            _model.chatting = true;
                                                                                            _model.isAddPeople = false;
                                                                                          });

                                                                                          context.goNamed(
                                                                                            'connect',
                                                                                            queryParams: {
                                                                                              'chatToLoad': serializeParam(
                                                                                                _model.chat,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                              'professionToLoad': serializeParam(
                                                                                                'none',
                                                                                                ParamType.String,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'chatToLoad': _model.chat,
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          if (_model.checkboxListTileCheckedItems2.length > 1) {
                                                                                            final chatsCreateData1 = {
                                                                                              ...createChatsRecordData(
                                                                                                name: _model.emailAddressController1.text,
                                                                                                type: 'GC',
                                                                                              ),
                                                                                              'users': (List<String> var1, String var2) {
                                                                                                return var1 + [var2];
                                                                                              }(_model.checkboxListTileCheckedItems2.map((e) => e.name).withoutNulls.toList(), valueOrDefault(currentUserDocument?.name, '')),
                                                                                              'preexistingTimestamps': ['placeholder'],
                                                                                            };
                                                                                            var chatsRecordReference1 = ChatsRecord.collection.doc();
                                                                                            await chatsRecordReference1.set(chatsCreateData1);
                                                                                            _model.newChat1 = ChatsRecord.getDocumentFromData(chatsCreateData1, chatsRecordReference1);

                                                                                            final messagesCreateData1 = createMessagesRecordData(
                                                                                              text: 'Created chat',
                                                                                            );
                                                                                            var messagesRecordReference1 = MessagesRecord.createDoc(_model.newChat1!.reference);
                                                                                            await messagesRecordReference1.set(messagesCreateData1);
                                                                                            _model.messageDoc1 = MessagesRecord.getDocumentFromData(messagesCreateData1, messagesRecordReference1);
                                                                                            setState(() {
                                                                                              _model.chat = _model.newChat1;
                                                                                              _model.messages = _model.messageDoc1;
                                                                                              _model.chatting = true;
                                                                                              _model.closeChat = true;
                                                                                            });
                                                                                          } else {
                                                                                            final chatsCreateData2 = {
                                                                                              ...createChatsRecordData(
                                                                                                type: 'DM',
                                                                                              ),
                                                                                              'users': (List<String> var1, String var2) {
                                                                                                return var1 + [var2];
                                                                                              }(_model.checkboxListTileCheckedItems2.map((e) => e.name).withoutNulls.toList(), valueOrDefault(currentUserDocument?.name, '')),
                                                                                              'preexistingTimestamps': ['placeholder'],
                                                                                            };
                                                                                            var chatsRecordReference2 = ChatsRecord.collection.doc();
                                                                                            await chatsRecordReference2.set(chatsCreateData2);
                                                                                            _model.newChat2 = ChatsRecord.getDocumentFromData(chatsCreateData2, chatsRecordReference2);

                                                                                            final messagesCreateData2 = createMessagesRecordData(
                                                                                              text: 'Created chat',
                                                                                            );
                                                                                            var messagesRecordReference2 = MessagesRecord.createDoc(_model.newChat2!.reference);
                                                                                            await messagesRecordReference2.set(messagesCreateData2);
                                                                                            _model.messageDoc2 = MessagesRecord.getDocumentFromData(messagesCreateData2, messagesRecordReference2);
                                                                                            setState(() {
                                                                                              _model.chat = _model.newChat2;
                                                                                              _model.messages = _model.messageDoc2;
                                                                                              _model.chatting = true;
                                                                                              _model.closeChat = true;
                                                                                            });
                                                                                          }
                                                                                        }

                                                                                        await _model.chatList?.animateTo(
                                                                                          _model.chatList!.position.maxScrollExtent,
                                                                                          duration: Duration(milliseconds: 1000),
                                                                                          curve: Curves.ease,
                                                                                        );

                                                                                        setState(() {});
                                                                                      },
                                                                                      text: _model.isAddPeople! ? 'Save changes' : (_model.checkboxListTileCheckedItems2.length > 1 ? 'Create Group Chat' : 'Create Direct Message'),
                                                                                      options: FFButtonOptions(
                                                                                        width: double.infinity,
                                                                                        height: 50.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        if (_model.chatting ??
                                                            true)
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 300.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 622.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                ),
                                                                                child: SingleChildScrollView(
                                                                                  controller: _model.columnController3,
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 150.0, 10.0, 0.0),
                                                                                        child: StreamBuilder<List<MessagesRecord>>(
                                                                                          stream: queryMessagesRecord(
                                                                                            parent: _model.chat!.reference,
                                                                                            queryBuilder: (messagesRecord) => messagesRecord.orderBy('time'),
                                                                                          ),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 50.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<MessagesRecord> chatListMessagesRecordList = snapshot.data!;
                                                                                            return ListView.builder(
                                                                                              padding: EdgeInsets.zero,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.vertical,
                                                                                              itemCount: chatListMessagesRecordList.length,
                                                                                              itemBuilder: (context, chatListIndex) {
                                                                                                final chatListMessagesRecord = chatListMessagesRecordList[chatListIndex];
                                                                                                return InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onLongPress: () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 200));
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      enableDrag: false,
                                                                                                      context: context,
                                                                                                      builder: (bottomSheetContext) {
                                                                                                        return GestureDetector(
                                                                                                          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                          child: Padding(
                                                                                                            padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                            child: Material2ActionSheetSimpleWidget(
                                                                                                              messageToLoad: chatListMessagesRecord,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          if (chatListMessagesRecord.showTime ?? true)
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                dateTimeFormat(
                                                                                                                  'M/d h:mm a',
                                                                                                                  chatListMessagesRecord.time,
                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                ),
                                                                                                                'Loading...',
                                                                                                              ),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                            ),
                                                                                                          if (chatListMessagesRecord.showName ?? true)
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    StreamBuilder<List<UserRecord>>(
                                                                                                                      stream: queryUserRecord(
                                                                                                                        queryBuilder: (userRecord) => userRecord.where('name', isEqualTo: chatListMessagesRecord.user),
                                                                                                                        singleRecord: true,
                                                                                                                      ),
                                                                                                                      builder: (context, snapshot) {
                                                                                                                        // Customize what your widget looks like when it's loading.
                                                                                                                        if (!snapshot.hasData) {
                                                                                                                          return Center(
                                                                                                                            child: SizedBox(
                                                                                                                              width: 50.0,
                                                                                                                              height: 50.0,
                                                                                                                              child: SpinKitPulse(
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                size: 50.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        }
                                                                                                                        List<UserRecord> rowUserRecordList = snapshot.data!;
                                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                                          return Container();
                                                                                                                        }
                                                                                                                        final rowUserRecord = rowUserRecordList.isNotEmpty ? rowUserRecordList.first : null;
                                                                                                                        return InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            _model.updatePage(() {
                                                                                                                              FFAppState().isViewingProfile = true;
                                                                                                                              FFAppState().profileToShow = rowUserRecord!.reference;
                                                                                                                            });
                                                                                                                          },
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Container(
                                                                                                                                width: 40.0,
                                                                                                                                height: 40.0,
                                                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                ),
                                                                                                                                child: Image.network(
                                                                                                                                  rowUserRecord!.photoUrl!,
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    chatListMessagesRecord.user,
                                                                                                                                    'Loading...',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Stack(
                                                                                                                children: [
                                                                                                                  if (chatListMessagesRecord.text != null && chatListMessagesRecord.text != '')
                                                                                                                    Stack(
                                                                                                                      children: [
                                                                                                                        if (chatListMessagesRecord.user != valueOrDefault(currentUserDocument?.name, ''))
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                            child: Container(
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxWidth: MediaQuery.of(context).size.width * 0.85,
                                                                                                                                maxHeight: 90.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                borderRadius: BorderRadius.circular(25.0),
                                                                                                                                border: Border.all(
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  width: 2.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 5.0, 7.0, 5.0),
                                                                                                                                child: SelectionArea(
                                                                                                                                    child: Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    chatListMessagesRecord.text,
                                                                                                                                    'Loading...',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Inter',
                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      ),
                                                                                                                                )),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        if (chatListMessagesRecord.user == valueOrDefault(currentUserDocument?.name, ''))
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                            child: Container(
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxWidth: MediaQuery.of(context).size.width * 0.85,
                                                                                                                                maxHeight: 90.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                borderRadius: BorderRadius.circular(25.0),
                                                                                                                                border: Border.all(
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  width: 2.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                                                child: SelectionArea(
                                                                                                                                    child: Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    chatListMessagesRecord.text,
                                                                                                                                    'Loading...',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Inter',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      ),
                                                                                                                                )),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  if (chatListMessagesRecord.text == null || chatListMessagesRecord.text == '')
                                                                                                                    Material(
                                                                                                                      color: Colors.transparent,
                                                                                                                      elevation: 2.0,
                                                                                                                      shape: RoundedRectangleBorder(
                                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                                      ),
                                                                                                                      child: ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                                        child: Container(
                                                                                                                          constraints: BoxConstraints(
                                                                                                                            maxWidth: 290.0,
                                                                                                                            maxHeight: 175.0,
                                                                                                                          ),
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                                          ),
                                                                                                                          child: Stack(
                                                                                                                            children: [
                                                                                                                              if (chatListMessagesRecord.videoPath != null && chatListMessagesRecord.videoPath != '')
                                                                                                                                FlutterFlowVideoPlayer(
                                                                                                                                  path: chatListMessagesRecord.videoPath!,
                                                                                                                                  videoType: VideoType.network,
                                                                                                                                  width: 290.0,
                                                                                                                                  autoPlay: false,
                                                                                                                                  looping: true,
                                                                                                                                  showControls: true,
                                                                                                                                  allowFullScreen: true,
                                                                                                                                  allowPlaybackSpeedMenu: true,
                                                                                                                                ),
                                                                                                                              if (chatListMessagesRecord.imgPath != null && chatListMessagesRecord.imgPath != '')
                                                                                                                                Align(
                                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                                  child: InkWell(
                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                    onTap: () async {
                                                                                                                                      await Navigator.push(
                                                                                                                                        context,
                                                                                                                                        PageTransition(
                                                                                                                                          type: PageTransitionType.fade,
                                                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                                                            image: Image.network(
                                                                                                                                              chatListMessagesRecord.imgPath!,
                                                                                                                                              fit: BoxFit.contain,
                                                                                                                                            ),
                                                                                                                                            allowRotation: false,
                                                                                                                                            tag: chatListMessagesRecord.imgPath!,
                                                                                                                                            useHeroAnimation: true,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                    child: Hero(
                                                                                                                                      tag: chatListMessagesRecord.imgPath!,
                                                                                                                                      transitionOnUserGestures: true,
                                                                                                                                      child: Image.network(
                                                                                                                                        chatListMessagesRecord.imgPath!,
                                                                                                                                        width: 290.0,
                                                                                                                                        fit: BoxFit.cover,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    if ((valueOrDefault(currentUserDocument?.isRefugee, '') == 'true') && chatListMessagesRecord.isAnswer!)
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 5.0, 5.0),
                                                                                                                          child: FaIcon(
                                                                                                                            FontAwesomeIcons.mapPin,
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            size: 25.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          StreamBuilder<List<MessagesRecord>>(
                                                                                                            stream: queryMessagesRecord(
                                                                                                              parent: _model.chat!.reference,
                                                                                                              queryBuilder: (messagesRecord) => messagesRecord.orderBy('time', descending: true),
                                                                                                              singleRecord: true,
                                                                                                            ),
                                                                                                            builder: (context, snapshot) {
                                                                                                              // Customize what your widget looks like when it's loading.
                                                                                                              if (!snapshot.hasData) {
                                                                                                                return Center(
                                                                                                                  child: SizedBox(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    child: SpinKitPulse(
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      size: 50.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }
                                                                                                              List<MessagesRecord> wrapMessagesRecordList = snapshot.data!;
                                                                                                              // Return an empty Container when the item does not exist.
                                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                                return Container();
                                                                                                              }
                                                                                                              final wrapMessagesRecord = wrapMessagesRecordList.isNotEmpty ? wrapMessagesRecordList.first : null;
                                                                                                              return Wrap(
                                                                                                                spacing: 0.0,
                                                                                                                runSpacing: 0.0,
                                                                                                                alignment: WrapAlignment.start,
                                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                direction: Axis.horizontal,
                                                                                                                runAlignment: WrapAlignment.start,
                                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                                clipBehavior: Clip.none,
                                                                                                                children: [
                                                                                                                  Visibility(
                                                                                                                    visible: wrapMessagesRecord!.reference.id == chatListMessagesRecord.reference.id,
                                                                                                                    child: Container(
                                                                                                                      width: 100.0,
                                                                                                                      height: 100.0,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              controller: _model.chatList,
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 1.0,
                                                                              constraints: BoxConstraints(
                                                                                maxHeight: double.infinity,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 5.0, 5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    StreamBuilder<List<UserRecord>>(
                                                                                      stream: queryUserRecord(
                                                                                        queryBuilder: (userRecord) => userRecord.whereIn('name', _model.chat!.users!.toList()),
                                                                                        singleRecord: true,
                                                                                      ),
                                                                                      builder: (context, snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot.hasData) {
                                                                                          return Center(
                                                                                            child: SizedBox(
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              child: SpinKitPulse(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 50.0,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        List<UserRecord> circleImageUserRecordList = snapshot.data!;
                                                                                        // Return an empty Container when the item does not exist.
                                                                                        if (snapshot.data!.isEmpty) {
                                                                                          return Container();
                                                                                        }
                                                                                        final circleImageUserRecord = circleImageUserRecordList.isNotEmpty ? circleImageUserRecordList.first : null;
                                                                                        return InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            if (_model.chat!.type == 'DM') {
                                                                                              _model.updatePage(() {
                                                                                                FFAppState().isViewingProfile = true;
                                                                                              });
                                                                                            }
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 50.0,
                                                                                            height: 50.0,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              valueOrDefault<String>(
                                                                                                circleImageUserRecord!.photoUrl,
                                                                                                'https://picsum.photos/seed/486/600',
                                                                                              ),
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 3.0, 0.0, 3.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width * 0.68,
                                                                                              constraints: BoxConstraints(
                                                                                                maxHeight: 46.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(),
                                                                                              child: AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  (_model.chat!.type == 'GC') || (_model.chat!.type == 'QA')
                                                                                                      ? valueOrDefault<String>(
                                                                                                          (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? blurTranslations18RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : _model.chat!.name,
                                                                                                          'no value',
                                                                                                        )
                                                                                                      : connectUserRecordList.first.name,
                                                                                                  'Loading...',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  () {
                                                                                                    if (_model.chat!.type == 'GC') {
                                                                                                      return '${connectUserRecordList.first.name} & ${(connectUserRecordList.length - 2).toString()} others';
                                                                                                    } else if (_model.chat!.type == 'QA') {
                                                                                                      return connectUserRecordList.first.name;
                                                                                                    } else {
                                                                                                      return ('Direct Message');
                                                                                                    }
                                                                                                  }(),
                                                                                                  'aa',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodySmall,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Stack(
                                                                                      children: [
                                                                                        if (_model.chat!.type != 'QA')
                                                                                          FlutterFlowIconButton(
                                                                                            borderColor: Colors.transparent,
                                                                                            borderRadius: 30.0,
                                                                                            borderWidth: 1.0,
                                                                                            buttonSize: 50.0,
                                                                                            icon: Icon(
                                                                                              Icons.people_alt,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 25.0,
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              setState(() {
                                                                                                _model.isAddPeople = true;
                                                                                                _model.chatting = false;
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        if (_model.chat!.type == 'DM')
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: FlutterFlowIconButton(
                                                                                              borderColor: Colors.transparent,
                                                                                              borderRadius: 30.0,
                                                                                              borderWidth: 1.0,
                                                                                              buttonSize: 50.0,
                                                                                              icon: Icon(
                                                                                                Icons.delete_rounded,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  enableDrag: false,
                                                                                                  context: context,
                                                                                                  builder: (bottomSheetContext) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                        child: DeleteConfirmationWidget(
                                                                                                          thingToDelete: 'direct message',
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => setState(() => _model.toDelete = value));

                                                                                                if (_model.toDelete!) {
                                                                                                  await _model.chat!.reference.delete();
                                                                                                  setState(() {
                                                                                                    _model.chatting = false;
                                                                                                  });
                                                                                                }

                                                                                                setState(() {});
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        if (_model.chat!.type == 'QA')
                                                                                          StreamBuilder<UserRecord>(
                                                                                            stream: UserRecord.getDocument(currentUserReference!),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 50.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              final toggleIconUserRecord = snapshot.data!;
                                                                                              return ToggleIcon(
                                                                                                onPressed: () async {
                                                                                                  final pinnedElement = _model.chat!.name;
                                                                                                  final pinnedUpdate = toggleIconUserRecord.pinned!.toList().contains(pinnedElement) ? FieldValue.arrayRemove([pinnedElement]) : FieldValue.arrayUnion([pinnedElement]);
                                                                                                  final userUpdateData = {
                                                                                                    'pinned': pinnedUpdate,
                                                                                                  };
                                                                                                  await toggleIconUserRecord.reference.update(userUpdateData);
                                                                                                },
                                                                                                value: toggleIconUserRecord.pinned!.toList().contains(_model.chat!.name),
                                                                                                onIcon: FaIcon(
                                                                                                  FontAwesomeIcons.mapPin,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 25.0,
                                                                                                ),
                                                                                                offIcon: FaIcon(
                                                                                                  FontAwesomeIcons.mapPin,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (_model.chat!.type ==
                                                                                'QA')
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 2.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(20.0),
                                                                                      bottomRight: Radius.circular(20.0),
                                                                                      topLeft: Radius.circular(0.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(20.0),
                                                                                      bottomRight: Radius.circular(20.0),
                                                                                      topLeft: Radius.circular(0.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: MediaQuery.of(context).size.width * 1.0,
                                                                                      constraints: BoxConstraints(
                                                                                        maxWidth: double.infinity,
                                                                                        maxHeight: double.infinity,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(20.0),
                                                                                          bottomRight: Radius.circular(20.0),
                                                                                          topLeft: Radius.circular(0.0),
                                                                                          topRight: Radius.circular(0.0),
                                                                                        ),
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        color: Colors.white,
                                                                                        child: ExpandableNotifier(
                                                                                          initialExpanded: false,
                                                                                          child: ExpandablePanel(
                                                                                            header: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'u2cdugpz' /* View Answers */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 17.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            collapsed: Container(),
                                                                                            expanded: Container(
                                                                                              width: double.infinity,
                                                                                              constraints: BoxConstraints(
                                                                                                maxHeight: 400.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                child: StreamBuilder<List<MessagesRecord>>(
                                                                                                  stream: queryMessagesRecord(
                                                                                                    parent: _model.chat!.reference,
                                                                                                    queryBuilder: (messagesRecord) => messagesRecord.where('isAnswer', isEqualTo: true).orderBy('time'),
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 50.0,
                                                                                                          height: 50.0,
                                                                                                          child: SpinKitPulse(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 50.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<MessagesRecord> listViewMessagesRecordList = snapshot.data!;
                                                                                                    if (listViewMessagesRecordList.isEmpty) {
                                                                                                      return NoAnswersYetWidget();
                                                                                                    }
                                                                                                    return ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: listViewMessagesRecordList.length,
                                                                                                      itemBuilder: (context, listViewIndex) {
                                                                                                        final listViewMessagesRecord = listViewMessagesRecordList[listViewIndex];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  dateTimeFormat(
                                                                                                                    'M/d h:mm a',
                                                                                                                    listViewMessagesRecord.time!,
                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                  ),
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        _model.updatePage(() {
                                                                                                                          FFAppState().isViewingProfile = true;
                                                                                                                        });
                                                                                                                      },
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          StreamBuilder<List<UserRecord>>(
                                                                                                                            stream: queryUserRecord(
                                                                                                                              queryBuilder: (userRecord) => userRecord.where('name', isEqualTo: listViewMessagesRecord.user),
                                                                                                                              singleRecord: true,
                                                                                                                            ),
                                                                                                                            builder: (context, snapshot) {
                                                                                                                              // Customize what your widget looks like when it's loading.
                                                                                                                              if (!snapshot.hasData) {
                                                                                                                                return Center(
                                                                                                                                  child: SizedBox(
                                                                                                                                    width: 50.0,
                                                                                                                                    height: 50.0,
                                                                                                                                    child: SpinKitPulse(
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      size: 50.0,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              }
                                                                                                                              List<UserRecord> circleImageUserRecordList = snapshot.data!;
                                                                                                                              // Return an empty Container when the item does not exist.
                                                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                                                return Container();
                                                                                                                              }
                                                                                                                              final circleImageUserRecord = circleImageUserRecordList.isNotEmpty ? circleImageUserRecordList.first : null;
                                                                                                                              return Container(
                                                                                                                                width: 40.0,
                                                                                                                                height: 40.0,
                                                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  shape: BoxShape.circle,
                                                                                                                                ),
                                                                                                                                child: Image.network(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    circleImageUserRecord!.photoUrl,
                                                                                                                                    'https://picsum.photos/seed/486/600',
                                                                                                                                  ),
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              listViewMessagesRecord.user!,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Stack(
                                                                                                                children: [
                                                                                                                  if (listViewMessagesRecord.text != null && listViewMessagesRecord.text != '')
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                                                      child: SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        listViewMessagesRecord.text!,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                      )),
                                                                                                                    ),
                                                                                                                  ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                                    child: Container(
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                                      ),
                                                                                                                      child: Stack(
                                                                                                                        children: [
                                                                                                                          if (listViewMessagesRecord.imgPath != null && listViewMessagesRecord.imgPath != '')
                                                                                                                            InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                await Navigator.push(
                                                                                                                                  context,
                                                                                                                                  PageTransition(
                                                                                                                                    type: PageTransitionType.fade,
                                                                                                                                    child: FlutterFlowExpandedImageView(
                                                                                                                                      image: Image.network(
                                                                                                                                        listViewMessagesRecord.imgPath!,
                                                                                                                                        fit: BoxFit.contain,
                                                                                                                                      ),
                                                                                                                                      allowRotation: false,
                                                                                                                                      tag: listViewMessagesRecord.imgPath!,
                                                                                                                                      useHeroAnimation: true,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Hero(
                                                                                                                                tag: listViewMessagesRecord.imgPath!,
                                                                                                                                transitionOnUserGestures: true,
                                                                                                                                child: Image.network(
                                                                                                                                  listViewMessagesRecord.imgPath!,
                                                                                                                                  width: 290.0,
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          if (listViewMessagesRecord.videoPath != null && listViewMessagesRecord.videoPath != '')
                                                                                                                            FlutterFlowVideoPlayer(
                                                                                                                              path: listViewMessagesRecord.videoPath!,
                                                                                                                              videoType: VideoType.network,
                                                                                                                              width: 290.0,
                                                                                                                              autoPlay: false,
                                                                                                                              looping: true,
                                                                                                                              showControls: true,
                                                                                                                              allowFullScreen: true,
                                                                                                                              allowPlaybackSpeedMenu: true,
                                                                                                                            ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Divider(
                                                                                                                thickness: 2.0,
                                                                                                                color: FlutterFlowTheme.of(context).accent3,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      controller: _model.listViewController3,
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            theme: ExpandableThemeData(
                                                                                              tapHeaderToExpand: true,
                                                                                              tapBodyToExpand: false,
                                                                                              tapBodyToCollapse: false,
                                                                                              headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                              hasIcon: true,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        if (_model.chat!.lastmessageuser ==
                                                                                null ||
                                                                            _model.chat!.lastmessageuser ==
                                                                                '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                80.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: MediaQuery.of(context).size.height * 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/undraw_chatting_re_j55r_(1).svg',
                                                                                      width: 335.0,
                                                                                      height: 275.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ge2ec955' /* Start the conversation */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'vlchnj2r' /* Type something to continue */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          150.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              child: Container(
                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                height: 60.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(0.0, 2.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(30.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFDBE2E7),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: TextFormField(
                                                                                          controller: _model.chatFieldController,
                                                                                          onFieldSubmitted: (_) async {
                                                                                            final chatsUpdateData1 = createChatsRecordData(
                                                                                              lastmessagetime: getCurrentTimestamp,
                                                                                              lastmessageuser: valueOrDefault(currentUserDocument?.name, ''),
                                                                                              lastmessage: _model.chatFieldController.text,
                                                                                            );
                                                                                            await _model.chat!.reference.update(chatsUpdateData1);
                                                                                            setState(() {
                                                                                              _model.storedValue = _model.chatFieldController.text;
                                                                                            });
                                                                                            setState(() {
                                                                                              _model.chatFieldController?.clear();
                                                                                            });
                                                                                            if (_model.chat!.lastmessageuser != null && _model.chat!.lastmessageuser != '') {
                                                                                              if (_model.chat!.lastmessageuser == valueOrDefault(currentUserDocument?.name, '')) {
                                                                                                if (_model.chat!.preexistingTimestamps!.toList().contains(dateTimeFormat(
                                                                                                      'M/d H:mm',
                                                                                                      getCurrentTimestamp,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ).substring(
                                                                                                        0,
                                                                                                        dateTimeFormat(
                                                                                                              'M/d H:mm',
                                                                                                              getCurrentTimestamp,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            ).length -
                                                                                                            1))) {
                                                                                                  final messagesCreateData1 = {
                                                                                                    ...createMessagesRecordData(
                                                                                                      text: _model.storedValue,
                                                                                                      user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                                      isAnswer: false,
                                                                                                      showName: false,
                                                                                                      showTime: false,
                                                                                                    ),
                                                                                                    'time': FieldValue.serverTimestamp(),
                                                                                                  };
                                                                                                  var messagesRecordReference1 = MessagesRecord.createDoc(_model.chat!.reference);
                                                                                                  await messagesRecordReference1.set(messagesCreateData1);
                                                                                                  _model.theDocument1 = MessagesRecord.getDocumentFromData(messagesCreateData1, messagesRecordReference1);
                                                                                                } else {
                                                                                                  final chatsUpdateData2 = {
                                                                                                    'preexistingTimestamps': FieldValue.arrayUnion([
                                                                                                      dateTimeFormat(
                                                                                                        'M/d H:mm',
                                                                                                        getCurrentTimestamp,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ).substring(
                                                                                                          0,
                                                                                                          dateTimeFormat(
                                                                                                                'M/d H:mm',
                                                                                                                getCurrentTimestamp,
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              ).length -
                                                                                                              1)
                                                                                                    ]),
                                                                                                  };
                                                                                                  await _model.chat!.reference.update(chatsUpdateData2);

                                                                                                  final messagesCreateData2 = {
                                                                                                    ...createMessagesRecordData(
                                                                                                      text: _model.storedValue,
                                                                                                      user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                                      isAnswer: false,
                                                                                                      showName: false,
                                                                                                      showTime: true,
                                                                                                    ),
                                                                                                    'time': FieldValue.serverTimestamp(),
                                                                                                  };
                                                                                                  var messagesRecordReference2 = MessagesRecord.createDoc(_model.chat!.reference);
                                                                                                  await messagesRecordReference2.set(messagesCreateData2);
                                                                                                  _model.theDocument2 = MessagesRecord.getDocumentFromData(messagesCreateData2, messagesRecordReference2);
                                                                                                }
                                                                                              } else {
                                                                                                if (_model.chat!.preexistingTimestamps!.toList().contains(dateTimeFormat(
                                                                                                      'M/d H:mm',
                                                                                                      getCurrentTimestamp,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ).substring(
                                                                                                        0,
                                                                                                        dateTimeFormat(
                                                                                                              'M/d H:mm',
                                                                                                              getCurrentTimestamp,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            ).length -
                                                                                                            1))) {
                                                                                                  final messagesCreateData3 = {
                                                                                                    ...createMessagesRecordData(
                                                                                                      text: _model.storedValue,
                                                                                                      user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                                      isAnswer: false,
                                                                                                      showName: true,
                                                                                                      showTime: false,
                                                                                                    ),
                                                                                                    'time': FieldValue.serverTimestamp(),
                                                                                                  };
                                                                                                  var messagesRecordReference3 = MessagesRecord.createDoc(_model.chat!.reference);
                                                                                                  await messagesRecordReference3.set(messagesCreateData3);
                                                                                                  _model.theDocument3 = MessagesRecord.getDocumentFromData(messagesCreateData3, messagesRecordReference3);
                                                                                                } else {
                                                                                                  final chatsUpdateData3 = {
                                                                                                    'preexistingTimestamps': FieldValue.arrayUnion([
                                                                                                      dateTimeFormat(
                                                                                                        'M/d H:mm',
                                                                                                        getCurrentTimestamp,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ).substring(
                                                                                                          0,
                                                                                                          dateTimeFormat(
                                                                                                                'M/d H:mm',
                                                                                                                getCurrentTimestamp,
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              ).length -
                                                                                                              1)
                                                                                                    ]),
                                                                                                  };
                                                                                                  await _model.chat!.reference.update(chatsUpdateData3);

                                                                                                  final messagesCreateData4 = {
                                                                                                    ...createMessagesRecordData(
                                                                                                      text: _model.storedValue,
                                                                                                      user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                                      isAnswer: false,
                                                                                                      showName: true,
                                                                                                      showTime: true,
                                                                                                    ),
                                                                                                    'time': FieldValue.serverTimestamp(),
                                                                                                  };
                                                                                                  var messagesRecordReference4 = MessagesRecord.createDoc(_model.chat!.reference);
                                                                                                  await messagesRecordReference4.set(messagesCreateData4);
                                                                                                  _model.theDocument4 = MessagesRecord.getDocumentFromData(messagesCreateData4, messagesRecordReference4);
                                                                                                }
                                                                                              }
                                                                                            } else {
                                                                                              final messagesCreateData5 = {
                                                                                                ...createMessagesRecordData(
                                                                                                  text: _model.chatFieldController.text,
                                                                                                  user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                                  isAnswer: false,
                                                                                                  showName: true,
                                                                                                  showTime: true,
                                                                                                ),
                                                                                                'time': FieldValue.serverTimestamp(),
                                                                                              };
                                                                                              var messagesRecordReference5 = MessagesRecord.createDoc(_model.chat!.reference);
                                                                                              await messagesRecordReference5.set(messagesCreateData5);
                                                                                              _model.theDocument5 = MessagesRecord.getDocumentFromData(messagesCreateData5, messagesRecordReference5);

                                                                                              final chatsUpdateData4 = {
                                                                                                'preexistingTimestamps': FieldValue.arrayUnion([
                                                                                                  dateTimeFormat(
                                                                                                    'M/d H:mm',
                                                                                                    getCurrentTimestamp,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ).substring(
                                                                                                      0,
                                                                                                      dateTimeFormat(
                                                                                                            'M/d H:mm',
                                                                                                            getCurrentTimestamp,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ).length -
                                                                                                          1)
                                                                                                ]),
                                                                                              };
                                                                                              await _model.chat!.reference.update(chatsUpdateData4);
                                                                                            }

                                                                                            setState(() {});
                                                                                          },
                                                                                          autofocus: true,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            hintText: FFLocalizations.of(context).getText(
                                                                                              'vuk7ecdb' /* Message */,
                                                                                            ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            enabledBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            focusedBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            errorBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            focusedErrorBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 16.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                          validator: _model.chatFieldControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 30.0,
                                                                                      borderWidth: 1.0,
                                                                                      buttonSize: 56.0,
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.image,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 30.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                          context: context,
                                                                                          allowPhoto: true,
                                                                                          pickerFontFamily: 'Inter',
                                                                                        );
                                                                                        if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                          setState(() => _model.isDataUploading1 = true);
                                                                                          var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                          var downloadUrls = <String>[];
                                                                                          try {
                                                                                            selectedUploadedFiles = selectedMedia
                                                                                                .map((m) => FFUploadedFile(
                                                                                                      name: m.storagePath.split('/').last,
                                                                                                      bytes: m.bytes,
                                                                                                      height: m.dimensions?.height,
                                                                                                      width: m.dimensions?.width,
                                                                                                      blurHash: m.blurHash,
                                                                                                    ))
                                                                                                .toList();

                                                                                            downloadUrls = (await Future.wait(
                                                                                              selectedMedia.map(
                                                                                                (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                              ),
                                                                                            ))
                                                                                                .where((u) => u != null)
                                                                                                .map((u) => u!)
                                                                                                .toList();
                                                                                          } finally {
                                                                                            _model.isDataUploading1 = false;
                                                                                          }
                                                                                          if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                            setState(() {
                                                                                              _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                              _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                            });
                                                                                          } else {
                                                                                            setState(() {});
                                                                                            return;
                                                                                          }
                                                                                        }

                                                                                        if (valueOrDefault(currentUserDocument?.name, '') == _model.chat!.lastmessageuser) {
                                                                                          final messagesCreateData1 = createMessagesRecordData(
                                                                                            time: getCurrentTimestamp,
                                                                                            user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                            imgPath: _model.uploadedFileUrl1,
                                                                                            showTime: true,
                                                                                            showName: true,
                                                                                          );
                                                                                          await MessagesRecord.createDoc(_model.chat!.reference).set(messagesCreateData1);
                                                                                        } else {
                                                                                          final messagesCreateData2 = createMessagesRecordData(
                                                                                            time: getCurrentTimestamp,
                                                                                            user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                            imgPath: _model.uploadedFileUrl1,
                                                                                            showTime: true,
                                                                                            showName: true,
                                                                                          );
                                                                                          await MessagesRecord.createDoc(_model.chat!.reference).set(messagesCreateData2);
                                                                                        }

                                                                                        final chatsUpdateData = createChatsRecordData(
                                                                                          lastmessage: 'Sent an image',
                                                                                          lastmessagetime: getCurrentTimestamp,
                                                                                          lastmessageuser: valueOrDefault(currentUserDocument?.name, ''),
                                                                                        );
                                                                                        await _model.chat!.reference.update(chatsUpdateData);
                                                                                      },
                                                                                    ),
                                                                                    FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 30.0,
                                                                                      borderWidth: 1.0,
                                                                                      buttonSize: 56.0,
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.video,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 30.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                          context: context,
                                                                                          allowPhoto: false,
                                                                                          allowVideo: true,
                                                                                          pickerFontFamily: 'Inter',
                                                                                        );
                                                                                        if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                          setState(() => _model.isDataUploading2 = true);
                                                                                          var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                          var downloadUrls = <String>[];
                                                                                          try {
                                                                                            selectedUploadedFiles = selectedMedia
                                                                                                .map((m) => FFUploadedFile(
                                                                                                      name: m.storagePath.split('/').last,
                                                                                                      bytes: m.bytes,
                                                                                                      height: m.dimensions?.height,
                                                                                                      width: m.dimensions?.width,
                                                                                                      blurHash: m.blurHash,
                                                                                                    ))
                                                                                                .toList();

                                                                                            downloadUrls = (await Future.wait(
                                                                                              selectedMedia.map(
                                                                                                (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                              ),
                                                                                            ))
                                                                                                .where((u) => u != null)
                                                                                                .map((u) => u!)
                                                                                                .toList();
                                                                                          } finally {
                                                                                            _model.isDataUploading2 = false;
                                                                                          }
                                                                                          if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                            setState(() {
                                                                                              _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                              _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                            });
                                                                                          } else {
                                                                                            setState(() {});
                                                                                            return;
                                                                                          }
                                                                                        }

                                                                                        if (valueOrDefault(currentUserDocument?.name, '') == _model.chat!.lastmessageuser) {
                                                                                          final messagesCreateData1 = createMessagesRecordData(
                                                                                            time: getCurrentTimestamp,
                                                                                            user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                            imgPath: _model.uploadedFileUrl1,
                                                                                            showTime: true,
                                                                                            showName: true,
                                                                                            videoPath: _model.uploadedFileUrl2,
                                                                                          );
                                                                                          await MessagesRecord.createDoc(_model.chat!.reference).set(messagesCreateData1);
                                                                                        } else {
                                                                                          final messagesCreateData2 = createMessagesRecordData(
                                                                                            time: getCurrentTimestamp,
                                                                                            user: valueOrDefault(currentUserDocument?.name, ''),
                                                                                            showTime: true,
                                                                                            showName: true,
                                                                                            videoPath: _model.uploadedFileUrl2,
                                                                                          );
                                                                                          await MessagesRecord.createDoc(_model.chat!.reference).set(messagesCreateData2);
                                                                                        }

                                                                                        final chatsUpdateData = createChatsRecordData(
                                                                                          lastmessage: 'Sent an image',
                                                                                          lastmessagetime: getCurrentTimestamp,
                                                                                          lastmessageuser: valueOrDefault(currentUserDocument?.name, ''),
                                                                                        );
                                                                                        await _model.chat!.reference.update(chatsUpdateData);
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        if (!_model.chatting! &&
                                                            ((_model.isQandA
                                                                        ?.last ==
                                                                    false) ||
                                                                (_model.isQandA
                                                                        ?.first ==
                                                                    null)) &&
                                                            !_model
                                                                .isAddPeople!)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        10.0,
                                                                        25.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'hyv65h6u' /* My Chats */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            70.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (_model.isQA ?? true)
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 15.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 65.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.solidQuestionCircle,
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      setState(() {
                                                                                        _model.isQA = true;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                if (!_model.isQA!)
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 15.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 65.0,
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.solidQuestionCircle,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      setState(() {
                                                                                        _model.isQA = true;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Stack(
                                                                              children: [
                                                                                if (!_model.isQA!)
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 15.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 65.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.solidUser,
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      setState(() {
                                                                                        _model.isQA = false;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                                if (_model.isQA ?? true)
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 15.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 65.0,
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.solidUser,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      setState(() {
                                                                                        _model.isQA = false;
                                                                                      });
                                                                                    },
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (_model
                                                                              .isQA! &&
                                                                          (valueOrDefault(currentUserDocument?.isRefugee, '') ==
                                                                              'true'))
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                15.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'home',
                                                                                  queryParams: {
                                                                                    'startingChip': serializeParam(
                                                                                      'Questions & Answers',
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '8jd7bu6n' /* Search for Answers */,
                                                                              ),
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.search,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: 130.0,
                                                                                height: 50.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ChatsRecord>>(
                                                                  stream:
                                                                      queryChatsRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ChatsRecord>
                                                                        listViewChatsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewChatsRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewChatsRecord =
                                                                            listViewChatsRecordList[listViewIndex];
                                                                        return Visibility(
                                                                          visible:
                                                                              (((listViewChatsRecord.type != 'QA') && !_model.isQA!) || ((listViewChatsRecord.type == 'QA') && _model.isQA!)) && (listViewChatsRecord.users!.toList().contains(valueOrDefault(currentUserDocument?.name, '')) || (valueOrDefault(currentUserDocument?.isRefugee, '') == 'false')),
                                                                          child:
                                                                              StreamBuilder<List<Translations18Record>>(
                                                                            stream:
                                                                                queryTranslations18Record(
                                                                              parent: listViewChatsRecord.reference,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: SpinKitPulse(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<Translations18Record> cardTranslations18RecordList = snapshot.data!;
                                                                              return Card(
                                                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(25.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      setState(() {
                                                                                        _model.chatting = true;
                                                                                        _model.chat = listViewChatsRecord;
                                                                                      });

                                                                                      final userUpdateData1 = {
                                                                                        'recents': FieldValue.arrayUnion([
                                                                                          listViewChatsRecord.name
                                                                                        ]),
                                                                                      };
                                                                                      await currentUserReference!.update(userUpdateData1);
                                                                                      if (listViewChatsRecord.type == 'QA') {
                                                                                        final userUpdateData2 = {
                                                                                          'recents': FieldValue.arrayUnion([
                                                                                            listViewChatsRecord.name
                                                                                          ]),
                                                                                        };
                                                                                        await currentUserReference!.update(userUpdateData2);
                                                                                      }
                                                                                      await _model.chatList?.animateTo(
                                                                                        _model.chatList!.position.maxScrollExtent,
                                                                                        duration: Duration(milliseconds: 1000),
                                                                                        curve: Curves.ease,
                                                                                      );
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        StreamBuilder<List<UserRecord>>(
                                                                                          stream: queryUserRecord(
                                                                                            queryBuilder: (userRecord) => userRecord.whereIn('name', listViewChatsRecord.users!.toList()),
                                                                                            singleRecord: true,
                                                                                          ),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 50.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<UserRecord> circleImageUserRecordList = snapshot.data!.where((u) => u.uid != currentUserUid).toList();
                                                                                            // Return an empty Container when the item does not exist.
                                                                                            if (snapshot.data!.isEmpty) {
                                                                                              return Container();
                                                                                            }
                                                                                            final circleImageUserRecord = circleImageUserRecordList.isNotEmpty ? circleImageUserRecordList.first : null;
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                if (listViewChatsRecord.type == 'DM') {
                                                                                                  setState(() {
                                                                                                    FFAppState().isViewingProfile = true;
                                                                                                    FFAppState().profileToShow = circleImageUserRecord!.reference;
                                                                                                  });
                                                                                                }
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 60.0,
                                                                                                height: 60.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  () {
                                                                                                    if (circleImageUserRecord != null) {
                                                                                                      return circleImageUserRecord!.photoUrl!;
                                                                                                    } else if (currentUserPhoto != null && currentUserPhoto != '') {
                                                                                                      return currentUserPhoto;
                                                                                                    } else {
                                                                                                      return 'https://picsum.photos/seed/486/600';
                                                                                                    }
                                                                                                  }(),
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? cardTranslations18RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : _model.chat!.name,
                                                                                                        'no value',
                                                                                                      ),
                                                                                                      textAlign: TextAlign.start,
                                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      () {
                                                                                                        if (listViewChatsRecord.type == 'GC') {
                                                                                                          return '${listViewChatsRecord.users!.toList().first} & ${(listViewChatsRecord.users!.toList().length - 2).toString()} others';
                                                                                                        } else if (listViewChatsRecord.type == 'QA') {
                                                                                                          return listViewChatsRecord.categories!.toList().first;
                                                                                                        } else {
                                                                                                          return 'Direct Message';
                                                                                                        }
                                                                                                      }(),
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        dateTimeFormat(
                                                                                                          'relative',
                                                                                                          listViewChatsRecord.lastmessagetime,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                        'New Chat',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                      controller:
                                                                          _model
                                                                              .listViewController4,
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                            .isViewingProfile)
                                                          wrapWithModel(
                                                            model: _model
                                                                .userProfileModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                UserProfileWidget(
                                                              profileToShow:
                                                                  FFAppState()
                                                                      .profileToShow,
                                                            ),
                                                          ),
                                                        if (!_model.chatting!)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.03, 0.99),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          95.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    35.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    55.0,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 40.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (bottomSheetContext) {
                                                                      return GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(context).requestFocus(_unfocusNode),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.of(bottomSheetContext).viewInsets,
                                                                          child:
                                                                              NewSheetWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(() =>
                                                                          _model.isQandA =
                                                                              value));

                                                                  setState(() {
                                                                    _model.closeChat =
                                                                        false;
                                                                  });

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) => Stack(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                SingleChildScrollView(
                                                                  controller: _model
                                                                      .columnController4,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (!_model
                                                                          .filtering!)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                StreamBuilder<List<ProfessionsRecord>>(
                                                                                  stream: queryProfessionsRecord(
                                                                                    queryBuilder: (professionsRecord) => professionsRecord.where('name', isEqualTo: _model.profession),
                                                                                    singleRecord: true,
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: SpinKitPulse(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 50.0,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<ProfessionsRecord> rowProfessionsRecordList = snapshot.data!;
                                                                                    final rowProfessionsRecord = rowProfessionsRecordList.isNotEmpty ? rowProfessionsRecordList.first : null;
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: StreamBuilder<List<Translations17Record>>(
                                                                                              stream: queryTranslations17Record(
                                                                                                parent: rowProfessionsRecord!.reference,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: SpinKitPulse(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        size: 50.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<Translations17Record> buttonTranslations17RecordList = snapshot.data!;
                                                                                                return FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    setState(() {
                                                                                                      _model.filtering = true;
                                                                                                    });
                                                                                                  },
                                                                                                  text: _model.profession == 'none'
                                                                                                      ? 'All professions'
                                                                                                      : valueOrDefault<String>(
                                                                                                          (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? buttonTranslations17RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : rowProfessionsRecord!.name,
                                                                                                          'no value',
                                                                                                        ),
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 130.0,
                                                                                                    height: 50.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                    elevation: 2.0,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                StreamBuilder<List<ProfessionalsRecord>>(
                                                                                  stream: queryProfessionalsRecord(
                                                                                    queryBuilder: (professionalsRecord) => professionalsRecord.where('language', isEqualTo: valueOrDefault(currentUserDocument?.language, '')),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: SpinKitPulse(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 50.0,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<ProfessionalsRecord> columnProfessionalsRecordList = snapshot.data!;
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(columnProfessionalsRecordList.length, (columnIndex) {
                                                                                        final columnProfessionalsRecord = columnProfessionalsRecordList[columnIndex];
                                                                                        return Visibility(
                                                                                          visible: ((_model.language == 'none') && (_model.profession == 'none')) || ((_model.language == 'none') && (_model.profession == columnProfessionalsRecord.profession)) || ((_model.profession == columnProfessionalsRecord.profession) && (_model.language == columnProfessionalsRecord.language)) || ((_model.language == columnProfessionalsRecord.language) && (_model.profession == columnProfessionalsRecord.profession)) ? true : false,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 10.0),
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 2.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: MediaQuery.of(context).size.width * 0.9,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                  shape: BoxShape.rectangle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                            child: StreamBuilder<List<UserRecord>>(
                                                                                                              stream: queryUserRecord(
                                                                                                                queryBuilder: (userRecord) => userRecord.where('name', isEqualTo: columnProfessionalsRecord.name),
                                                                                                                singleRecord: true,
                                                                                                              ),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 50.0,
                                                                                                                      height: 50.0,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 50.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                List<UserRecord> circleImageUserRecordList = snapshot.data!;
                                                                                                                // Return an empty Container when the item does not exist.
                                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                                  return Container();
                                                                                                                }
                                                                                                                final circleImageUserRecord = circleImageUserRecordList.isNotEmpty ? circleImageUserRecordList.first : null;
                                                                                                                return Container(
                                                                                                                  width: 50.0,
                                                                                                                  height: 50.0,
                                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    shape: BoxShape.circle,
                                                                                                                  ),
                                                                                                                  child: Image.network(
                                                                                                                    'https://picsum.photos/seed/769/600',
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            columnProfessionalsRecord.name!,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Roboto',
                                                                                                                  fontSize: 21.5,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                      child: StreamBuilder<List<Translations15Record>>(
                                                                                                        stream: queryTranslations15Record(
                                                                                                          parent: columnProfessionalsRecord.reference,
                                                                                                        ),
                                                                                                        builder: (context, snapshot) {
                                                                                                          // Customize what your widget looks like when it's loading.
                                                                                                          if (!snapshot.hasData) {
                                                                                                            return Center(
                                                                                                              child: SizedBox(
                                                                                                                width: 50.0,
                                                                                                                height: 50.0,
                                                                                                                child: SpinKitPulse(
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  size: 50.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                          List<Translations15Record> textTranslations15RecordList = snapshot.data!;
                                                                                                          return Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations15RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : columnProfessionalsRecord.profession,
                                                                                                              'no value',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                      child: Text(
                                                                                                        columnProfessionalsRecord.language!,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (columnProfessionalsRecord.practicename != null && columnProfessionalsRecord.practicename != '')
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                        child: StreamBuilder<List<Translations16Record>>(
                                                                                                          stream: queryTranslations16Record(
                                                                                                            parent: columnProfessionalsRecord.reference,
                                                                                                          ),
                                                                                                          builder: (context, snapshot) {
                                                                                                            // Customize what your widget looks like when it's loading.
                                                                                                            if (!snapshot.hasData) {
                                                                                                              return Center(
                                                                                                                child: SizedBox(
                                                                                                                  width: 50.0,
                                                                                                                  height: 50.0,
                                                                                                                  child: SpinKitPulse(
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 50.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }
                                                                                                            List<Translations16Record> textTranslations16RecordList = snapshot.data!;
                                                                                                            return Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations16RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : columnProfessionalsRecord.practicename,
                                                                                                                'no value',
                                                                                                              ),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        color: Colors.white,
                                                                                                        child: ExpandableNotifier(
                                                                                                          initialExpanded: false,
                                                                                                          child: ExpandablePanel(
                                                                                                            header: Align(
                                                                                                              alignment: AlignmentDirectional(0.3, 0.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'ko967t9e' /* More Information */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                              ),
                                                                                                            ),
                                                                                                            collapsed: Container(),
                                                                                                            expanded: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  if (columnProfessionalsRecord.profile != null && columnProfessionalsRecord.profile != '')
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                            child: Icon(
                                                                                                                              Icons.person,
                                                                                                                              size: 30.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                await launchURL(columnProfessionalsRecord.website!);
                                                                                                                              },
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  '3hzxq3j0' /* Digital Profile */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                      decoration: TextDecoration.underline,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                          child: FaIcon(
                                                                                                                            FontAwesomeIcons.mapMarkerAlt,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            size: 24.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          constraints: BoxConstraints(
                                                                                                                            maxWidth: MediaQuery.of(context).size.width * 0.77,
                                                                                                                            maxHeight: 40.0,
                                                                                                                          ),
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          ),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: AutoSizeText(
                                                                                                                              columnProfessionalsRecord.address!,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  if ((columnProfessionalsRecord.isIFHP == null) || (columnProfessionalsRecord.isIFHP == true))
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                            child: FaIcon(
                                                                                                                              FontAwesomeIcons.check,
                                                                                                                              color: FlutterFlowTheme.of(context).success,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'yvryw2vh' /* Accepts IFHP */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  if ((columnProfessionalsRecord.isFree == true) && (columnProfessionalsRecord.isFree != null))
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                            child: FaIcon(
                                                                                                                              FontAwesomeIcons.check,
                                                                                                                              color: FlutterFlowTheme.of(context).success,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                '1rwsmsxe' /* Services are free */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            theme: ExpandableThemeData(
                                                                                                              tapHeaderToExpand: true,
                                                                                                              tapBodyToExpand: false,
                                                                                                              tapBodyToCollapse: false,
                                                                                                              headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                              hasIcon: true,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 10.0),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (bottomSheetContext) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                  child: MaterialActionSheetSimpleWidget(
                                                                                                                    professional: columnProfessionalsRecord,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => setState(() {}));
                                                                                                        },
                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                          'ct57o9yo' /* Contact */,
                                                                                                        ),
                                                                                                        icon: FaIcon(
                                                                                                          FontAwesomeIcons.link,
                                                                                                          size: 25.0,
                                                                                                        ),
                                                                                                        options: FFButtonOptions(
                                                                                                          width: double.infinity,
                                                                                                          height: 40.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: Colors.white,
                                                                                                                fontSize: 22.0,
                                                                                                              ),
                                                                                                          elevation: 2.0,
                                                                                                          borderSide: BorderSide(
                                                                                                            color: Colors.transparent,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (_model
                                                                    .filtering ??
                                                                true)
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1.0,
                                                                height: 1000.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    if (!_model
                                                                        .isDialogue!)
                                                                      SingleChildScrollView(
                                                                        controller:
                                                                            _model.columnController5,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      setState(() {
                                                                                        _model.filtering = false;
                                                                                      });
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'uw2wpqb5' /* Xmark */,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                            fontFamily: 'fa',
                                                                                            fontSize: 30.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '8wdnx7vu' /* Filter by profession */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  setState(() {
                                                                                    _model.profession = 'none';
                                                                                    _model.filtering = false;
                                                                                  });
                                                                                },
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'zubc6umi' /* bars */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'fa',
                                                                                                    fontSize: 30.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '6h173vc7' /* No filter */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).titleLarge,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Divider(
                                                                                      thickness: 2.0,
                                                                                      color: FlutterFlowTheme.of(context).accent3,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<List<ProfessionsRecord>>(
                                                                              stream: queryProfessionsRecord(),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: SpinKitPulse(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 50.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<ProfessionsRecord> columnProfessionsRecordList = snapshot.data!;
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(columnProfessionsRecordList.length, (columnIndex) {
                                                                                    final columnProfessionsRecord = columnProfessionsRecordList[columnIndex];
                                                                                    return Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          setState(() {
                                                                                            _model.profession = columnProfessionsRecord.name;
                                                                                            _model.filtering = false;
                                                                                          });
                                                                                        },
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                    child: Text(
                                                                                                      columnProfessionsRecord.icon!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'fa',
                                                                                                            fontSize: 30.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  StreamBuilder<List<Translations17Record>>(
                                                                                                    stream: queryTranslations17Record(
                                                                                                      parent: columnProfessionsRecord.reference,
                                                                                                    ),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            child: SpinKitPulse(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 50.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<Translations17Record> textTranslations17RecordList = snapshot.data!;
                                                                                                      return Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations17RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : columnProfessionsRecord.name,
                                                                                                          'no value',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Divider(
                                                                                              thickness: 2.0,
                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(75.0, 60.0, 75.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  setState(() {
                                                                                    _model.isDialogue = true;
                                                                                  });
                                                                                },
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'rclmuood' /* Why are there no specialists a... */,
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    if (_model
                                                                            .isDialogue ??
                                                                        true)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            40.0,
                                                                            20.0,
                                                                            120.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              4.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  SvgPicture.asset(
                                                                                    'assets/images/undraw_medicine_b-1-ol.svg',
                                                                                    width: double.infinity,
                                                                                    height: 200.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.question,
                                                                                          color: Colors.black,
                                                                                          size: 30.0,
                                                                                        ),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.8,
                                                                                          height: 55.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'quzanrme' /* Why are there no specialists a... */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleLarge,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                    child: RichText(
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              '5avgo0uq' /* In Canada, patients visit prim... */,
                                                                                            ),
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              '0bdmup53' /* Learn more */,
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              decoration: TextDecoration.underline,
                                                                                            ),
                                                                                            mouseCursor: SystemMouseCursors.click,
                                                                                            recognizer: TapGestureRecognizer()
                                                                                              ..onTap = () async {
                                                                                                await launchURL('settlement.org/ontario/health/find-a-doctor-or-medical-professional/how-can-i-find-a-medical-specialist');
                                                                                              },
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        setState(() {
                                                                                          _model.isDialogue = false;
                                                                                        });
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '1qp0ba0m' /* Done */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        width: double.infinity,
                                                                                        height: 50.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              fontSize: 24.0,
                                                                                            ),
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.refugeeNavBarModel,
                            updateCallback: () => setState(() {}),
                            child: RefugeeNavBarWidget(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
