import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_interface_model.dart';
export 'chat_interface_model.dart';

class ChatInterfaceWidget extends StatefulWidget {
  const ChatInterfaceWidget({
    Key? key,
    this.chat,
    this.messages,
  }) : super(key: key);

  final ChatsRecord? chat;
  final MessagesRecord? messages;

  @override
  _ChatInterfaceWidgetState createState() => _ChatInterfaceWidgetState();
}

class _ChatInterfaceWidgetState extends State<ChatInterfaceWidget> {
  late ChatInterfaceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatInterfaceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<UserRecord>>(
                    stream: queryUserRecord(
                      queryBuilder: (userRecord) => userRecord.whereIn(
                          'name', widget.chat!.users!.toList()),
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
                      List<UserRecord> circleImageUserRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final circleImageUserRecord =
                          circleImageUserRecordList.isNotEmpty
                              ? circleImageUserRecordList.first
                              : null;
                      return Container(
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
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.76,
                          constraints: BoxConstraints(
                            maxHeight: double.infinity,
                          ),
                          decoration: BoxDecoration(),
                          child: AuthUserStreamWidget(
                            builder: (context) => AutoSizeText(
                              valueOrDefault<String>(
                                (widget.chat!.type == 'GC') ||
                                        (widget.chat!.type == 'QA')
                                    ? widget.chat!.name
                                    : widget.chat!.users!
                                        .toList()
                                        .where((e) =>
                                            e !=
                                            valueOrDefault(
                                                currentUserDocument?.name, ''))
                                        .toList()
                                        .first,
                                'Loading...',
                              ),
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                () {
                                  if (widget.chat!.type == 'GC') {
                                    return '${widget.chat!.users!.toList().where((e) => e != valueOrDefault(currentUserDocument?.name, '')).toList().first} & ${(widget.chat!.users!.toList().length - 2).toString()} others';
                                  } else if (widget.chat!.type == 'QA') {
                                    return widget.chat!.categories!
                                        .toList()
                                        .first;
                                  } else {
                                    return ('Direct Message');
                                  }
                                }(),
                                'aa',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.chat!.type == 'QA')
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(),
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ni9f2lh0' /* View Answers */,
                            ),
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                      ],
                    ),
                    collapsed: Container(),
                    expanded: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxHeight: 220.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: StreamBuilder<List<MessagesRecord>>(
                          stream: queryMessagesRecord(
                            parent: widget.chat!.reference,
                            queryBuilder: (messagesRecord) => messagesRecord
                                .where('isAnswer', isEqualTo: true)
                                .orderBy('time'),
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
                            List<MessagesRecord> listViewMessagesRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewMessagesRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewMessagesRecord =
                                    listViewMessagesRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                            'M/d h:mm a',
                                            listViewMessagesRecord.time!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<List<UserRecord>>(
                                                  stream: queryUserRecord(
                                                    queryBuilder: (userRecord) =>
                                                        userRecord.where('name',
                                                            isEqualTo:
                                                                listViewMessagesRecord
                                                                    .user),
                                                    singleRecord: true,
                                                  ),
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
                                                    List<UserRecord>
                                                        circleImageUserRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final circleImageUserRecord =
                                                        circleImageUserRecordList
                                                                .isNotEmpty
                                                            ? circleImageUserRecordList
                                                                .first
                                                            : null;
                                                    return Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          circleImageUserRecord!
                                                              .photoUrl,
                                                          'https://picsum.photos/seed/486/600',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewMessagesRecord
                                                        .user!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7.0, 0.0, 7.0, 0.0),
                                        child: SelectionArea(
                                            child: Text(
                                          listViewMessagesRecord.text!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        )),
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
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
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
            child: StreamBuilder<List<MessagesRecord>>(
              stream: queryMessagesRecord(
                parent: widget.chat!.reference,
                queryBuilder: (messagesRecord) =>
                    messagesRecord.orderBy('time'),
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
                List<MessagesRecord> listViewMessagesRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewMessagesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewMessagesRecord =
                        listViewMessagesRecordList[listViewIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (listViewMessagesRecord.showTime ?? true)
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  'M/d h:mm a',
                                  listViewMessagesRecord.time,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'Loading...',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          if (listViewMessagesRecord.showName ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<UserRecord>>(
                                        stream: queryUserRecord(
                                          queryBuilder: (userRecord) =>
                                              userRecord.where('name',
                                                  isEqualTo:
                                                      listViewMessagesRecord
                                                          .user),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UserRecord>
                                              circleImageUserRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final circleImageUserRecord =
                                              circleImageUserRecordList
                                                      .isNotEmpty
                                                  ? circleImageUserRecordList
                                                      .first
                                                  : null;
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            listViewMessagesRecord.user,
                                            'Loading...',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  if (listViewMessagesRecord.user !=
                                      valueOrDefault(
                                          currentUserDocument?.name, ''))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85,
                                            maxHeight: 90.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 5.0, 7.0, 5.0),
                                            child: SelectionArea(
                                                child: Text(
                                              valueOrDefault<String>(
                                                listViewMessagesRecord.text,
                                                'Loading...',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (listViewMessagesRecord.user ==
                                      valueOrDefault(
                                          currentUserDocument?.name, ''))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85,
                                            maxHeight: 90.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 10.0, 5.0),
                                            child: SelectionArea(
                                                child: Text(
                                              valueOrDefault<String>(
                                                listViewMessagesRecord.text,
                                                'Loading...',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (listViewMessagesRecord.user ==
                                      valueOrDefault(
                                          currentUserDocument?.name, ''))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          onTap: () async {
                                            await listViewMessagesRecord
                                                .reference
                                                .delete();
                                          },
                                          child: FaIcon(
                                            FontAwesomeIcons.solidTrashAlt,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  Stack(
                                    children: [
                                      if (!valueOrDefault<bool>(
                                          currentUserDocument?.isRefugee,
                                          false))
                                        AuthUserStreamWidget(
                                          builder: (context) => ToggleIcon(
                                            onPressed: () async {
                                              final messagesUpdateData = {
                                                'isAnswer':
                                                    !listViewMessagesRecord
                                                        .isAnswer!,
                                              };
                                              await listViewMessagesRecord
                                                  .reference
                                                  .update(messagesUpdateData);
                                            },
                                            value: listViewMessagesRecord
                                                .isAnswer!,
                                            onIcon: FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 22.0,
                                            ),
                                            offIcon: FaIcon(
                                              FontAwesomeIcons.star,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 22.0,
                                            ),
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                              currentUserDocument?.isRefugee,
                                              false) &&
                                          listViewMessagesRecord.isAnswer!)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 7.0, 5.0, 5.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
