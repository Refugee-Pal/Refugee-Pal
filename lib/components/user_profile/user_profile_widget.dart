import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({
    Key? key,
    this.profileToShow,
  }) : super(key: key);

  final DocumentReference? profileToShow;

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<LanguagesRecord>>(
        stream: queryLanguagesRecord(
          queryBuilder: (languagesRecord) => languagesRecord.where('Name',
              isEqualTo: valueOrDefault(currentUserDocument?.language, '')),
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
          List<LanguagesRecord> containerLanguagesRecordList = snapshot.data!;
          final containerLanguagesRecord =
              containerLanguagesRecordList.isNotEmpty
                  ? containerLanguagesRecordList.first
                  : null;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<UserRecord>(
                    stream: UserRecord.getDocument(widget.profileToShow!),
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
                      final stackUserRecord = snapshot.data!;
                      return Stack(
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              _model.updatePage(() {
                                FFAppState().isViewingProfile = false;
                              });
                            },
                            text: FFLocalizations.of(context).getText(
                              'ir6nlgtk' /* Xmark */,
                            ),
                            options: FFButtonOptions(
                              width: 60.0,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'fa',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 25.0, 25.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 0.0),
                                    child: Container(
                                      width: 150.0,
                                      height: 150.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        stackUserRecord.photoUrl != null &&
                                                stackUserRecord.photoUrl != ''
                                            ? stackUserRecord.photoUrl!
                                            : 'https://picsum.photos/seed/922/600',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      stackUserRecord.name!,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 10.0),
                                    child: StreamBuilder<
                                        List<Translations14Record>>(
                                      stream: queryTranslations14Record(
                                        parent: stackUserRecord.reference,
                                      ),
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
                                        List<Translations14Record>
                                            textTranslations14RecordList =
                                            snapshot.data!;
                                        return Text(
                                          () {
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.isRefugee,
                                                    '') ==
                                                'true') {
                                              return 'Refugee';
                                            } else if (stackUserRecord
                                                        .displayName !=
                                                    null &&
                                                stackUserRecord.displayName !=
                                                    '') {
                                              return valueOrDefault<String>(
                                                (containerLanguagesRecord!
                                                                .name !=
                                                            'English') &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.translateApp,
                                                                '') ==
                                                            'true')
                                                    ? textTranslations14RecordList
                                                        .where((e) =>
                                                            e.reference.id ==
                                                            containerLanguagesRecord!
                                                                .code)
                                                        .toList()
                                                        .first
                                                        .value
                                                    : stackUserRecord.language,
                                                'n',
                                              );
                                            } else {
                                              return 'Helper';
                                            }
                                          }(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 25.0),
                                    child: StreamBuilder<List<MessagesRecord>>(
                                      stream: queryMessagesRecord(
                                        parent: _model.newChat2!.reference,
                                      ),
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
                                        List<MessagesRecord>
                                            buttonMessagesRecordList =
                                            snapshot.data!;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            final chatsCreateData = {
                                              ...createChatsRecordData(
                                                type: 'DM',
                                                lastmessage: '',
                                              ),
                                              'users': (String var1,
                                                      String var2) {
                                                return [var1, var2];
                                              }(
                                                  stackUserRecord.name!,
                                                  valueOrDefault(
                                                      currentUserDocument?.name,
                                                      '')),
                                            };
                                            var chatsRecordReference =
                                                ChatsRecord.collection.doc();
                                            await chatsRecordReference
                                                .set(chatsCreateData);
                                            _model.newChat2 =
                                                ChatsRecord.getDocumentFromData(
                                                    chatsCreateData,
                                                    chatsRecordReference);

                                            final messagesCreateData =
                                                createMessagesRecordData(
                                              text: 'Created chat',
                                            );
                                            var messagesRecordReference =
                                                MessagesRecord.createDoc(
                                                    _model.newChat2!.reference);
                                            await messagesRecordReference
                                                .set(messagesCreateData);
                                            _model.messageDoc2 = MessagesRecord
                                                .getDocumentFromData(
                                                    messagesCreateData,
                                                    messagesRecordReference);

                                            context.pushNamed(
                                              'connect',
                                              queryParams: {
                                                'chatToLoad': serializeParam(
                                                  _model.newChat2,
                                                  ParamType.Document,
                                                ),
                                                'messagesToLoad':
                                                    serializeParam(
                                                  buttonMessagesRecordList,
                                                  ParamType.Document,
                                                  true,
                                                ),
                                                'professionToLoad':
                                                    serializeParam(
                                                  'none',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'chatToLoad': _model.newChat2,
                                                'messagesToLoad':
                                                    buttonMessagesRecordList,
                                              },
                                            );

                                            setState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'hqwiuqi3' /* New Direct Message */,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (stackUserRecord.description != null &&
                                      stackUserRecord.description != '')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: StreamBuilder<
                                                  List<Translations13Record>>(
                                                stream:
                                                    queryTranslations13Record(
                                                  parent:
                                                      stackUserRecord.reference,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<Translations13Record>
                                                      textTranslations13RecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      (containerLanguagesRecord!
                                                                      .name !=
                                                                  'English') &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.translateApp,
                                                                      '') ==
                                                                  'true')
                                                          ? textTranslations13RecordList
                                                              .where((e) =>
                                                                  e.reference
                                                                      .id ==
                                                                  containerLanguagesRecord!
                                                                      .code)
                                                              .toList()
                                                              .first
                                                              .value
                                                          : stackUserRecord
                                                              .language,
                                                      'n',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tv5k82o2' /* Language */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<Translations12Record>>(
                                              stream: queryTranslations12Record(
                                                parent:
                                                    stackUserRecord.reference,
                                              ),
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
                                                List<Translations12Record>
                                                    textTranslations12RecordList =
                                                    snapshot.data!;
                                                return Text(
                                                  stackUserRecord.language!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (stackUserRecord.refugeeStatus != null &&
                                      stackUserRecord.refugeeStatus != '')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'y6r5fyht' /* Refugee Status */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<Translations11Record>>(
                                                stream:
                                                    queryTranslations11Record(
                                                  parent:
                                                      stackUserRecord.reference,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<Translations11Record>
                                                      textTranslations11RecordList =
                                                      snapshot.data!;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      (containerLanguagesRecord!
                                                                      .name !=
                                                                  'English') &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.translateApp,
                                                                      '') ==
                                                                  'true')
                                                          ? textTranslations11RecordList
                                                              .where((e) =>
                                                                  e.reference
                                                                      .id ==
                                                                  containerLanguagesRecord!
                                                                      .code)
                                                              .toList()
                                                              .first
                                                              .value
                                                          : stackUserRecord
                                                              .refugeeStatus,
                                                      'n',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (stackUserRecord.durationInCanada !=
                                          null &&
                                      stackUserRecord.durationInCanada != '')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'nbmdevfb' /* Duration in Canada */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.durationInCanada,
                                                    ''),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (stackUserRecord.phoneNumber != null &&
                                          stackUserRecord.phoneNumber != '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3im14p1r' /* Phone */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    stackUserRecord
                                                        .phoneNumber!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: FaIcon(
                                            FontAwesomeIcons.phone,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 32.0,
                                          ),
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path:
                                                  stackUserRecord.phoneNumber!,
                                            ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'bvcov6j8' /* Email */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  stackUserRecord.email!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium,
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidEnvelope,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(
                                              stackUserRecord.email!);
                                        },
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
