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
        duration: Duration(milliseconds: 10),
        curve: Curves.ease,
      );
    });

    _model.emailAddressController1 ??= TextEditingController();
    _model.emailAddressController2 ??= TextEditingController(
        text: _model.professionalToEdit != null
            ? _model.professionalToEdit!.name
            : '');
    _model.emailAddressController3 ??= TextEditingController(
        text: _model.professionalToEdit != null
            ? _model.professionalToEdit!.address
            : '');
    _model.emailAddressController4 ??= TextEditingController(
        text: _model.professionalToEdit != null
            ? _model.professionalToEdit!.contact?.toString()
            : '');
    _model.emailAddressController5 ??= TextEditingController(
        text: _model.professionalToEdit != null
            ? _model.professionalToEdit!.mail
            : '');
    _model.emailAddressController6 ??= TextEditingController(
        text: !(_model.professionalToEdit != null)
            ? ''
            : _model.professionalToEdit!.name);
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
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
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
                  context.pop();
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
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: min(
                              valueOrDefault<int>(
                                widget.professionToLoad != 'none' ? 1 : 0,
                                0,
                              ),
                              1),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primary,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 17.0,
                                      ),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  tabs: [
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'zwydjgx2' /* Chats */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
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
                                              if (_model.isQandA?.first == true)
                                                Form(
                                                  key: _model.formKey1,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(25.0, 0.0,
                                                                25.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      controller: _model
                                                          .columnController1,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        25.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .inputModel1,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  InputWidget(
                                                                inputname:
                                                                    'Question',
                                                                callBack:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'd3tgc8z3' /* Which categories do your quest... */,
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
                                                          FutureBuilder<
                                                              List<
                                                                  CategoryRecord>>(
                                                            future:
                                                                queryCategoryRecordOnce(),
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
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<CategoryRecord>
                                                                  listViewCategoryRecordList =
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
                                                                    listViewCategoryRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewCategoryRecord =
                                                                      listViewCategoryRecordList[
                                                                          listViewIndex];
                                                                  return Theme(
                                                                    data:
                                                                        ThemeData(
                                                                      checkboxTheme:
                                                                          CheckboxThemeData(
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(25),
                                                                        ),
                                                                      ),
                                                                      unselectedWidgetColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .accent2,
                                                                    ),
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: _model
                                                                              .checkboxListTileValueMap1[listViewCategoryRecord] ??=
                                                                          false,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxListTileValueMap1[listViewCategoryRecord] =
                                                                                newValue!);
                                                                      },
                                                                      title:
                                                                          Text(
                                                                        listViewCategoryRecord
                                                                            .title!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      dense:
                                                                          false,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .trailing,
                                                                    ),
                                                                  );
                                                                },
                                                                controller: _model
                                                                    .listViewController1,
                                                              );
                                                            },
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          25.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      if (_model
                                                                              .checkboxListTileCheckedItems1
                                                                              .length >
                                                                          0) {
                                                                        if (_model.inputModel1.emailAddressController.text ==
                                                                                null ||
                                                                            _model.inputModel1.emailAddressController.text ==
                                                                                '') {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
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
                                                                          final chatsCreateData =
                                                                              {
                                                                            ...createChatsRecordData(
                                                                              name: _model.inputModel1.emailAddressController.text,
                                                                              type: 'QA',
                                                                            ),
                                                                            'users':
                                                                                [
                                                                              valueOrDefault(currentUserDocument?.name, '')
                                                                            ],
                                                                            'categories':
                                                                                _model.checkboxListTileCheckedItems1.map((e) => e.title).withoutNulls.toList(),
                                                                          };
                                                                          var chatsRecordReference = ChatsRecord
                                                                              .collection
                                                                              .doc();
                                                                          await chatsRecordReference
                                                                              .set(chatsCreateData);
                                                                          _model.newQChat = ChatsRecord.getDocumentFromData(
                                                                              chatsCreateData,
                                                                              chatsRecordReference);

                                                                          final messagesCreateData =
                                                                              createMessagesRecordData(
                                                                            text:
                                                                                'Created chat',
                                                                          );
                                                                          var messagesRecordReference = MessagesRecord.createDoc(_model
                                                                              .newQChat!
                                                                              .reference);
                                                                          await messagesRecordReference
                                                                              .set(messagesCreateData);
                                                                          _model.newQMessages = MessagesRecord.getDocumentFromData(
                                                                              messagesCreateData,
                                                                              messagesRecordReference);
                                                                          setState(
                                                                              () {
                                                                            _model.chat =
                                                                                _model.newQChat;
                                                                            _model.messages =
                                                                                _model.newQMessages;
                                                                            _model.chatting =
                                                                                true;
                                                                            _model.closeChat =
                                                                                true;
                                                                          });
                                                                        }
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Must select at least 1 category',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).error,
                                                                          ),
                                                                        );
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1v9fgrzl' /* Submit Question */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          130.0,
                                                                      height:
                                                                          60.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
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
                                              if (_model.isQandA?.first ==
                                                  false)
                                                Form(
                                                  key: _model.formKey2,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model
                                                                .checkboxListTileCheckedItems2
                                                                .length >
                                                            1)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        25.0,
                                                                        1.0,
                                                                        25.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .inputModel2,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  InputWidget(
                                                                inputname:
                                                                    'Name your chat',
                                                                callBack:
                                                                    () async {},
                                                              ),
                                                            ),
                                                          ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '38iynzcp' /* Add people */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: Stack(
                                                              children: [
                                                                TextFormField(
                                                                  controller: _model
                                                                      .emailAddressController1,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'aps5bki4' /* Search... */,
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
                                                                      .bodyMedium,
                                                                  maxLines:
                                                                      null,
                                                                  validator: _model
                                                                      .emailAddressController1Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
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
                                                                        60.0,
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .search,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.simpleSearchResults =
                                                                            TextSearch(
                                                                          connectUserRecordList
                                                                              .map(
                                                                                (record) => TextSearchItem(record, [
                                                                                  record.name!
                                                                                ]),
                                                                              )
                                                                              .toList(),
                                                                        ).search(_model.emailAddressController1.text).map((r) => r.object).toList();
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.isShowAll =
                                                                            false;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.68,
                                                                          0.0),
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
                                                                        60.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .close_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
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
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final people = (_model
                                                                          .isShowAll!
                                                                      ? connectUserRecordList
                                                                      : _model
                                                                          .simpleSearchResults)
                                                                  .toList();
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
                                                                    people
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        peopleIndex) {
                                                                  final peopleItem =
                                                                      people[
                                                                          peopleIndex];
                                                                  return Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              peopleItem.photoUrl != null && peopleItem.photoUrl != '' ? peopleItem.photoUrl! : 'https://picsum.photos/seed/862/600',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Theme(
                                                                              data: ThemeData(
                                                                                checkboxTheme: CheckboxThemeData(
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(25),
                                                                                  ),
                                                                                ),
                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                              ),
                                                                              child: CheckboxListTile(
                                                                                value: _model.checkboxListTileValueMap2[peopleItem] ??= false,
                                                                                onChanged: (newValue) async {
                                                                                  setState(() => _model.checkboxListTileValueMap2[peopleItem] = newValue!);
                                                                                },
                                                                                title: Text(
                                                                                  peopleItem.name!,
                                                                                  style: FlutterFlowTheme.of(context).titleLarge,
                                                                                ),
                                                                                subtitle: Text(
                                                                                  peopleItem.isRefugee! ? 'Refugee' : peopleItem.displayName!,
                                                                                  style: FlutterFlowTheme.of(context).labelLarge,
                                                                                ),
                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                dense: false,
                                                                                controlAffinity: ListTileControlAffinity.trailing,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                controller: _model
                                                                    .listViewController2,
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
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        25.0,
                                                                        15.0,
                                                                        0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if ((_model.checkboxListTileCheckedItems2.length >
                                                                            1) &&
                                                                        (_model.inputModel2.emailAddressController.text ==
                                                                                null ||
                                                                            _model.inputModel2.emailAddressController.text ==
                                                                                '')) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'No name provided for group chat',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 1000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).customColor3,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      if (_model
                                                                              .checkboxListTileCheckedItems2
                                                                              .length >
                                                                          1) {
                                                                        final chatsCreateData1 =
                                                                            {
                                                                          ...createChatsRecordData(
                                                                            name:
                                                                                _model.inputModel2.emailAddressController.text,
                                                                            type:
                                                                                'GC',
                                                                          ),
                                                                          'users': _model
                                                                              .checkboxListTileCheckedItems2
                                                                              .map((e) => e.name)
                                                                              .withoutNulls
                                                                              .toList(),
                                                                        };
                                                                        var chatsRecordReference1 = ChatsRecord
                                                                            .collection
                                                                            .doc();
                                                                        await chatsRecordReference1
                                                                            .set(chatsCreateData1);
                                                                        _model.newChat1 = ChatsRecord.getDocumentFromData(
                                                                            chatsCreateData1,
                                                                            chatsRecordReference1);

                                                                        final messagesCreateData1 =
                                                                            createMessagesRecordData(
                                                                          text:
                                                                              'Created chat',
                                                                        );
                                                                        var messagesRecordReference1 = MessagesRecord.createDoc(_model
                                                                            .newChat1!
                                                                            .reference);
                                                                        await messagesRecordReference1
                                                                            .set(messagesCreateData1);
                                                                        _model.messageDoc1 = MessagesRecord.getDocumentFromData(
                                                                            messagesCreateData1,
                                                                            messagesRecordReference1);
                                                                        setState(
                                                                            () {
                                                                          _model.chat =
                                                                              _model.newChat1;
                                                                          _model.messages =
                                                                              _model.messageDoc1;
                                                                          _model.chatting =
                                                                              true;
                                                                          _model.closeChat =
                                                                              true;
                                                                        });
                                                                      } else {
                                                                        final chatsCreateData2 =
                                                                            {
                                                                          ...createChatsRecordData(
                                                                            type:
                                                                                'DM',
                                                                          ),
                                                                          'users': _model
                                                                              .checkboxListTileCheckedItems2
                                                                              .map((e) => e.name)
                                                                              .withoutNulls
                                                                              .toList(),
                                                                        };
                                                                        var chatsRecordReference2 = ChatsRecord
                                                                            .collection
                                                                            .doc();
                                                                        await chatsRecordReference2
                                                                            .set(chatsCreateData2);
                                                                        _model.newChat2 = ChatsRecord.getDocumentFromData(
                                                                            chatsCreateData2,
                                                                            chatsRecordReference2);

                                                                        final messagesCreateData2 =
                                                                            createMessagesRecordData(
                                                                          text:
                                                                              'Created chat',
                                                                        );
                                                                        var messagesRecordReference2 = MessagesRecord.createDoc(_model
                                                                            .newChat2!
                                                                            .reference);
                                                                        await messagesRecordReference2
                                                                            .set(messagesCreateData2);
                                                                        _model.messageDoc2 = MessagesRecord.getDocumentFromData(
                                                                            messagesCreateData2,
                                                                            messagesRecordReference2);
                                                                        setState(
                                                                            () {
                                                                          _model.chat =
                                                                              _model.newChat2;
                                                                          _model.messages =
                                                                              _model.messageDoc2;
                                                                          _model.chatting =
                                                                              true;
                                                                          _model.closeChat =
                                                                              true;
                                                                        });
                                                                      }
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  text: _model.checkboxListTileCheckedItems2
                                                                              .length >
                                                                          1
                                                                      ? 'Create Group Chat'
                                                                      : 'Create Direct Message',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        50.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
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
                                            ],
                                          ),
                                          if (_model.chatting ?? true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Stack(
                                                        children: [
                                                          SingleChildScrollView(
                                                            controller: _model
                                                                .columnController2,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          150.0,
                                                                          10.0,
                                                                          130.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          MessagesRecord>>(
                                                                    stream:
                                                                        queryMessagesRecord(
                                                                      parent: _model
                                                                          .chat!
                                                                          .reference,
                                                                      queryBuilder:
                                                                          (messagesRecord) =>
                                                                              messagesRecord.orderBy('time'),
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
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
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
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            chatListMessagesRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                chatListIndex) {
                                                                          final chatListMessagesRecord =
                                                                              chatListMessagesRecordList[chatListIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Column(
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
                                                                                                    child: CircularProgressIndicator(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
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
                                                                                                  child: AuthUserStreamWidget(
                                                                                                    builder: (context) => Container(
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
                                                                                                ),
                                                                                              if (chatListMessagesRecord.user == valueOrDefault(currentUserDocument?.name, ''))
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: AuthUserStreamWidget(
                                                                                                    builder: (context) => Container(
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
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    if (chatListMessagesRecord.videoPath != null && chatListMessagesRecord.videoPath != '')
                                                                                                      FlutterFlowVideoPlayer(
                                                                                                        path: 'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                                                                                        videoType: VideoType.network,
                                                                                                        width: 280.0,
                                                                                                        height: 175.0,
                                                                                                        autoPlay: false,
                                                                                                        looping: true,
                                                                                                        showControls: true,
                                                                                                        allowFullScreen: true,
                                                                                                        allowPlaybackSpeedMenu: false,
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
                                                                                                              height: 175.0,
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
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (chatListMessagesRecord.user == valueOrDefault(currentUserDocument?.name, ''))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await chatListMessagesRecord.reference.delete();
                                                                                                },
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.solidTrashAlt,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 22.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Stack(
                                                                                          children: [
                                                                                            if (!valueOrDefault<bool>(currentUserDocument?.isRefugee, false))
                                                                                              AuthUserStreamWidget(
                                                                                                builder: (context) => ToggleIcon(
                                                                                                  onPressed: () async {
                                                                                                    final messagesUpdateData = {
                                                                                                      'isAnswer': !chatListMessagesRecord.isAnswer!,
                                                                                                    };
                                                                                                    await chatListMessagesRecord.reference.update(messagesUpdateData);
                                                                                                  },
                                                                                                  value: chatListMessagesRecord.isAnswer!,
                                                                                                  onIcon: FaIcon(
                                                                                                    FontAwesomeIcons.solidStar,
                                                                                                    color: FlutterFlowTheme.of(context).warning,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                  offIcon: FaIcon(
                                                                                                    FontAwesomeIcons.star,
                                                                                                    color: FlutterFlowTheme.of(context).warning,
                                                                                                    size: 22.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            if (valueOrDefault<bool>(currentUserDocument?.isRefugee, false) && chatListMessagesRecord.isAnswer!)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 7.0, 5.0, 5.0),
                                                                                                child: AuthUserStreamWidget(
                                                                                                  builder: (context) => FaIcon(
                                                                                                    FontAwesomeIcons.solidStar,
                                                                                                    color: FlutterFlowTheme.of(context).warning,
                                                                                                    size: 22.0,
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
                                                                          );
                                                                        },
                                                                        controller:
                                                                            _model.chatList,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    1.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxHeight: double
                                                                      .infinity,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      StreamBuilder<
                                                                          List<
                                                                              UserRecord>>(
                                                                        stream:
                                                                            queryUserRecord(
                                                                          queryBuilder: (userRecord) => userRecord.whereIn(
                                                                              'name',
                                                                              _model.chat!.users!.toList()),
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
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<UserRecord>
                                                                              circleImageUserRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final circleImageUserRecord = circleImageUserRecordList.isNotEmpty
                                                                              ? circleImageUserRecordList.first
                                                                              : null;
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.chat!.type == 'DM') {
                                                                                _model.updatePage(() {
                                                                                  FFAppState().isViewingProfile = true;
                                                                                });
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.76,
                                                                              constraints: BoxConstraints(
                                                                                maxHeight: double.infinity,
                                                                              ),
                                                                              decoration: BoxDecoration(),
                                                                              child: AutoSizeText(
                                                                                valueOrDefault<String>(
                                                                                  (_model.chat!.type == 'GC') || (_model.chat!.type == 'QA') ? _model.chat!.name : connectUserRecordList.first.name,
                                                                                  'Loading...',
                                                                                ),
                                                                                maxLines: 2,
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
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              if (_model.chat!
                                                                      .type ==
                                                                  'QA')
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        1.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          double
                                                                              .infinity,
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        initialExpanded:
                                                                            false,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'u2cdugpz' /* View Answers */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleLarge,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          collapsed:
                                                                              Container(),
                                                                          expanded:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxHeight: 220.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Padding(
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
                                                                                        child: CircularProgressIndicator(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<MessagesRecord> listViewMessagesRecordList = snapshot.data!;
                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
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
                                                                                                                  child: CircularProgressIndicator(
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                                                                                              child: SelectionArea(
                                                                                                  child: Text(
                                                                                                listViewMessagesRecord.text!,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              )),
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
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          if (valueOrDefault<
                                                              bool>(
                                                            _model.chat == null,
                                                            false,
                                                          ))
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            25.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/undraw_chatting_re_j55r_(1).svg',
                                                                      width:
                                                                          275.0,
                                                                      height:
                                                                          275.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ge2ec955' /* Start the conversation */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'vlchnj2r' /* Type something to continue */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    165.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .chatBoxModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child: ChatBoxWidget(
                                                            chat: _model.chat,
                                                            messages:
                                                                _model.messages,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          if (!_model.chatting! &&
                                              ((_model.isQandA?.last ==
                                                      false) ||
                                                  (_model.isQandA?.first ==
                                                      null)))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 10.0, 25.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'hyv65h6u' /* My Chats */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 150.0,
                                                          height: 70.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (_model
                                                                          .isQA ??
                                                                      true)
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          15.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          65.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidQuestionCircle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.isQA =
                                                                              true;
                                                                        });
                                                                      },
                                                                    ),
                                                                  if (!_model
                                                                      .isQA!)
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          15.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          65.0,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidQuestionCircle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.isQA =
                                                                              true;
                                                                        });
                                                                      },
                                                                    ),
                                                                ],
                                                              ),
                                                              Stack(
                                                                children: [
                                                                  if (!_model
                                                                      .isQA!)
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          15.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          65.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidUser,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.isQA =
                                                                              false;
                                                                        });
                                                                      },
                                                                    ),
                                                                  if (_model
                                                                          .isQA ??
                                                                      true)
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          15.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          65.0,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidUser,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            35.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.isQA =
                                                                              false;
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model.isQA! &&
                                                            valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isRefugee,
                                                                false))
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'home');
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '8jd7bu6n' /* Search for Answers */,
                                                                  ),
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .search,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        54.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            27.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<ChatsRecord>>(
                                                    stream: queryChatsRecord(),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ChatsRecord>
                                                          listViewChatsRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewChatsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewChatsRecord =
                                                              listViewChatsRecordList[
                                                                  listViewIndex];
                                                          return Visibility(
                                                            visible: (((listViewChatsRecord.type !=
                                                                            'QA') &&
                                                                        !_model
                                                                            .isQA!) ||
                                                                    ((listViewChatsRecord.type ==
                                                                            'QA') &&
                                                                        _model
                                                                            .isQA!)) &&
                                                                (listViewChatsRecord
                                                                        .users!
                                                                        .toList()
                                                                        .contains(valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.name,
                                                                            '')) ||
                                                                    !valueOrDefault<
                                                                            bool>(
                                                                        currentUserDocument
                                                                            ?.isRefugee,
                                                                        false)),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
                                                                  child:
                                                                      InkWell(
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
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.chatting =
                                                                            true;
                                                                        _model.chat =
                                                                            listViewChatsRecord;
                                                                      });
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        StreamBuilder<
                                                                            List<UserRecord>>(
                                                                          stream:
                                                                              queryUserRecord(
                                                                            queryBuilder: (userRecord) =>
                                                                                userRecord.whereIn('name', listViewChatsRecord.users!.toList()),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<UserRecord>
                                                                                circleImageUserRecordList =
                                                                                snapshot.data!.where((u) => u.uid != currentUserUid).toList();
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final circleImageUserRecord = circleImageUserRecordList.isNotEmpty
                                                                                ? circleImageUserRecordList.first
                                                                                : null;
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
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        (listViewChatsRecord.type == 'GC') || (listViewChatsRecord.type == 'QA')
                                                                                            ? listViewChatsRecord.name
                                                                                            : valueOrDefault<String>(
                                                                                                listViewChatsRecord.users!.toList().where((e) => e != valueOrDefault(currentUserDocument?.name, '')).toList().first,
                                                                                                'Loading...',
                                                                                              ),
                                                                                        'Loading...',
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
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        controller: _model
                                                            .listViewController4,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (FFAppState().isViewingProfile)
                                            wrapWithModel(
                                              model: _model.userProfileModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: UserProfileWidget(
                                                profileToShow:
                                                    FFAppState().profileToShow,
                                              ),
                                            ),
                                          if (!_model.chatting!)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.03, 0.99),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 15.0, 95.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 35.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 55.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  icon: Icon(
                                                    Icons.add_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                      builder:
                                                          (bottomSheetContext) {
                                                        return GestureDetector(
                                                          onTap: () => FocusScope
                                                                  .of(context)
                                                              .requestFocus(
                                                                  _unfocusNode),
                                                          child: Padding(
                                                            padding: MediaQuery.of(
                                                                    bottomSheetContext)
                                                                .viewInsets,
                                                            child:
                                                                NewSheetWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) => setState(
                                                        () => _model.isQandA =
                                                            value));

                                                    setState(() {
                                                      _model.closeChat = false;
                                                    });

                                                    setState(() {});
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
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isRefugee,
                                              false))
                                            AuthUserStreamWidget(
                                              builder: (context) => Stack(
                                                children: [
                                                  if (!_model.filtering!)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    0.0,
                                                                    25.0,
                                                                    0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          controller: _model
                                                              .healthcareCr,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            _model.filtering =
                                                                                true;
                                                                          });
                                                                        },
                                                                        text: _model.profession ==
                                                                                'none'
                                                                            ? 'All professions'
                                                                            : _model.profession!,
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              130.0,
                                                                          height:
                                                                              50.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              StreamBuilder<
                                                                  List<
                                                                      ProfessionalsRecord>>(
                                                                stream:
                                                                    queryProfessionalsRecord(
                                                                  queryBuilder: (professionalsRecord) => professionalsRecord.where(
                                                                      'language',
                                                                      isEqualTo: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.language,
                                                                          '')),
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
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ProfessionalsRecord>
                                                                      columnProfessionalsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        columnProfessionalsRecordList
                                                                            .length,
                                                                        (columnIndex) {
                                                                      final columnProfessionalsRecord =
                                                                          columnProfessionalsRecordList[
                                                                              columnIndex];
                                                                      return Visibility(
                                                                        visible: ((_model.language == 'none') && (_model.profession == 'none')) ||
                                                                                ((_model.language == 'none') && (_model.profession == columnProfessionalsRecord.profession)) ||
                                                                                ((_model.profession == columnProfessionalsRecord.profession) && (_model.language == columnProfessionalsRecord.language)) ||
                                                                                ((_model.language == columnProfessionalsRecord.language) && (_model.profession == columnProfessionalsRecord.profession))
                                                                            ? true
                                                                            : false,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              25.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.9,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 4.0,
                                                                                  color: Color(0x33000000),
                                                                                  offset: Offset(0.0, 2.0),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                              shape: BoxShape.rectangle,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: Text(
                                                                                    columnProfessionalsRecord.name!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          fontSize: 20.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Divider(
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: Text(
                                                                                    columnProfessionalsRecord.profession!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: Text(
                                                                                    columnProfessionalsRecord.language!,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if (columnProfessionalsRecord.registrationstatus == 'Practicing')
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                    child: Text(
                                                                                      columnProfessionalsRecord.registrationstatus!,
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: Text(
                                                                                    columnProfessionalsRecord.address!,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if (columnProfessionalsRecord.mail != '')
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                    child: Text(
                                                                                      columnProfessionalsRecord.mail!,
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await launchUrl(Uri(
                                                                                        scheme: 'tel',
                                                                                        path: columnProfessionalsRecord.contact!.toString(),
                                                                                      ));
                                                                                    },
                                                                                    text: columnProfessionalsRecord.contact!.toString(),
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.phone,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: 150.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      hoverBorderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                    ),
                                                  if (_model.filtering ?? true)
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      height: 1000.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          if (!_model
                                                              .isDialogue!)
                                                            SingleChildScrollView(
                                                              controller: _model
                                                                  .columnController3,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.filtering = false;
                                                                            });
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'uw2wpqb5' /* Xmark */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                60.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'fa',
                                                                                  fontSize: 30.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '8wdnx7vu' /* Filter by profession */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleLarge,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25.0,
                                                                            0.0,
                                                                            25.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
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
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.profession =
                                                                              'none';
                                                                          _model.filtering =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Row(
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
                                                                            thickness:
                                                                                2.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  StreamBuilder<
                                                                      List<
                                                                          ProfessionsRecord>>(
                                                                    stream:
                                                                        queryProfessionsRecord(),
                                                                    builder:
                                                                        (context,
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
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ProfessionsRecord>
                                                                          columnProfessionsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            columnProfessionsRecordList.length,
                                                                            (columnIndex) {
                                                                          final columnProfessionsRecord =
                                                                              columnProfessionsRecordList[columnIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                25.0,
                                                                                0.0,
                                                                                25.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
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
                                                                                        Text(
                                                                                          columnProfessionsRecord.name!,
                                                                                          style: FlutterFlowTheme.of(context).titleLarge,
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            40.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
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
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.isDialogue =
                                                                              true;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'rclmuood' /* Why are there no specialists a... */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                          if (_model
                                                                  .isDialogue ??
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          40.0,
                                                                          20.0,
                                                                          120.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 4.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          'assets/images/undraw_medicine_b-1-ol.svg',
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              200.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              20.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              20.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              RichText(
                                                                            text:
                                                                                TextSpan(
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              20.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() {
                                                                                _model.isDialogue = false;
                                                                              });
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              '1qp0ba0m' /* Done */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
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
                                            ),
                                          SingleChildScrollView(
                                            controller:
                                                _model.columnController4,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isRefugee,
                                                    false))
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Stack(
                                                      children: [
                                                        if (!_model.isEdit!)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        0.0,
                                                                        25.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          100.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.isEdit =
                                                                            true;
                                                                        _model.isNew =
                                                                            true;
                                                                        _model.professionalToEdit =
                                                                            null;
                                                                      });
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '4qokrdvi' /* New Professional */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          250.0,
                                                                      height:
                                                                          60.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          50.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.isEdit =
                                                                            true;
                                                                        _model.isNew =
                                                                            false;
                                                                        _model.professionalToEdit =
                                                                            null;
                                                                      });
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ynhx9q02' /* Edit Professional */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          250.0,
                                                                      height:
                                                                          60.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (!_model.isNew! &&
                                                            _model.isEdit!)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        50.0,
                                                                        25.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'bp9hl6ef' /* Select profile to edit */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          50.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          ProfessionalsRecord>>(
                                                                    stream:
                                                                        queryProfessionalsRecord(),
                                                                    builder:
                                                                        (context,
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
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ProfessionalsRecord>
                                                                          listViewProfessionalsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listViewProfessionalsRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewProfessionalsRecord =
                                                                              listViewProfessionalsRecordList[listViewIndex];
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              setState(() {
                                                                                _model.professionalToEdit = listViewProfessionalsRecord;
                                                                                _model.isNew = true;
                                                                                _model.isEdit = true;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    listViewProfessionalsRecord.name!,
                                                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                                                  ),
                                                                                ),
                                                                                Divider(
                                                                                  thickness: 2.0,
                                                                                  color: FlutterFlowTheme.of(context).accent3,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                        controller:
                                                                            _model.listViewController5,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        SingleChildScrollView(
                                                          controller: _model
                                                              .columnController5,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (_model
                                                                      .isNew ??
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25.0,
                                                                          75.0,
                                                                          25.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Wrap(
                                                                        spacing:
                                                                            0.0,
                                                                        runSpacing:
                                                                            0.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          TextFormField(
                                                                            controller:
                                                                                _model.emailAddressController2,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '5vjl1sxu' /* Name */,
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
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            maxLines:
                                                                                null,
                                                                            validator:
                                                                                _model.emailAddressController2Validator.asValidator(context),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                25.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.emailAddressController3,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'jcqqhkrw' /* Address */,
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
                                                                              validator: _model.emailAddressController3Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                25.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.emailAddressController4,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'p582rc5d' /* Phone */,
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
                                                                              keyboardType: TextInputType.phone,
                                                                              validator: _model.emailAddressController4Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                25.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.emailAddressController5,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  '42ndxpme' /* Email */,
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
                                                                              keyboardType: TextInputType.emailAddress,
                                                                              validator: _model.emailAddressController5Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                25.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.emailAddressController6,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                  'azdtv48g' /* Website */,
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
                                                                              validator: _model.emailAddressController6Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                25.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownValueController1 ??= FormFieldController<String>(
                                                                                _model.dropDownValue1 ??= _model.professionalToEdit != null ? _model.professionalToEdit!.language : 'Arabic',
                                                                              ),
                                                                              options: [
                                                                                FFLocalizations.of(context).getText(
                                                                                  'fjzwgoaa' /* Arabic */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  'mmagyy4k' /* Pashto */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  'w4z95n4p' /* Farsi */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  '9c12oxa7' /* Ukrainian */,
                                                                                )
                                                                              ],
                                                                              onChanged: (val) => setState(() => _model.dropDownValue1 = val),
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              searchHintTextStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'i893p2fm' /* Please select... */,
                                                                              ),
                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                'qt4y5sub' /* Search for an item... */,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: Colors.transparent,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 0.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                25.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownValueController2 ??= FormFieldController<String>(
                                                                                _model.dropDownValue2 ??= _model.professionalToEdit != null ? _model.professionalToEdit!.profession : 'Doctor',
                                                                              ),
                                                                              options: [
                                                                                FFLocalizations.of(context).getText(
                                                                                  '6ri70pdu' /* Doctor */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  'teao2k2p' /* Psychologist */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  '35msbm68' /* Counsellor */,
                                                                                )
                                                                              ],
                                                                              onChanged: (val) => setState(() => _model.dropDownValue2 = val),
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              searchHintTextStyle: FlutterFlowTheme.of(context).labelLarge,
                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                'ip19ze80' /* Please select... */,
                                                                              ),
                                                                              searchHintText: FFLocalizations.of(context).getText(
                                                                                'py9iu7zi' /* Search for an item... */,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: Colors.transparent,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 0.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isSearchable: false,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 25.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  if (_model.professionalToEdit != null) {
                                                                                    final professionalsUpdateData = createProfessionalsRecordData(
                                                                                      address: _model.emailAddressController3.text,
                                                                                      language: _model.dropDownValue1,
                                                                                      name: _model.emailAddressController2.text,
                                                                                      profession: _model.dropDownValue2,
                                                                                      contact: int.tryParse(_model.emailAddressController4.text),
                                                                                      mail: _model.emailAddressController5.text,
                                                                                      website: _model.emailAddressController6.text,
                                                                                    );
                                                                                    await _model.professionalToEdit!.reference.update(professionalsUpdateData);
                                                                                  } else {
                                                                                    final professionalsCreateData = createProfessionalsRecordData(
                                                                                      address: _model.emailAddressController3.text,
                                                                                      language: _model.dropDownValue1,
                                                                                      name: _model.emailAddressController2.text,
                                                                                      profession: _model.dropDownValue2,
                                                                                      mail: _model.emailAddressController5.text,
                                                                                      website: _model.emailAddressController6.text,
                                                                                      contact: int.tryParse(_model.emailAddressController4.text),
                                                                                    );
                                                                                    await ProfessionalsRecord.collection.doc().set(professionalsCreateData);
                                                                                  }

                                                                                  setState(() {
                                                                                    _model.isNew = false;
                                                                                    _model.isEdit = false;
                                                                                  });
                                                                                },
                                                                                text: _model.professionalToEdit != null ? 'Save Changes' : 'New Professional',
                                                                                options: FFButtonOptions(
                                                                                  width: 225.0,
                                                                                  height: 60.0,
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
                                                                                  borderRadius: BorderRadius.circular(30.0),
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
                                                      ],
                                                    ),
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
                            ],
                          ),
                        ),
                      ),
                    ],
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
              ),
            ),
          ),
        );
      },
    );
  }
}
