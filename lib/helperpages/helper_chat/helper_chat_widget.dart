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
import 'helper_chat_model.dart';
export 'helper_chat_model.dart';

class HelperChatWidget extends StatefulWidget {
  const HelperChatWidget({
    Key? key,
    this.chatToLoad,
  }) : super(key: key);

  final ChatsRecord? chatToLoad;

  @override
  _HelperChatWidgetState createState() => _HelperChatWidgetState();
}

class _HelperChatWidgetState extends State<HelperChatWidget> {
  late HelperChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelperChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.masterState = [false, false].toList().cast<bool>();
        _model.chatting = false;
      });
    });

    _model.emailAddressController1 ??= TextEditingController();
    _model.emailAddressController2 ??= TextEditingController();
    _model.emailAddressController3 ??= TextEditingController();
    _model.chatFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UserRecord> helperChatUserRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                  '9l1gfls5' /* Connect */,
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
              top: true,
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<LanguagesRecord>>(
                  stream: queryLanguagesRecord(
                    queryBuilder: (languagesRecord) => languagesRecord.where(
                      'Name',
                      isEqualTo:
                          valueOrDefault(currentUserDocument?.language, ''),
                    ),
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
                        Stack(
                          children: [
                            Stack(
                              children: [
                                if ((_model.masterState.first == true) &&
                                    (_model.masterState.last == true))
                                  Form(
                                    key: _model.formKey1,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 40.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .emailAddressController1,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'wgqlk26c' /* Question */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFDBE2E7),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(24.0, 24.0,
                                                              20.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                maxLines: null,
                                                validator: _model
                                                    .emailAddressController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 40.0, 0.0, 20.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'k65f3gr9' /* Which categories do your quest... */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                              ),
                                            ),
                                            StreamBuilder<List<CategoryRecord>>(
                                              stream: queryCategoryRecord(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitPulse(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
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
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewCategoryRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewCategoryRecord =
                                                        listViewCategoryRecordList[
                                                            listViewIndex];
                                                    return StreamBuilder<
                                                        List<
                                                            Translations8Record>>(
                                                      stream:
                                                          queryTranslations8Record(
                                                        parent:
                                                            listViewCategoryRecord
                                                                .reference,
                                                        queryBuilder:
                                                            (translations8Record) =>
                                                                translations8Record
                                                                    .where(
                                                          'language',
                                                          isEqualTo:
                                                              stackLanguagesRecord
                                                                  ?.code,
                                                        ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<Translations8Record>
                                                            blurTranslations8RecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final blurTranslations8Record =
                                                            blurTranslations8RecordList
                                                                    .isNotEmpty
                                                                ? blurTranslations8RecordList
                                                                    .first
                                                                : null;
                                                        return ClipRect(
                                                          child: ImageFiltered(
                                                            imageFilter:
                                                                ImageFilter
                                                                    .blur(
                                                              sigmaX: 0.0,
                                                              sigmaY: 0.0,
                                                            ),
                                                            child: Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                              ),
                                                              child:
                                                                  CheckboxListTile(
                                                                value: _model
                                                                        .checkboxListTileValueMap1[
                                                                    listViewCategoryRecord] ??= false,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  setState(() =>
                                                                      _model.checkboxListTileValueMap1[
                                                                              listViewCategoryRecord] =
                                                                          newValue!);
                                                                },
                                                                title: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    stackLanguagesRecord?.name !=
                                                                            'English'
                                                                        ? blurTranslations8Record
                                                                            ?.value
                                                                        : listViewCategoryRecord
                                                                            .title,
                                                                    'no value',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                tileColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                dense: false,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .trailing,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 40.0,
                                                                0.0, 120.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model
                                                                .checkboxListTileCheckedItems1
                                                                .length >
                                                            0) {
                                                          if (_model.emailAddressController1
                                                                      .text ==
                                                                  null ||
                                                              _model.emailAddressController1
                                                                      .text ==
                                                                  '') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'No question name provided',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                              ),
                                                            );
                                                          } else {
                                                            var chatsRecordReference =
                                                                ChatsRecord
                                                                    .collection
                                                                    .doc();
                                                            await chatsRecordReference
                                                                .set({
                                                              ...createChatsRecordData(
                                                                name: _model
                                                                    .emailAddressController1
                                                                    .text,
                                                                type: 'QA',
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'users': [
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.name,
                                                                        '')
                                                                  ],
                                                                  'categories': _model
                                                                      .checkboxListTileCheckedItems1
                                                                      .map((e) =>
                                                                          e.title)
                                                                      .toList(),
                                                                  'preexistingTimestamps':
                                                                      [
                                                                    'placeholder'
                                                                  ],
                                                                },
                                                              ),
                                                            });
                                                            _model.newQChat =
                                                                ChatsRecord
                                                                    .getDocumentFromData({
                                                              ...createChatsRecordData(
                                                                name: _model
                                                                    .emailAddressController1
                                                                    .text,
                                                                type: 'QA',
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'users': [
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.name,
                                                                        '')
                                                                  ],
                                                                  'categories': _model
                                                                      .checkboxListTileCheckedItems1
                                                                      .map((e) =>
                                                                          e.title)
                                                                      .toList(),
                                                                  'preexistingTimestamps':
                                                                      [
                                                                    'placeholder'
                                                                  ],
                                                                },
                                                              ),
                                                            }, chatsRecordReference);

                                                            var messagesRecordReference =
                                                                MessagesRecord
                                                                    .createDoc(_model
                                                                        .newQChat!
                                                                        .reference);
                                                            await messagesRecordReference
                                                                .set(
                                                                    createMessagesRecordData(
                                                              text:
                                                                  'Created chat',
                                                            ));
                                                            _model.newQMessages =
                                                                MessagesRecord
                                                                    .getDocumentFromData(
                                                                        createMessagesRecordData(
                                                                          text:
                                                                              'Created chat',
                                                                        ),
                                                                        messagesRecordReference);
                                                            setState(() {
                                                              _model.chatting =
                                                                  true;
                                                              _model.chat =
                                                                  _model
                                                                      .newQChat;
                                                              _model.message =
                                                                  _model
                                                                      .newQMessages;
                                                              _model.closeChat =
                                                                  true;
                                                            });
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Must select at least 1 category',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '51urvufh' /* Submit Question */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 130.0,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
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
                                if (((_model.masterState.first == false) &&
                                        (_model.masterState.last == true)) ||
                                    _model.isAddPeople!)
                                  Form(
                                    key: _model.formKey2,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (_model.isAddPeople ??
                                                        true)
                                                      StreamBuilder<
                                                          ChatsRecord>(
                                                        stream: ChatsRecord
                                                            .getDocument(_model
                                                                .chat!
                                                                .reference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final wrapChatsRecord =
                                                              snapshot.data!;
                                                          return Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 0.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            40.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .nameFieldController ??=
                                                                      TextEditingController(
                                                                    text: wrapChatsRecord
                                                                        .name,
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6wrzen09' /* Chat name */,
                                                                    ),
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0xFFDBE2E7),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            20.0,
                                                                            24.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            15.0,
                                                                      ),
                                                                  maxLines:
                                                                      null,
                                                                  validator: _model
                                                                      .nameFieldControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    if (!_model.isAddPeople! &&
                                                        (_model.checkboxListTileCheckedItems2
                                                                .length >
                                                            1))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    40.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .emailAddressController2,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              '7ahvr2u3' /* Name your chat */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFDBE2E7),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        24.0,
                                                                        20.0,
                                                                        24.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 15.0,
                                                              ),
                                                          maxLines: null,
                                                          validator: _model
                                                              .emailAddressController2Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(25.0,
                                                                20.0, 0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'wotogtc0' /* Add people */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 15.0),
                                                    child: Stack(
                                                      children: [
                                                        TextFormField(
                                                          controller: _model
                                                              .emailAddressController3,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'avvqj2ij' /* Search... */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFDBE2E7),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        24.0,
                                                                        20.0,
                                                                        24.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          maxLines: null,
                                                          validator: _model
                                                              .emailAddressController3Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.00, 0.00),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .search,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 25.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              safeSetState(() {
                                                                _model.simpleSearchResults =
                                                                    TextSearch(
                                                                  helperChatUserRecordList
                                                                      .map(
                                                                        (record) => TextSearchItem(
                                                                            record,
                                                                            [
                                                                              record.name!
                                                                            ]),
                                                                      )
                                                                      .toList(),
                                                                )
                                                                        .search(_model
                                                                            .emailAddressController3
                                                                            .text)
                                                                        .map((r) =>
                                                                            r.object)
                                                                        .toList();
                                                                ;
                                                              });
                                                              setState(() {
                                                                _model.isShowAll =
                                                                    false;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.68, 0.00),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .close_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                _model.isShowAll =
                                                                    true;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final people = (_model
                                                                  .isShowAll!
                                                              ? helperChatUserRecordList
                                                              : _model
                                                                  .simpleSearchResults)
                                                          .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            people.length,
                                                        itemBuilder: (context,
                                                            peopleIndex) {
                                                          final peopleItem =
                                                              people[
                                                                  peopleIndex];
                                                          return Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      peopleItem.photoUrl != null &&
                                                                              peopleItem.photoUrl !=
                                                                                  ''
                                                                          ? peopleItem
                                                                              .photoUrl
                                                                          : 'https://picsum.photos/seed/862/600',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            Translations14Record>>(
                                                                      stream:
                                                                          queryTranslations14Record(
                                                                        parent:
                                                                            peopleItem.reference,
                                                                        queryBuilder:
                                                                            (translations14Record) =>
                                                                                translations14Record.where(
                                                                          'language',
                                                                          isEqualTo:
                                                                              stackLanguagesRecord?.code,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<Translations14Record>
                                                                            checkboxListTileTranslations14RecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final checkboxListTileTranslations14Record = checkboxListTileTranslations14RecordList.isNotEmpty
                                                                            ? checkboxListTileTranslations14RecordList.first
                                                                            : null;
                                                                        return Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(25),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                          ),
                                                                          child:
                                                                              CheckboxListTile(
                                                                            value: _model.checkboxListTileValueMap2[peopleItem] ??=
                                                                                () {
                                                                              if (!_model.isAddPeople!) {
                                                                                return false;
                                                                              } else if (_model.chat!.users.contains(peopleItem.name)) {
                                                                                return true;
                                                                              } else {
                                                                                return false;
                                                                              }
                                                                            }(),
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.checkboxListTileValueMap2[peopleItem] = newValue!);
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              peopleItem.name,
                                                                              style: FlutterFlowTheme.of(context).titleLarge,
                                                                            ),
                                                                            subtitle:
                                                                                Text(
                                                                              () {
                                                                                if (valueOrDefault(currentUserDocument?.isRefugee, '') == 'true') {
                                                                                  return 'Refugee';
                                                                                } else if (peopleItem.displayName != null && peopleItem.displayName != '') {
                                                                                  return valueOrDefault<String>(
                                                                                    (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'false') ? checkboxListTileTranslations14Record?.value : peopleItem.displayName,
                                                                                    'n',
                                                                                  );
                                                                                } else {
                                                                                  return 'Helper';
                                                                                }
                                                                              }(),
                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                            ),
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            dense:
                                                                                false,
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.trailing,
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
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    25.0,
                                                                    0.0,
                                                                    100.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model
                                                                .isAddPeople!) {
                                                              await _model.chat!
                                                                  .reference
                                                                  .update({
                                                                ...createChatsRecordData(
                                                                  name: _model
                                                                      .nameFieldController
                                                                      .text,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'users': (List<String>
                                                                                var1,
                                                                            String
                                                                                var2) {
                                                                      return var1 +
                                                                          [
                                                                            var2
                                                                          ];
                                                                    }(
                                                                        _model
                                                                            .checkboxListTileCheckedItems2
                                                                            .map((e) => e
                                                                                .name)
                                                                            .toList(),
                                                                        valueOrDefault(
                                                                            currentUserDocument?.name,
                                                                            '')),
                                                                  },
                                                                ),
                                                              });
                                                              setState(() {
                                                                _model.chatting =
                                                                    true;
                                                                _model.isAddPeople =
                                                                    false;
                                                              });

                                                              context.goNamed(
                                                                'connect',
                                                                queryParameters:
                                                                    {
                                                                  'chatToLoad':
                                                                      serializeParam(
                                                                    _model.chat,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'professionToLoad':
                                                                      serializeParam(
                                                                    'none',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'chatToLoad':
                                                                      _model
                                                                          .chat,
                                                                },
                                                              );
                                                            } else {
                                                              if (_model
                                                                      .checkboxListTileCheckedItems2
                                                                      .length >
                                                                  1) {
                                                                var chatsRecordReference1 =
                                                                    ChatsRecord
                                                                        .collection
                                                                        .doc();
                                                                await chatsRecordReference1
                                                                    .set({
                                                                  ...createChatsRecordData(
                                                                    name: _model
                                                                        .emailAddressController2
                                                                        .text,
                                                                    type: 'GC',
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users': (List<String> var1,
                                                                              String
                                                                                  var2) {
                                                                        return var1 +
                                                                            [
                                                                              var2
                                                                            ];
                                                                      }(
                                                                          _model
                                                                              .checkboxListTileCheckedItems2
                                                                              .map((e) => e
                                                                                  .name)
                                                                              .toList(),
                                                                          valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              '')),
                                                                      'preexistingTimestamps':
                                                                          [
                                                                        'placeholder'
                                                                      ],
                                                                    },
                                                                  ),
                                                                });
                                                                _model.newChat1 =
                                                                    ChatsRecord
                                                                        .getDocumentFromData({
                                                                  ...createChatsRecordData(
                                                                    name: _model
                                                                        .emailAddressController2
                                                                        .text,
                                                                    type: 'GC',
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users': (List<String> var1,
                                                                              String
                                                                                  var2) {
                                                                        return var1 +
                                                                            [
                                                                              var2
                                                                            ];
                                                                      }(
                                                                          _model
                                                                              .checkboxListTileCheckedItems2
                                                                              .map((e) => e
                                                                                  .name)
                                                                              .toList(),
                                                                          valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              '')),
                                                                      'preexistingTimestamps':
                                                                          [
                                                                        'placeholder'
                                                                      ],
                                                                    },
                                                                  ),
                                                                }, chatsRecordReference1);

                                                                var messagesRecordReference1 =
                                                                    MessagesRecord.createDoc(_model
                                                                        .newChat1!
                                                                        .reference);
                                                                await messagesRecordReference1
                                                                    .set(
                                                                        createMessagesRecordData(
                                                                  text:
                                                                      'Created chat',
                                                                ));
                                                                _model.messageDoc1 =
                                                                    MessagesRecord.getDocumentFromData(
                                                                        createMessagesRecordData(
                                                                          text:
                                                                              'Created chat',
                                                                        ),
                                                                        messagesRecordReference1);
                                                                setState(() {
                                                                  _model.closeChat =
                                                                      true;
                                                                  _model.chatting =
                                                                      true;
                                                                  _model.chat =
                                                                      _model
                                                                          .newChat1;
                                                                  _model.message =
                                                                      _model
                                                                          .messageDoc1;
                                                                });
                                                              } else {
                                                                var chatsRecordReference2 =
                                                                    ChatsRecord
                                                                        .collection
                                                                        .doc();
                                                                await chatsRecordReference2
                                                                    .set({
                                                                  ...createChatsRecordData(
                                                                    type: 'DM',
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users': (List<String> var1,
                                                                              String
                                                                                  var2) {
                                                                        return var1 +
                                                                            [
                                                                              var2
                                                                            ];
                                                                      }(
                                                                          _model
                                                                              .checkboxListTileCheckedItems2
                                                                              .map((e) => e
                                                                                  .name)
                                                                              .toList(),
                                                                          valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              '')),
                                                                      'preexistingTimestamps':
                                                                          [
                                                                        'placeholder'
                                                                      ],
                                                                    },
                                                                  ),
                                                                });
                                                                _model.newChat2 =
                                                                    ChatsRecord
                                                                        .getDocumentFromData({
                                                                  ...createChatsRecordData(
                                                                    type: 'DM',
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'users': (List<String> var1,
                                                                              String
                                                                                  var2) {
                                                                        return var1 +
                                                                            [
                                                                              var2
                                                                            ];
                                                                      }(
                                                                          _model
                                                                              .checkboxListTileCheckedItems2
                                                                              .map((e) => e
                                                                                  .name)
                                                                              .toList(),
                                                                          valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              '')),
                                                                      'preexistingTimestamps':
                                                                          [
                                                                        'placeholder'
                                                                      ],
                                                                    },
                                                                  ),
                                                                }, chatsRecordReference2);

                                                                var messagesRecordReference2 =
                                                                    MessagesRecord.createDoc(_model
                                                                        .newChat2!
                                                                        .reference);
                                                                await messagesRecordReference2
                                                                    .set(
                                                                        createMessagesRecordData(
                                                                  text:
                                                                      'Created chat',
                                                                ));
                                                                _model.messageDoc2 =
                                                                    MessagesRecord.getDocumentFromData(
                                                                        createMessagesRecordData(
                                                                          text:
                                                                              'Created chat',
                                                                        ),
                                                                        messagesRecordReference2);
                                                                setState(() {
                                                                  _model.closeChat =
                                                                      true;
                                                                  _model.chatting =
                                                                      true;
                                                                  _model.chat =
                                                                      _model
                                                                          .newChat2;
                                                                  _model.message =
                                                                      _model
                                                                          .messageDoc2;
                                                                });
                                                              }
                                                            }

                                                            setState(() {});
                                                          },
                                                          text: _model
                                                                  .isAddPeople!
                                                              ? 'Save changes'
                                                              : (_model.checkboxListTileCheckedItems2
                                                                          .length >
                                                                      1
                                                                  ? 'Create Group Chat'
                                                                  : 'Create Direct Message'),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
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
                            if (_model.chatting ?? true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      150.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  MessagesRecord>>(
                                                            stream:
                                                                queryMessagesRecord(
                                                              parent: _model
                                                                  .chat
                                                                  ?.reference,
                                                              queryBuilder: (messagesRecord) =>
                                                                  messagesRecord
                                                                      .orderBy(
                                                                          'time'),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MessagesRecord>
                                                                  chatListMessagesRecordList =
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
                                                                    chatListMessagesRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        chatListIndex) {
                                                                  final chatListMessagesRecord =
                                                                      chatListMessagesRecordList[
                                                                          chatListIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onLongPress:
                                                                        () async {
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              200));
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Material2ActionSheetSimpleWidget(
                                                                                messageToLoad: chatListMessagesRecord,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            if (false)
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
                                                                            if (chatListMessagesRecord.showName &&
                                                                                (_model.chat?.type != 'DM'))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      StreamBuilder<List<UserRecord>>(
                                                                                        stream: queryUserRecord(
                                                                                          queryBuilder: (userRecord) => userRecord.where(
                                                                                            'name',
                                                                                            isEqualTo: chatListMessagesRecord.user,
                                                                                          ),
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
                                                                                                FFAppState().profileToShow = rowUserRecord?.reference;
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
                                                                                                    rowUserRecord!.photoUrl,
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
                                                                                Flexible(
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 2.0,
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        if (chatListMessagesRecord.text != null && chatListMessagesRecord.text != '')
                                                                                          Stack(
                                                                                            children: [
                                                                                              if (chatListMessagesRecord.user != valueOrDefault(currentUserDocument?.name, ''))
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        if (chatListMessagesRecord.text != null && chatListMessagesRecord.text != '')
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                            child: Container(
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: MediaQuery.sizeOf(context).width * 0.85,
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
                                                                                                                        path: chatListMessagesRecord.videoPath,
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
                                                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
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
                                                                                                                                    chatListMessagesRecord.imgPath,
                                                                                                                                    fit: BoxFit.contain,
                                                                                                                                  ),
                                                                                                                                  allowRotation: false,
                                                                                                                                  tag: chatListMessagesRecord.imgPath,
                                                                                                                                  useHeroAnimation: true,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                          child: Hero(
                                                                                                                            tag: chatListMessagesRecord.imgPath,
                                                                                                                            transitionOnUserGestures: true,
                                                                                                                            child: Image.network(
                                                                                                                              chatListMessagesRecord.imgPath,
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
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1.00, 0.00),
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
                                                                                              if (chatListMessagesRecord.user == valueOrDefault(currentUserDocument?.name, ''))
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 5.0, 5.0),
                                                                                                        child: FaIcon(
                                                                                                          FontAwesomeIcons.mapPin,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 25.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Stack(
                                                                                                      alignment: AlignmentDirectional(1.0, -1.0),
                                                                                                      children: [
                                                                                                        if (chatListMessagesRecord.text != null && chatListMessagesRecord.text != '')
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(1.00, 0.00),
                                                                                                            child: Container(
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: MediaQuery.sizeOf(context).width * 0.85,
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
                                                                                                                        path: chatListMessagesRecord.videoPath,
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
                                                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
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
                                                                                                                                    chatListMessagesRecord.imgPath,
                                                                                                                                    fit: BoxFit.contain,
                                                                                                                                  ),
                                                                                                                                  allowRotation: false,
                                                                                                                                  tag: chatListMessagesRecord.imgPath,
                                                                                                                                  useHeroAnimation: true,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                          child: Hero(
                                                                                                                            tag: chatListMessagesRecord.imgPath,
                                                                                                                            transitionOnUserGestures: true,
                                                                                                                            child: Image.network(
                                                                                                                              chatListMessagesRecord.imgPath,
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
                                                                                                  ],
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            StreamBuilder<List<MessagesRecord>>(
                                                                              stream: queryMessagesRecord(
                                                                                parent: _model.chat?.reference,
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
                                                                                    if (wrapMessagesRecord?.reference.id == chatListMessagesRecord.reference.id)
                                                                                      Container(
                                                                                        width: 100.0,
                                                                                        height: 100.0,
                                                                                        decoration: BoxDecoration(),
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
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if ((_model.chat?.lastmessageuser ==
                                                        null ||
                                                    _model.chat
                                                            ?.lastmessageuser ==
                                                        '') &&
                                                !_model.hasFirstPost)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 80.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    40.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/undraw_chatting_re_j55r_(1).svg',
                                                          width: 335.0,
                                                          height: 275.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '79ljx65o' /* Start the conversation */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '72461u8m' /* Type something to continue */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    constraints: BoxConstraints(
                                                      maxHeight:
                                                          double.infinity,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  5.0,
                                                                  5.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          StreamBuilder<
                                                              List<UserRecord>>(
                                                            stream:
                                                                queryUserRecord(
                                                              queryBuilder: (userRecord) =>
                                                                  userRecord.whereIn(
                                                                      'name',
                                                                      _model
                                                                          .chat
                                                                          ?.users),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<UserRecord>
                                                                  circleImageUserRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final circleImageUserRecord =
                                                                  circleImageUserRecordList
                                                                          .isNotEmpty
                                                                      ? circleImageUserRecordList
                                                                          .first
                                                                      : null;
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (_model
                                                                          .chat
                                                                          ?.type ==
                                                                      'DM') {
                                                                    _model
                                                                        .updatePage(
                                                                            () {
                                                                      FFAppState()
                                                                              .isViewingProfile =
                                                                          true;
                                                                    });
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      circleImageUserRecord
                                                                          ?.photoUrl,
                                                                      'https://picsum.photos/seed/486/600',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.68,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          46.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (_model.chat?.type == 'GC') ||
                                                                                (_model.chat?.type == 'QA')
                                                                            ? _model.chat?.name
                                                                            : _model.chat?.users?.where((e) => e != valueOrDefault(currentUserDocument?.name, '')).toList()?.first,
                                                                        'Loading...',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge,
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .chat
                                                                          ?.type ==
                                                                      'GC')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '${_model.chat?.users?.length?.toString()} members',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Stack(
                                                            children: [
                                                              if (_model.chat
                                                                      ?.type !=
                                                                  'QA')
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      50.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .people_alt,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 25.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isAddPeople =
                                                                          true;
                                                                      _model.chatting =
                                                                          false;
                                                                    });
                                                                  },
                                                                ),
                                                              if (_model.chat
                                                                      ?.type ==
                                                                  'DM')
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        50.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: DeleteConfirmationWidget(
                                                                                thingToDelete: 'direct message',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(() =>
                                                                              _model.toDelete = value));

                                                                      if (_model
                                                                          .toDelete!) {
                                                                        await _model
                                                                            .chat!
                                                                            .reference
                                                                            .delete();
                                                                        setState(
                                                                            () {
                                                                          _model.chatting =
                                                                              false;
                                                                        });
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.chat?.type == 'QA')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, -1.00),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: double
                                                                  .infinity,
                                                              maxHeight: double
                                                                  .infinity,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  ExpandableNotifier(
                                                                initialExpanded:
                                                                    false,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'u9h96igt' /* View Answers */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 17.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  collapsed:
                                                                      Container(),
                                                                  expanded:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          400.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              MessagesRecord>>(
                                                                        stream:
                                                                            queryMessagesRecord(
                                                                          parent: _model
                                                                              .chat
                                                                              ?.reference,
                                                                          queryBuilder: (messagesRecord) => messagesRecord
                                                                              .where(
                                                                                'isAnswer',
                                                                                isEqualTo: true,
                                                                              )
                                                                              .orderBy('time'),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<MessagesRecord>
                                                                              listViewMessagesRecordList =
                                                                              snapshot.data!;
                                                                          if (listViewMessagesRecordList
                                                                              .isEmpty) {
                                                                            return Image.asset(
                                                                              'assets/images/culture_and_community.png',
                                                                            );
                                                                          }
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listViewMessagesRecordList.length,
                                                                            itemBuilder:
                                                                                (context, listViewIndex) {
                                                                              final listViewMessagesRecord = listViewMessagesRecordList[listViewIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
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
                                                                                                    queryBuilder: (userRecord) => userRecord.where(
                                                                                                      'name',
                                                                                                      isEqualTo: listViewMessagesRecord.user,
                                                                                                    ),
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
                                                                                                          circleImageUserRecord?.photoUrl,
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
                                                                                                    listViewMessagesRecord.user,
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
                                                                                              listViewMessagesRecord.text,
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
                                                                                                              listViewMessagesRecord.imgPath,
                                                                                                              fit: BoxFit.contain,
                                                                                                            ),
                                                                                                            allowRotation: false,
                                                                                                            tag: listViewMessagesRecord.imgPath,
                                                                                                            useHeroAnimation: true,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                    child: Hero(
                                                                                                      tag: listViewMessagesRecord.imgPath,
                                                                                                      transitionOnUserGestures: true,
                                                                                                      child: Image.network(
                                                                                                        listViewMessagesRecord.imgPath,
                                                                                                        width: 290.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if (listViewMessagesRecord.videoPath != null && listViewMessagesRecord.videoPath != '')
                                                                                                  FlutterFlowVideoPlayer(
                                                                                                    path: listViewMessagesRecord.videoPath,
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
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        false,
                                                                    tapBodyToCollapse:
                                                                        false,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .center,
                                                                    hasIcon:
                                                                        true,
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 138.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, -1.00),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFDBE2E7),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .chatFieldController,
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                await _model
                                                                    .chat!
                                                                    .reference
                                                                    .update(
                                                                        createChatsRecordData(
                                                                  lastmessagetime:
                                                                      getCurrentTimestamp,
                                                                  lastmessageuser:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.name,
                                                                          ''),
                                                                  lastmessage:
                                                                      _model
                                                                          .chatFieldController
                                                                          .text,
                                                                ));
                                                                setState(() {
                                                                  _model.storedValue =
                                                                      _model
                                                                          .chatFieldController
                                                                          .text;
                                                                  _model.hasFirstPost =
                                                                      true;
                                                                });
                                                                setState(() {
                                                                  _model
                                                                      .chatFieldController
                                                                      ?.clear();
                                                                });
                                                                setState(() {
                                                                  _model.chat =
                                                                      _model
                                                                          .chat;
                                                                });
                                                                if (_model.chat
                                                                            ?.lastmessageuser !=
                                                                        null &&
                                                                    _model.chat
                                                                            ?.lastmessageuser !=
                                                                        '') {
                                                                  if (_model
                                                                          .chat
                                                                          ?.lastmessageuser ==
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.name,
                                                                          '')) {
                                                                    if (_model
                                                                        .chat!
                                                                        .preexistingTimestamps
                                                                        .contains(dateTimeFormat(
                                                                      'M/d H:mm',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ).substring(
                                                                            0,
                                                                            dateTimeFormat(
                                                                                  'M/d H:mm',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ).length -
                                                                                1))) {
                                                                      var messagesRecordReference1 = MessagesRecord.createDoc(_model
                                                                          .chat!
                                                                          .reference);
                                                                      await messagesRecordReference1
                                                                          .set({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              false,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                FieldValue.serverTimestamp(),
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.theDocument1 =
                                                                          MessagesRecord
                                                                              .getDocumentFromData({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              false,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                DateTime.now(),
                                                                          },
                                                                        ),
                                                                      }, messagesRecordReference1);
                                                                    } else {
                                                                      await _model
                                                                          .chat!
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'preexistingTimestamps':
                                                                                FieldValue.arrayUnion([
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
                                                                          },
                                                                        ),
                                                                      });

                                                                      var messagesRecordReference2 = MessagesRecord.createDoc(_model
                                                                          .chat!
                                                                          .reference);
                                                                      await messagesRecordReference2
                                                                          .set({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              true,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                FieldValue.serverTimestamp(),
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.theDocument2 =
                                                                          MessagesRecord
                                                                              .getDocumentFromData({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              true,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                DateTime.now(),
                                                                          },
                                                                        ),
                                                                      }, messagesRecordReference2);
                                                                    }
                                                                  } else {
                                                                    if (_model
                                                                        .chat!
                                                                        .preexistingTimestamps
                                                                        .contains(dateTimeFormat(
                                                                      'M/d H:mm',
                                                                      getCurrentTimestamp,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ).substring(
                                                                            0,
                                                                            dateTimeFormat(
                                                                                  'M/d H:mm',
                                                                                  getCurrentTimestamp,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ).length -
                                                                                1))) {
                                                                      var messagesRecordReference3 = MessagesRecord.createDoc(_model
                                                                          .chat!
                                                                          .reference);
                                                                      await messagesRecordReference3
                                                                          .set({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              false,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                FieldValue.serverTimestamp(),
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.theDocument3 =
                                                                          MessagesRecord
                                                                              .getDocumentFromData({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              false,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                DateTime.now(),
                                                                          },
                                                                        ),
                                                                      }, messagesRecordReference3);
                                                                    } else {
                                                                      await _model
                                                                          .chat!
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'preexistingTimestamps':
                                                                                FieldValue.arrayUnion([
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
                                                                          },
                                                                        ),
                                                                      });

                                                                      var messagesRecordReference4 = MessagesRecord.createDoc(_model
                                                                          .chat!
                                                                          .reference);
                                                                      await messagesRecordReference4
                                                                          .set({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              true,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                FieldValue.serverTimestamp(),
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.theDocument4 =
                                                                          MessagesRecord
                                                                              .getDocumentFromData({
                                                                        ...createMessagesRecordData(
                                                                          text:
                                                                              _model.storedValue,
                                                                          user: valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              ''),
                                                                          isAnswer:
                                                                              false,
                                                                          showName:
                                                                              false,
                                                                          showTime:
                                                                              true,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'time':
                                                                                DateTime.now(),
                                                                          },
                                                                        ),
                                                                      }, messagesRecordReference4);
                                                                    }
                                                                  }
                                                                } else {
                                                                  var messagesRecordReference5 =
                                                                      MessagesRecord.createDoc(_model
                                                                          .chat!
                                                                          .reference);
                                                                  await messagesRecordReference5
                                                                      .set({
                                                                    ...createMessagesRecordData(
                                                                      text: _model
                                                                          .storedValue,
                                                                      user: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.name,
                                                                          ''),
                                                                      isAnswer:
                                                                          false,
                                                                      showName:
                                                                          true,
                                                                      showTime:
                                                                          true,
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'time':
                                                                            FieldValue.serverTimestamp(),
                                                                      },
                                                                    ),
                                                                  });
                                                                  _model.theDocument5 =
                                                                      MessagesRecord
                                                                          .getDocumentFromData({
                                                                    ...createMessagesRecordData(
                                                                      text: _model
                                                                          .storedValue,
                                                                      user: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.name,
                                                                          ''),
                                                                      isAnswer:
                                                                          false,
                                                                      showName:
                                                                          true,
                                                                      showTime:
                                                                          true,
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'time':
                                                                            DateTime.now(),
                                                                      },
                                                                    ),
                                                                  }, messagesRecordReference5);

                                                                  await _model
                                                                      .chat!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'preexistingTimestamps':
                                                                            FieldValue.arrayUnion([
                                                                          dateTimeFormat(
                                                                            'M/d H:mm',
                                                                            getCurrentTimestamp,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ).substring(
                                                                              0,
                                                                              dateTimeFormat(
                                                                                    'M/d H:mm',
                                                                                    getCurrentTimestamp,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ).length -
                                                                                  1)
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'u4elk8qn' /* Message */,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            4.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                              validator: _model
                                                                  .chatFieldControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 56.0,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .image,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 30.0,
                                                          ),
                                                          onPressed: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
                                                              pickerFontFamily:
                                                                  'Inter',
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading1 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isDataUploading1 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile1 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl1 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                setState(() {});
                                                                return;
                                                              }
                                                            }

                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.name,
                                                                    '') ==
                                                                _model.chat
                                                                    ?.lastmessageuser) {
                                                              await MessagesRecord
                                                                      .createDoc(_model
                                                                          .chat!
                                                                          .reference)
                                                                  .set(
                                                                      createMessagesRecordData(
                                                                time:
                                                                    getCurrentTimestamp,
                                                                user: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.name,
                                                                    ''),
                                                                imgPath: _model
                                                                    .uploadedFileUrl1,
                                                                showTime: true,
                                                                showName: true,
                                                              ));
                                                            } else {
                                                              await MessagesRecord
                                                                      .createDoc(_model
                                                                          .chat!
                                                                          .reference)
                                                                  .set(
                                                                      createMessagesRecordData(
                                                                time:
                                                                    getCurrentTimestamp,
                                                                user: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.name,
                                                                    ''),
                                                                imgPath: _model
                                                                    .uploadedFileUrl1,
                                                                showTime: true,
                                                                showName: true,
                                                              ));
                                                            }

                                                            await _model
                                                                .chat!.reference
                                                                .update(
                                                                    createChatsRecordData(
                                                              lastmessage:
                                                                  'Sent an image',
                                                              lastmessagetime:
                                                                  getCurrentTimestamp,
                                                              lastmessageuser:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.name,
                                                                      ''),
                                                            ));
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 56.0,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .video,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 30.0,
                                                          ),
                                                          onPressed: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: false,
                                                              allowVideo: true,
                                                              pickerFontFamily:
                                                                  'Inter',
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading2 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isDataUploading2 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile2 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl2 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                setState(() {});
                                                                return;
                                                              }
                                                            }

                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.name,
                                                                    '') ==
                                                                _model.chat
                                                                    ?.lastmessageuser) {
                                                              await MessagesRecord
                                                                      .createDoc(_model
                                                                          .chat!
                                                                          .reference)
                                                                  .set(
                                                                      createMessagesRecordData(
                                                                time:
                                                                    getCurrentTimestamp,
                                                                user: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.name,
                                                                    ''),
                                                                imgPath: _model
                                                                    .uploadedFileUrl1,
                                                                showTime: true,
                                                                showName: true,
                                                                videoPath: _model
                                                                    .uploadedFileUrl2,
                                                              ));
                                                            } else {
                                                              await MessagesRecord
                                                                      .createDoc(_model
                                                                          .chat!
                                                                          .reference)
                                                                  .set(
                                                                      createMessagesRecordData(
                                                                time:
                                                                    getCurrentTimestamp,
                                                                user: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.name,
                                                                    ''),
                                                                showTime: true,
                                                                showName: true,
                                                                videoPath: _model
                                                                    .uploadedFileUrl2,
                                                              ));
                                                            }

                                                            await _model
                                                                .chat!.reference
                                                                .update(
                                                                    createChatsRecordData(
                                                              lastmessage:
                                                                  'Sent an image',
                                                              lastmessagetime:
                                                                  getCurrentTimestamp,
                                                              lastmessageuser:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.name,
                                                                      ''),
                                                            ));
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
                                ((_model.masterState.last == false) ||
                                    (_model.masterState.first == null)) &&
                                !_model.isAddPeople!)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 10.0, 25.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'narvjnak' /* My Chats */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Container(
                                            width: 150.0,
                                            height: 70.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (_model.isQA ?? true)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 15.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 65.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidQuestionCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
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
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 15.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 65.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidQuestionCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
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
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 15.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 65.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidUser,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
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
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 15.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 65.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidUser,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.isQA! &&
                                              (valueOrDefault(
                                                      currentUserDocument
                                                          ?.isRefugee,
                                                      '') ==
                                                  'true'))
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'home',
                                                      queryParameters: {
                                                        'startingChip':
                                                            serializeParam(
                                                          'Questions & Answers',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'h4zxa3wi' /* Search for Answers */,
                                                  ),
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.search,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 130.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    StreamBuilder<List<ChatsRecord>>(
                                      stream: queryChatsRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ChatsRecord>
                                            listViewChatsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewChatsRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewChatsRecord =
                                                listViewChatsRecordList[
                                                    listViewIndex];
                                            return Visibility(
                                              visible: (_model.isQA! &&
                                                      (listViewChatsRecord
                                                              .type ==
                                                          'QA')) ||
                                                  (!_model.isQA! &&
                                                      (listViewChatsRecord
                                                              .type !=
                                                          'QA')),
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        _model.chatting = true;
                                                        _model.chat =
                                                            listViewChatsRecord;
                                                      });

                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'recents': FieldValue
                                                                .arrayUnion([
                                                              listViewChatsRecord
                                                                  .name
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      if (listViewChatsRecord
                                                              .type ==
                                                          'QA') {
                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'recents': FieldValue
                                                                  .arrayUnion([
                                                                listViewChatsRecord
                                                                    .name
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    UserRecord>>(
                                                              stream:
                                                                  queryUserRecord(
                                                                queryBuilder: (userRecord) =>
                                                                    userRecord.whereIn(
                                                                        'name',
                                                                        listViewChatsRecord
                                                                            .users),
                                                                singleRecord:
                                                                    true,
                                                              ),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UserRecord>
                                                                    circleImageUserRecordList =
                                                                    snapshot
                                                                        .data!
                                                                        .where((u) =>
                                                                            u.uid !=
                                                                            currentUserUid)
                                                                        .toList();
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final circleImageUserRecord =
                                                                    circleImageUserRecordList
                                                                            .isNotEmpty
                                                                        ? circleImageUserRecordList
                                                                            .first
                                                                        : null;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (listViewChatsRecord
                                                                            .type ==
                                                                        'DM') {
                                                                      setState(
                                                                          () {
                                                                        FFAppState().isViewingProfile =
                                                                            true;
                                                                        FFAppState().profileToShow =
                                                                            circleImageUserRecord?.reference;
                                                                      });
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 60.0,
                                                                    height:
                                                                        60.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      (circleImageUserRecord != null) &&
                                                                              circleImageUserRecord!.hasPhotoUrl()
                                                                          ? circleImageUserRecord!.photoUrl
                                                                          : 'https://as2.ftcdn.net/v2/jpg/00/64/67/63/1000_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.00,
                                                                          0.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      listViewChatsRecord.type ==
                                                                              'DM'
                                                                          ? listViewChatsRecord
                                                                              .users
                                                                              .where((e) => e != valueOrDefault(currentUserDocument?.name, ''))
                                                                              .toList()
                                                                              .first
                                                                          : valueOrDefault<String>(
                                                                              listViewChatsRecord.name,
                                                                              'a',
                                                                            ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (listViewChatsRecord
                                                                            .type !=
                                                                        'DM')
                                                                      Stack(
                                                                        children: [
                                                                          if (listViewChatsRecord.type ==
                                                                              'QA')
                                                                            StreamBuilder<List<CategoryRecord>>(
                                                                              stream: queryCategoryRecord(
                                                                                queryBuilder: (categoryRecord) => categoryRecord.where(
                                                                                  'title',
                                                                                  isEqualTo: listViewChatsRecord.categories.first != '' ? listViewChatsRecord.categories.first : null,
                                                                                ),
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
                                                                                List<CategoryRecord> blurCategoryRecordList = snapshot.data!;
                                                                                final blurCategoryRecord = blurCategoryRecordList.isNotEmpty ? blurCategoryRecordList.first : null;
                                                                                return ClipRect(
                                                                                  child: ImageFiltered(
                                                                                    imageFilter: ImageFilter.blur(
                                                                                      sigmaX: 0.0,
                                                                                      sigmaY: 0.0,
                                                                                    ),
                                                                                    child: StreamBuilder<List<Translations8Record>>(
                                                                                      stream: queryTranslations8Record(
                                                                                        parent: blurCategoryRecord?.reference,
                                                                                        queryBuilder: (translations8Record) => translations8Record.where(
                                                                                          'language',
                                                                                          isEqualTo: stackLanguagesRecord?.code,
                                                                                        ),
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
                                                                                        List<Translations8Record> textTranslations8RecordList = snapshot.data!;
                                                                                        // Return an empty Container when the item does not exist.
                                                                                        if (snapshot.data!.isEmpty) {
                                                                                          return Container();
                                                                                        }
                                                                                        final textTranslations8Record = textTranslations8RecordList.isNotEmpty ? textTranslations8RecordList.first : null;
                                                                                        return Text(
                                                                                          valueOrDefault<String>(
                                                                                            (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations8Record?.value : blurCategoryRecord?.title,
                                                                                            'n',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge,
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          if (listViewChatsRecord.type !=
                                                                              'QA')
                                                                            Text(
                                                                              listViewChatsRecord.type == 'GC' ? '${listViewChatsRecord.users.first} & ${(listViewChatsRecord.users.length - 2).toString()} others' : 'Direct Message',
                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          'relative',
                                                                          listViewChatsRecord
                                                                              .lastmessagetime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        'New Chat',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge,
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            if (FFAppState().isViewingProfile)
                              wrapWithModel(
                                model: _model.userProfileModel,
                                updateCallback: () => setState(() {}),
                                child: UserProfileWidget(
                                  profileToShow: FFAppState().profileToShow,
                                ),
                              ),
                            if (true)
                              Stack(
                                children: [
                                  if (!(_model.chatting! &&
                                      !_model.isAddPeople!))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.00, 1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 15.0, 95.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 35.0,
                                          borderWidth: 1.0,
                                          buttonSize: 55.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            Icons.add_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 40.0,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: NewSheetWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(
                                                () => _model.isQandA = value));

                                            setState(() {
                                              _model.closeChat = false;
                                              _model.masterState = _model
                                                  .isQandA!
                                                  .toList()
                                                  .cast<bool>();
                                            });

                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  if (!_model.chatting! &&
                                      !((_model.masterState.last == false) ||
                                          _model.isAddPeople!))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.00, 1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 15.0, 95.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 35.0,
                                          borderWidth: 1.0,
                                          buttonSize: 55.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 40.0,
                                          ),
                                          onPressed: () async {
                                            if (_model.isAddPeople!) {
                                              setState(() {
                                                _model.isAddPeople = false;
                                              });
                                            } else {
                                              setState(() {
                                                _model.updateMasterStateAtIndex(
                                                  1,
                                                  (_) => false,
                                                );
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: wrapWithModel(
                            model: _model.helperNavBarModel,
                            updateCallback: () => setState(() {}),
                            child: HelperNavBarWidget(),
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
