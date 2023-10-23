import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mapsheet_model.dart';
export 'mapsheet_model.dart';

class MapsheetWidget extends StatefulWidget {
  const MapsheetWidget({
    Key? key,
    this.doc,
    required this.isLocation,
    required this.categorySelected,
  }) : super(key: key);

  final LocationsRecord? doc;
  final bool? isLocation;
  final String? categorySelected;

  @override
  _MapsheetWidgetState createState() => _MapsheetWidgetState();
}

class _MapsheetWidgetState extends State<MapsheetWidget> {
  late MapsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsheetModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
      child: StreamBuilder<UserRecord>(
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
          final containerUserRecord = snapshot.data!;
          return ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<LanguagesRecord>>(
                  stream: queryLanguagesRecord(
                    queryBuilder: (languagesRecord) => languagesRecord.where(
                        'Name',
                        isEqualTo:
                            valueOrDefault(currentUserDocument?.language, '')),
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
                    List<LanguagesRecord> columnLanguagesRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnLanguagesRecord =
                        columnLanguagesRecordList.isNotEmpty
                            ? columnLanguagesRecordList.first
                            : null;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              if (!_model.showDates!)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(40.0),
                                            topRight: Radius.circular(40.0),
                                          ),
                                          child: Image.network(
                                            () {
                                              if (widget.doc!.imgPath != null &&
                                                  widget.doc!.imgPath != '') {
                                                return widget.doc!.imgPath!;
                                              } else if (widget.doc!.type ==
                                                  'Mosque') {
                                                return 'https://firebasestorage.googleapis.com/v0/b/refugee-pal-476d6.appspot.com/o/mosque.jfif?alt=media&token=d1a95bb6-def6-4373-af44-91d0127a1777';
                                              } else if (widget.doc!.type ==
                                                  'Employment services organization') {
                                                return 'https://firebasestorage.googleapis.com/v0/b/refugee-pal-476d6.appspot.com/o/18505857_web1_190603-PAN-M-workbc-opening-th.jpg?alt=media&token=69fa5f7a-ccf5-4529-b881-3d12eaad825d';
                                              } else if (widget.doc!.type ==
                                                  'Church') {
                                                return 'https://firebasestorage.googleapis.com/v0/b/refugee-pal-476d6.appspot.com/o/download%20(15).jfif?alt=media&token=cc76ee4e-410d-4b8c-8660-54629e6c3c11';
                                              } else if (widget.doc!.type ==
                                                  'Recreation centre') {
                                                return 'https://firebasestorage.googleapis.com/v0/b/refugee-pal-476d6.appspot.com/o/download%20(16).jfif?alt=media&token=4863772a-6085-4be7-acc5-be37092a75f4';
                                              } else if (widget.doc!.type ==
                                                  'Food bank') {
                                                return 'https://firebasestorage.googleapis.com/v0/b/refugee-pal-476d6.appspot.com/o/download%20(17).jfif?alt=media&token=908fb1fa-98c8-49dd-b094-0fc87c4e4091';
                                              } else {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/refugee-pal-wsh45z/assets/0oamk4mqlq5s/mapimage.png';
                                              }
                                            }(),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            height: 160.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x6EFFFFFF),
                                                shape: BoxShape.circle,
                                              ),
                                              child: ClipOval(
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 6.0,
                                                    sigmaY: 6.0,
                                                  ),
                                                  child: ToggleIcon(
                                                    onPressed: () async {
                                                      final pinnedElement =
                                                          widget.doc!.name;
                                                      final pinnedUpdate =
                                                          containerUserRecord
                                                                  .pinned!
                                                                  .toList()
                                                                  .contains(
                                                                      pinnedElement)
                                                              ? FieldValue
                                                                  .arrayRemove([
                                                                  pinnedElement
                                                                ])
                                                              : FieldValue
                                                                  .arrayUnion([
                                                                  pinnedElement
                                                                ]);
                                                      final userUpdateData = {
                                                        'pinned': pinnedUpdate,
                                                      };
                                                      await containerUserRecord
                                                          .reference
                                                          .update(
                                                              userUpdateData);
                                                    },
                                                    value: containerUserRecord
                                                        .pinned!
                                                        .toList()
                                                        .contains(
                                                            widget.doc!.name),
                                                    onIcon: FaIcon(
                                                      FontAwesomeIcons.mapPin,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 25.0,
                                                    ),
                                                    offIcon: FaIcon(
                                                      FontAwesomeIcons.mapPin,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 10.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.73,
                                                constraints: BoxConstraints(
                                                  maxHeight: 80.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 3.0),
                                                  child: StreamBuilder<
                                                      List<
                                                          Translations6Record>>(
                                                    stream:
                                                        queryTranslations6Record(
                                                      parent:
                                                          widget.doc!.reference,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<Translations6Record>
                                                          textTranslations6RecordList =
                                                          snapshot.data!;
                                                      return AutoSizeText(
                                                        valueOrDefault<String>(
                                                          (columnLanguagesRecord!
                                                                          .name !=
                                                                      'English') &&
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.translateApp,
                                                                          '') ==
                                                                      'true')
                                                              ? valueOrDefault<
                                                                  String>(
                                                                  textTranslations6RecordList
                                                                      .where((e) =>
                                                                          e.reference
                                                                              .id ==
                                                                          columnLanguagesRecord!
                                                                              .code)
                                                                      .toList()
                                                                      .first
                                                                      .value,
                                                                  'no value',
                                                                )
                                                              : widget
                                                                  .doc!.name,
                                                          'no value',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 3,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.71,
                                                constraints: BoxConstraints(
                                                  maxHeight: 40.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 3.0),
                                                  child: StreamBuilder<
                                                      List<
                                                          Translations5Record>>(
                                                    stream:
                                                        queryTranslations5Record(
                                                      parent:
                                                          widget.doc!.reference,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<Translations5Record>
                                                          textTranslations5RecordList =
                                                          snapshot.data!;
                                                      return Text(
                                                        valueOrDefault<String>(
                                                          (columnLanguagesRecord!
                                                                          .name !=
                                                                      'English') &&
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.translateApp,
                                                                          '') ==
                                                                      'true')
                                                              ? valueOrDefault<
                                                                  String>(
                                                                  textTranslations5RecordList
                                                                      .where((e) =>
                                                                          e.reference
                                                                              .id ==
                                                                          columnLanguagesRecord!
                                                                              .code)
                                                                      .toList()
                                                                      .first
                                                                      .value,
                                                                  'n',
                                                                )
                                                              : widget
                                                                  .doc!.type,
                                                          'no value',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.71,
                                                constraints: BoxConstraints(
                                                  maxHeight: 40.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    widget.doc!.address,
                                                    'error',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-0.1, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 40.0,
                                              borderWidth: 1.0,
                                              buttonSize: 75.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              icon: FaIcon(
                                                FontAwesomeIcons.directions,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .btnText,
                                                size: 45.0,
                                              ),
                                              onPressed: () async {
                                                await launchURL(
                                                    'https://www.google.com/maps/dir//${widget.doc!.directions}');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              4.0,
                                      decoration: BoxDecoration(),
                                      child: DefaultTabController(
                                        length: 2,
                                        initialIndex: min(
                                            valueOrDefault<int>(
                                              widget.isLocation == true ? 0 : 1,
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
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                tabs: [
                                                  Tab(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'nz38uqil' /* Information */,
                                                    ),
                                                  ),
                                                  Tab(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'yq2tohe4' /* Programs & Events */,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                85.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.globe,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 50.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              await launchURL(widget.doc!.website!);
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '53r344qf' /* Website */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              85.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.phone,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await launchUrl(Uri(
                                                                              scheme: 'tel',
                                                                              path: widget.doc!.phone!.toString(),
                                                                            ));
                                                                          },
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '65s4fzam' /* Phone */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (widget.doc!
                                                                              .mail !=
                                                                          null &&
                                                                      widget.doc!
                                                                              .mail !=
                                                                          '')
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                85.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.solidEnvelope,
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 50.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              await launchUrl(Uri(
                                                                                scheme: 'mailto',
                                                                                path: widget.doc!.mail!,
                                                                              ));
                                                                            },
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'nsvhrkvo' /* Email */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      20.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'odg0qex1' /* People */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      22.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
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
                                                                          20.0,
                                                                          5.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      UserRecord>>(
                                                                stream:
                                                                    queryUserRecord(
                                                                  queryBuilder: (userRecord) => userRecord
                                                                      .where(
                                                                          'isRefugee',
                                                                          isEqualTo:
                                                                              'false')
                                                                      .whereIn(
                                                                          'name',
                                                                          widget
                                                                              .doc!
                                                                              .people!
                                                                              .toList()),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<UserRecord>
                                                                      rowUserRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          rowUserRecordList
                                                                              .length,
                                                                          (rowIndex) {
                                                                        final rowUserRecord =
                                                                            rowUserRecordList[rowIndex];
                                                                        return Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.95,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                setState(() {
                                                                                  FFAppState().isViewingProfile = true;
                                                                                  FFAppState().profileToShow = rowUserRecord.reference;
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                width: 60.0,
                                                                                height: 60.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  rowUserRecord.photoUrl!,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    25.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxHeight:
                                                                double.infinity,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    Translations3Record>>(
                                                              stream:
                                                                  queryTranslations3Record(
                                                                parent: widget
                                                                    .doc!
                                                                    .reference,
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
                                                                List<Translations3Record>
                                                                    textTranslations3RecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    (columnLanguagesRecord!.name !=
                                                                                'English') &&
                                                                            (valueOrDefault(currentUserDocument?.translateApp, '') ==
                                                                                'true')
                                                                        ? valueOrDefault<
                                                                            String>(
                                                                            textTranslations3RecordList.where((e) => e.reference.id == columnLanguagesRecord!.code).toList().first.value,
                                                                            'n',
                                                                          )
                                                                        : widget
                                                                            .doc!
                                                                            .description,
                                                                    'no value',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    25.0,
                                                                    20.0,
                                                                    25.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxHeight:
                                                                double.infinity,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final bullet =
                                                                    widget.doc!
                                                                        .bullet!
                                                                        .toList();
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: List
                                                                      .generate(
                                                                          bullet
                                                                              .length,
                                                                          (bulletIndex) {
                                                                    final bulletItem =
                                                                        bullet[
                                                                            bulletIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          7.0),
                                                                      child:
                                                                          Text(
                                                                        '• ${bulletItem}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'cx0gueoo' /* This location is owned by */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<OrganizationsRecord>>(
                                                                          stream:
                                                                              queryOrganizationsRecord(
                                                                            queryBuilder: (organizationsRecord) =>
                                                                                organizationsRecord.where('name', isEqualTo: widget.doc!.organization),
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
                                                                                  child: SpinKitPulse(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 50.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<OrganizationsRecord>
                                                                                imageOrganizationsRecordList =
                                                                                snapshot.data!;
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final imageOrganizationsRecord = imageOrganizationsRecordList.isNotEmpty
                                                                                ? imageOrganizationsRecordList.first
                                                                                : null;
                                                                            return ClipRRect(
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              child: Image.network(
                                                                                imageOrganizationsRecord!.logoPath!,
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxHeight:
                                                                              52.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<List<Translations4Record>>(
                                                                            stream:
                                                                                queryTranslations4Record(
                                                                              parent: widget.doc!.reference,
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
                                                                              List<Translations4Record> textTranslations4RecordList = snapshot.data!;
                                                                              return Text(
                                                                                valueOrDefault<String>(
                                                                                  (columnLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true')
                                                                                      ? valueOrDefault<String>(
                                                                                          textTranslations4RecordList.where((e) => e.reference.id == columnLanguagesRecord!.code).toList().first.value,
                                                                                          'n',
                                                                                        )
                                                                                      : widget.doc!.organization,
                                                                                  'no value',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                              );
                                                                            },
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
                                                                      20.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            'Other ${widget.doc!.organization} locations',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    20.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                LocationsRecord>>(
                                                          stream:
                                                              queryLocationsRecord(
                                                            queryBuilder: (locationsRecord) => locationsRecord
                                                                .where(
                                                                    'organization',
                                                                    isEqualTo: widget
                                                                        .doc!
                                                                        .organization)
                                                                .where('name',
                                                                    isNotEqualTo:
                                                                        widget
                                                                            .doc!
                                                                            .name),
                                                            limit: 5,
                                                          ),
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
                                                            List<LocationsRecord>
                                                                rowLocationsRecordList =
                                                                snapshot.data!;
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    rowLocationsRecordList
                                                                        .length,
                                                                    (rowIndex) {
                                                                  final rowLocationsRecord =
                                                                      rowLocationsRecordList[
                                                                          rowIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          2.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            140.0,
                                                                        height:
                                                                            175.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: StreamBuilder<List<Translations6Record>>(
                                                                                    stream: queryTranslations6Record(
                                                                                      parent: widget.doc!.reference,
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
                                                                                      List<Translations6Record> textTranslations6RecordList = snapshot.data!;
                                                                                      return Text(
                                                                                        valueOrDefault<String>(
                                                                                          (columnLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations6RecordList.where((e) => e.reference.id == columnLanguagesRecord!.code).toList().first.value : widget.doc!.name,
                                                                                          'no value',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: StreamBuilder<List<CategoryRecord>>(
                                                                                  stream: queryCategoryRecord(
                                                                                    queryBuilder: (categoryRecord) => categoryRecord.whereIn('title', rowLocationsRecord.category!.toList()),
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
                                                                                    List<CategoryRecord> rowCategoryRecordList = snapshot.data!;
                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(rowCategoryRecordList.length, (rowIndex) {
                                                                                          final rowCategoryRecord = rowCategoryRecordList[rowIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                            child: Text(
                                                                                              rowCategoryRecord.icon!,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'fa',
                                                                                                    fontSize: 25.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<ProgramsRecord>>(
                                                      stream:
                                                          queryProgramsRecord(
                                                        parent: widget
                                                            .doc!.reference,
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
                                                        List<ProgramsRecord>
                                                            columnProgramsRecordList =
                                                            snapshot.data!;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnProgramsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnProgramsRecord =
                                                                columnProgramsRecordList[
                                                                    columnIndex];
                                                            return Visibility(
                                                              visible: (widget
                                                                          .categorySelected ==
                                                                      'none') ||
                                                                  widget.doc!
                                                                      .category!
                                                                      .toList()
                                                                      .contains(
                                                                          widget
                                                                              .categorySelected),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        20.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      2.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              Wrap(
                                                                                spacing: 0.0,
                                                                                runSpacing: 0.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    constraints: BoxConstraints(
                                                                                      maxHeight: 55.0,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Text(
                                                                                      columnProgramsRecord.name!,
                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      columnProgramsRecord.type!,
                                                                                      style: FlutterFlowTheme.of(context).bodySmall,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                child: ToggleIcon(
                                                                                  onPressed: () async {
                                                                                    final pinnedElement = columnProgramsRecord.name;
                                                                                    final pinnedUpdate = containerUserRecord.pinned!.toList().contains(pinnedElement) ? FieldValue.arrayRemove([pinnedElement]) : FieldValue.arrayUnion([pinnedElement]);
                                                                                    final userUpdateData = {
                                                                                      'pinned': pinnedUpdate,
                                                                                    };
                                                                                    await containerUserRecord.reference.update(userUpdateData);
                                                                                  },
                                                                                  value: containerUserRecord.pinned!.toList().contains(columnProgramsRecord.name),
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
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              columnProgramsRecord.description!,
                                                                              style: FlutterFlowTheme.of(context).bodySmall,
                                                                            ),
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<CategoryRecord>>(
                                                                            stream:
                                                                                queryCategoryRecord(
                                                                              queryBuilder: (categoryRecord) => categoryRecord.whereIn('title', columnProgramsRecord.category!.toList()),
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
                                                                              List<CategoryRecord> rowCategoryRecordList = snapshot.data!;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(rowCategoryRecordList.length, (rowIndex) {
                                                                                  final rowCategoryRecord = rowCategoryRecordList[rowIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 5.0, 0.0),
                                                                                    child: Text(
                                                                                      rowCategoryRecord.icon!,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'fa',
                                                                                            fontSize: 25.0,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.solidCalendar,
                                                                                  color: Colors.black,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: RichText(
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: dateTimeFormat(
                                                                                            'M/d h:mm a',
                                                                                            columnProgramsRecord.dates!.toList().first,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: columnProgramsRecord.dates!.toList().length > 1 ? ' +${(columnProgramsRecord.dates!.toList().length - 1).toString()} dates' : '',
                                                                                          style: TextStyle(),
                                                                                          mouseCursor: SystemMouseCursors.click,
                                                                                          recognizer: TapGestureRecognizer()
                                                                                            ..onTap = () async {
                                                                                              setState(() {
                                                                                                _model.showDates = true;
                                                                                                _model.dateToShow = columnProgramsRecord.dates!.toList();
                                                                                              });

                                                                                              final userUpdateData = {
                                                                                                'recents': FieldValue.arrayUnion([
                                                                                                  columnProgramsRecord.name
                                                                                                ]),
                                                                                              };
                                                                                              await currentUserReference!.update(userUpdateData);
                                                                                            },
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'pobdbwn9' /* People */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleLarge,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                StreamBuilder<List<UserRecord>>(
                                                                              stream: queryUserRecord(
                                                                                queryBuilder: (userRecord) => userRecord.whereIn('name', columnProgramsRecord.people!.toList()),
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
                                                                                return SingleChildScrollView(
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(rowUserRecordList.length, (rowIndex) {
                                                                                      final rowUserRecord = rowUserRecordList[rowIndex];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            setState(() {
                                                                                              FFAppState().isViewingProfile = true;
                                                                                              FFAppState().profileToShow = rowUserRecord.reference;
                                                                                            });

                                                                                            final userUpdateData = {
                                                                                              'recents': FieldValue.arrayUnion([
                                                                                                columnProgramsRecord.name
                                                                                              ]),
                                                                                            };
                                                                                            await currentUserReference!.update(userUpdateData);
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 60.0,
                                                                                            height: 60.0,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.network(
                                                                                              'https://picsum.photos/seed/795/600',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        await launchURL(columnProgramsRecord.website!);

                                                                                        final userUpdateData = {
                                                                                          'recents': FieldValue.arrayUnion([
                                                                                            columnProgramsRecord.name
                                                                                          ]),
                                                                                        };
                                                                                        await currentUserReference!.update(userUpdateData);
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'sg3pm6ny' /* Website */,
                                                                                      ),
                                                                                      icon: FaIcon(
                                                                                        FontAwesomeIcons.globe,
                                                                                        size: 25.0,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        width: 130.0,
                                                                                        height: 50.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: Colors.white,
                                                                                              fontSize: 22.0,
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
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
                              if (_model.showDates ?? true)
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.showDates = false;
                                            });
                                          },
                                          child: Icon(
                                            Icons.close_rounded,
                                            color: Colors.black,
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'v71k1dyo' /* Dates */,
                                          ),
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
                                            20.0, 40.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final dates =
                                                _model.dateToShow.toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  dates.length, (datesIndex) {
                                                final datesItem =
                                                    dates[datesIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      'M/d h:mm a',
                                                      datesItem,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
