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
import 'connecthealthcare_model.dart';
export 'connecthealthcare_model.dart';

class ConnecthealthcareWidget extends StatefulWidget {
  const ConnecthealthcareWidget({
    Key? key,
    bool? loadProfessionals,
    this.chatToLoad,
    this.messagesToLoad,
  })  : this.loadProfessionals = loadProfessionals ?? false,
        super(key: key);

  final bool loadProfessionals;
  final ChatsRecord? chatToLoad;
  final List<MessagesRecord>? messagesToLoad;

  @override
  _ConnecthealthcareWidgetState createState() =>
      _ConnecthealthcareWidgetState();
}

class _ConnecthealthcareWidgetState extends State<ConnecthealthcareWidget> {
  late ConnecthealthcareModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnecthealthcareModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.chatToLoad != null) {
        setState(() {
          _model.chatting = true;
          _model.chat = widget.chatToLoad;
          _model.isQA = true;
        });
      }
    });

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Visibility(
          visible: _model.showFAB! &&
              !_model.chatting! &&
              !valueOrDefault<bool>(
                _model.isQandA?.last,
                false,
              ),
          child: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (bottomSheetContext) {
                  return GestureDetector(
                    onTap: () =>
                        FocusScope.of(context).requestFocus(_unfocusNode),
                    child: Padding(
                      padding: MediaQuery.of(bottomSheetContext).viewInsets,
                      child: NewSheetWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() => _model.isQandA = value));

              setState(() {
                _model.closeChat = false;
              });

              setState(() {});
            },
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            elevation: 8.0,
            child: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 40.0,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Align(
            alignment: AlignmentDirectional(-0.95, 0.0),
            child: InkWell(
              onTap: () async {
                setState(() {});
              },
              child: Text(
                FFLocalizations.of(context).getText(
                  'a7w5tnpx' /* Healthcare Professionals */,
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
              ),
            ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed('settings');
                  },
                  child: FaIcon(
                    FontAwesomeIcons.cog,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.of(context).primary,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: 'Inter',
                                fontSize: 16.0,
                              ),
                      indicatorColor: FlutterFlowTheme.of(context).secondary,
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
                    Expanded(
                      child: TabBarView(
                        children: [
                          KeepAliveWidgetWrapper(
                            builder: (context) => InkWell(
                              onTap: () async {
                                setState(() {
                                  _model.showFAB = true;
                                });
                              },
                              child: Stack(
                                children: [
                                  Stack(
                                    children: [
                                      if (valueOrDefault<bool>(
                                            _model.isQandA?.last,
                                            false,
                                          ) &&
                                          valueOrDefault<bool>(
                                            _model.isQandA?.first,
                                            true,
                                          ) &&
                                          !_model.closeChat!)
                                        Form(
                                          key: _model.formKey1,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 25.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model.inputModel1,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: InputWidget(
                                                        inputname: 'Question',
                                                        callBack: () async {},
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
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge,
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
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CategoryRecord>
                                                          listViewCategoryRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewCategoryRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewCategoryRecord =
                                                              listViewCategoryRecordList[
                                                                  listViewIndex];
                                                          return Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
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
                                                                listViewCategoryRecord
                                                                    .title!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (_model.isQA ?? true)
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
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
                                                                  if (_model.inputModel1.emailAddressController
                                                                              .text ==
                                                                          null ||
                                                                      _model.inputModel1.emailAddressController
                                                                              .text ==
                                                                          '') {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'No question name provided',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    final chatsCreateData =
                                                                        {
                                                                      ...createChatsRecordData(
                                                                        name: _model
                                                                            .inputModel1
                                                                            .emailAddressController
                                                                            .text,
                                                                        type:
                                                                            'QA',
                                                                      ),
                                                                      'users': [
                                                                        valueOrDefault(
                                                                            currentUserDocument?.name,
                                                                            '')
                                                                      ],
                                                                      'categories': _model
                                                                          .checkboxListTileCheckedItems1
                                                                          .map((e) =>
                                                                              e.title)
                                                                          .withoutNulls
                                                                          .toList(),
                                                                    };
                                                                    var chatsRecordReference =
                                                                        ChatsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await chatsRecordReference
                                                                        .set(
                                                                            chatsCreateData);
                                                                    _model.newQChat =
                                                                        ChatsRecord.getDocumentFromData(
                                                                            chatsCreateData,
                                                                            chatsRecordReference);

                                                                    final messagesCreateData =
                                                                        createMessagesRecordData(
                                                                      text:
                                                                          'Created chat',
                                                                    );
                                                                    var messagesRecordReference =
                                                                        MessagesRecord.createDoc(_model
                                                                            .newQChat!
                                                                            .reference);
                                                                    await messagesRecordReference
                                                                        .set(
                                                                            messagesCreateData);
                                                                    _model.newQMessages =
                                                                        MessagesRecord.getDocumentFromData(
                                                                            messagesCreateData,
                                                                            messagesRecordReference);
                                                                    setState(
                                                                        () {
                                                                      _model.chat =
                                                                          _model
                                                                              .newQChat;
                                                                      _model.messages =
                                                                          _model
                                                                              .newQMessages;
                                                                      _model.chatting =
                                                                          true;
                                                                      _model.closeChat =
                                                                          true;
                                                                    });
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Must select at least 1 category',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                    ),
                                                                  );
                                                                }

                                                                setState(() {});
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '1v9fgrzl' /* Submit Question */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                            25.0),
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
                                      if (valueOrDefault<bool>(
                                            _model.isQandA?.last,
                                            false,
                                          ) &&
                                          !valueOrDefault<bool>(
                                            _model.isQandA?.first,
                                            true,
                                          ) &&
                                          !_model.closeChat!)
                                        Form(
                                          key: _model.formKey2,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 25.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model
                                                        .checkboxListTileCheckedItems2
                                                        .length >
                                                    1)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 25.0),
                                                    child: wrapWithModel(
                                                      model: _model.inputModel2,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: InputWidget(
                                                        inputname:
                                                            'Name your chat',
                                                        callBack: () async {},
                                                      ),
                                                    ),
                                                  ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '38iynzcp' /* Add people */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<UserRecord>>(
                                                    stream: queryUserRecord(
                                                      queryBuilder: (userRecord) =>
                                                          userRecord.where(
                                                              'uid',
                                                              isNotEqualTo:
                                                                  currentUserUid),
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
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UserRecord>
                                                          listViewUserRecordList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewUserRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewUserRecord =
                                                              listViewUserRecordList[
                                                                  listViewIndex];
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
                                                                      'https://picsum.photos/seed/862/600',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Theme(
                                                                      data:
                                                                          ThemeData(
                                                                        unselectedWidgetColor:
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                      ),
                                                                      child:
                                                                          CheckboxListTile(
                                                                        value: _model.checkboxListTileValueMap2[listViewUserRecord] ??=
                                                                            false,
                                                                        onChanged:
                                                                            (newValue) async {
                                                                          setState(() =>
                                                                              _model.checkboxListTileValueMap2[listViewUserRecord] = newValue!);
                                                                        },
                                                                        title:
                                                                            Text(
                                                                          listViewUserRecord
                                                                              .name!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleLarge,
                                                                        ),
                                                                        subtitle:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '8ociljkb' /* Subtitle */,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).labelLarge,
                                                                        ),
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        dense:
                                                                            false,
                                                                        controlAffinity:
                                                                            ListTileControlAffinity.trailing,
                                                                      ),
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
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if ((_model.checkboxListTileCheckedItems2
                                                                        .length >
                                                                    1) &&
                                                                (_model.inputModel2.emailAddressController
                                                                            .text ==
                                                                        null ||
                                                                    _model
                                                                            .inputModel2
                                                                            .emailAddressController
                                                                            .text ==
                                                                        '')) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'No name provided for group chat',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor3,
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
                                                                    name: _model
                                                                        .inputModel2
                                                                        .emailAddressController
                                                                        .text,
                                                                    type: 'GC',
                                                                  ),
                                                                  'users': _model
                                                                      .checkboxListTileCheckedItems2
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .withoutNulls
                                                                      .toList(),
                                                                };
                                                                var chatsRecordReference1 =
                                                                    ChatsRecord
                                                                        .collection
                                                                        .doc();
                                                                await chatsRecordReference1
                                                                    .set(
                                                                        chatsCreateData1);
                                                                _model.newChat1 =
                                                                    ChatsRecord.getDocumentFromData(
                                                                        chatsCreateData1,
                                                                        chatsRecordReference1);

                                                                final messagesCreateData1 =
                                                                    createMessagesRecordData(
                                                                  text:
                                                                      'Created chat',
                                                                );
                                                                var messagesRecordReference1 =
                                                                    MessagesRecord.createDoc(_model
                                                                        .newChat1!
                                                                        .reference);
                                                                await messagesRecordReference1
                                                                    .set(
                                                                        messagesCreateData1);
                                                                _model.messageDoc1 =
                                                                    MessagesRecord.getDocumentFromData(
                                                                        messagesCreateData1,
                                                                        messagesRecordReference1);
                                                                setState(() {
                                                                  _model.chat =
                                                                      _model
                                                                          .newChat1;
                                                                  _model.messages =
                                                                      _model
                                                                          .messageDoc1;
                                                                  _model.chatting =
                                                                      true;
                                                                  _model.closeChat =
                                                                      true;
                                                                });
                                                              } else {
                                                                final chatsCreateData2 =
                                                                    {
                                                                  ...createChatsRecordData(
                                                                    type: 'DM',
                                                                  ),
                                                                  'users': _model
                                                                      .checkboxListTileCheckedItems2
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .withoutNulls
                                                                      .toList(),
                                                                };
                                                                var chatsRecordReference2 =
                                                                    ChatsRecord
                                                                        .collection
                                                                        .doc();
                                                                await chatsRecordReference2
                                                                    .set(
                                                                        chatsCreateData2);
                                                                _model.newChat2 =
                                                                    ChatsRecord.getDocumentFromData(
                                                                        chatsCreateData2,
                                                                        chatsRecordReference2);

                                                                final messagesCreateData2 =
                                                                    createMessagesRecordData(
                                                                  text:
                                                                      'Created chat',
                                                                );
                                                                var messagesRecordReference2 =
                                                                    MessagesRecord.createDoc(_model
                                                                        .newChat2!
                                                                        .reference);
                                                                await messagesRecordReference2
                                                                    .set(
                                                                        messagesCreateData2);
                                                                _model.messageDoc2 =
                                                                    MessagesRecord.getDocumentFromData(
                                                                        messagesCreateData2,
                                                                        messagesRecordReference2);
                                                                setState(() {
                                                                  _model.chat =
                                                                      _model
                                                                          .newChat2;
                                                                  _model.messages =
                                                                      _model
                                                                          .messageDoc2;
                                                                  _model.chatting =
                                                                      true;
                                                                  _model.closeChat =
                                                                      true;
                                                                });
                                                              }
                                                            }

                                                            setState(() {});
                                                          },
                                                          text: _model.checkboxListTileCheckedItems2
                                                                      .length >
                                                                  1
                                                              ? 'Create Group Chat'
                                                              : 'Create Direct Message',
                                                          options:
                                                              FFButtonOptions(
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
                                                                        25.0),
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
                                    SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          wrapWithModel(
                                            model: _model.chatInterfaceModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: ChatInterfaceWidget(
                                              chat: _model.chat,
                                              messages: _model.messages,
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.chatBoxModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: ChatBoxWidget(
                                              chat: _model.chat,
                                              messages: _model.messages,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (!_model.chatting! &&
                                      !valueOrDefault<bool>(
                                        _model.isQandA?.last,
                                        false,
                                      ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 25.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'hyv65h6u' /* My Chats */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Container(
                                                  width: 150.0,
                                                  height: 70.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (_model.isQA ??
                                                              true)
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  15.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 65.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidQuestionCircle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                size: 35.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  _model.isQA =
                                                                      true;
                                                                });
                                                              },
                                                            ),
                                                          if (!_model.isQA!)
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  15.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 65.0,
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidQuestionCircle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 35.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  _model.isQA =
                                                                      true;
                                                                });
                                                              },
                                                            ),
                                                        ],
                                                      ),
                                                      Stack(
                                                        children: [
                                                          if (!_model.isQA!)
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  15.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 65.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidUser,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                size: 35.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  _model.isQA =
                                                                      false;
                                                                });
                                                              },
                                                            ),
                                                          if (_model.isQA ??
                                                              true)
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  15.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 65.0,
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .solidUser,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 35.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.isQA ?? true)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  15.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text:
                                                            FFLocalizations.of(
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
                                                                      25.0),
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                                    listViewChatsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewChatsRecord =
                                                      listViewChatsRecordList[
                                                          listViewIndex];
                                                  return Visibility(
                                                    visible:
                                                        ((listViewChatsRecord
                                                                        .type !=
                                                                    'QA') &&
                                                                !_model
                                                                    .isQA!) ||
                                                            ((listViewChatsRecord
                                                                        .type ==
                                                                    'QA') &&
                                                                _model.isQA!),
                                                    child: Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            setState(() {
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
                                                              Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  'https://picsum.photos/seed/908/600',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Text(
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
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'crub2sa5' /* Hello World */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelLarge,
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
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelLarge,
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
                                ],
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => InkWell(
                              onTap: () async {
                                setState(() {
                                  _model.showFAB = false;
                                });
                              },
                              child: Stack(
                                children: [
                                  if (!_model.filtering!)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 0.0, 25.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          setState(() {
                                                            _model.filtering =
                                                                true;
                                                          });
                                                        },
                                                        text: _model.profession ==
                                                                'none'
                                                            ? 'All professions'
                                                            : _model
                                                                .profession!,
                                                        options:
                                                            FFButtonOptions(
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
                                                                      15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              StreamBuilder<
                                                  List<ProfessionalsRecord>>(
                                                stream:
                                                    queryProfessionalsRecord(),
                                                builder: (context, snapshot) {
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
                                                  List<ProfessionalsRecord>
                                                      columnProfessionalsRecordList =
                                                      snapshot.data!;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnProfessionalsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnProfessionalsRecord =
                                                          columnProfessionalsRecordList[
                                                              columnIndex];
                                                      return Visibility(
                                                        visible: ((_model.language ==
                                                                        'none') &&
                                                                    (_model.profession ==
                                                                        'none')) ||
                                                                ((_model.language ==
                                                                        'none') &&
                                                                    (_model.profession ==
                                                                        columnProfessionalsRecord
                                                                            .profession)) ||
                                                                ((_model.profession ==
                                                                        columnProfessionalsRecord
                                                                            .profession) &&
                                                                    (_model.language ==
                                                                        columnProfessionalsRecord
                                                                            .language)) ||
                                                                ((_model.language ==
                                                                        columnProfessionalsRecord
                                                                            .language) &&
                                                                    (_model.profession ==
                                                                        columnProfessionalsRecord
                                                                            .profession))
                                                            ? true
                                                            : false,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      25.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.9,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    columnProfessionalsRecord
                                                                        .name!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              20.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    columnProfessionalsRecord
                                                                        .profession!,
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
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    columnProfessionalsRecord
                                                                        .language!,
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
                                                                ),
                                                                if (columnProfessionalsRecord
                                                                        .registrationstatus ==
                                                                    'Practicing')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      columnProfessionalsRecord
                                                                          .registrationstatus!,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
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
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    columnProfessionalsRecord
                                                                        .address!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
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
                                                                ),
                                                                if (columnProfessionalsRecord
                                                                        .mail !=
                                                                    '')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      columnProfessionalsRecord
                                                                          .mail!,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
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
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await launchUrl(
                                                                          Uri(
                                                                        scheme:
                                                                            'tel',
                                                                        path: columnProfessionalsRecord
                                                                            .contact!
                                                                            .toString(),
                                                                      ));
                                                                    },
                                                                    text: columnProfessionalsRecord
                                                                        .contact!
                                                                        .toString(),
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .phone,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          40.0,
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
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Colors.white,
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
                                                                              15.0),
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      hoverBorderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      hoverTextColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
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
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 1000.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.filtering =
                                                            false;
                                                      });
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'uw2wpqb5' /* Xmark */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 60.0,
                                                      height: 60.0,
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
                                                              .primaryBtnText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'fa',
                                                                fontSize: 30.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '8wdnx7vu' /* Filter by profession */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 25.0, 0.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    _model.profession = 'none';
                                                    _model.filtering = false;
                                                  });
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'zubc6umi' /* bars */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'fa',
                                                                    fontSize:
                                                                        30.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '6h173vc7' /* No filter */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            StreamBuilder<
                                                List<ProfessionsRecord>>(
                                              stream: queryProfessionsRecord(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ProfessionsRecord>
                                                    columnProfessionsRecordList =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnProfessionsRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnProfessionsRecord =
                                                        columnProfessionsRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  0.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.profession =
                                                                columnProfessionsRecord
                                                                    .name;
                                                            _model.filtering =
                                                                false;
                                                          });
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      columnProfessionsRecord
                                                                          .icon!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'fa',
                                                                            fontSize:
                                                                                30.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    columnProfessionsRecord
                                                                        .name!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 2.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                          ],
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
    );
  }
}
