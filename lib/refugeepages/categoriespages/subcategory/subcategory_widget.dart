import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subcategory_model.dart';
export 'subcategory_model.dart';

class SubcategoryWidget extends StatefulWidget {
  const SubcategoryWidget({
    Key? key,
    this.subcategorydetail,
  }) : super(key: key);

  final DocumentReference? subcategorydetail;

  @override
  _SubcategoryWidgetState createState() => _SubcategoryWidgetState();
}

class _SubcategoryWidgetState extends State<SubcategoryWidget> {
  late SubcategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubcategoryModel());

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

    return StreamBuilder<SubcategoryRecord>(
      stream: SubcategoryRecord.getDocument(widget.subcategorydetail!),
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
        final subcategorySubcategoryRecord = snapshot.data!;
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
              title: AuthUserStreamWidget(
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
                    List<LanguagesRecord> wrapLanguagesRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final wrapLanguagesRecord =
                        wrapLanguagesRecordList.isNotEmpty
                            ? wrapLanguagesRecordList.first
                            : null;
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
                        StreamBuilder<List<Translations2Record>>(
                          stream: queryTranslations2Record(
                            parent: widget.subcategorydetail,
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
                            List<Translations2Record>
                                textTranslations2RecordList = snapshot.data!;
                            return Text(
                              valueOrDefault<String>(
                                (wrapLanguagesRecord!.name != 'English') &&
                                        (valueOrDefault(
                                                currentUserDocument
                                                    ?.translateApp,
                                                '') ==
                                            'true')
                                    ? valueOrDefault<String>(
                                        textTranslations2RecordList
                                            .where((e) =>
                                                e.reference.id ==
                                                wrapLanguagesRecord!.code)
                                            .toList()
                                            .first
                                            .value,
                                        'no value',
                                      )
                                    : subcategorySubcategoryRecord.information,
                                'no value',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            );
                          },
                        ),
                      ],
                    );
                  },
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
              child: StreamBuilder<List<Translations2Record>>(
                stream: queryTranslations2Record(
                  parent: widget.subcategorydetail,
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
                  List<Translations2Record> blurTranslations2RecordList =
                      snapshot.data!;
                  return ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 0.0,
                        sigmaY: 0.0,
                      ),
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
                          final blurUserRecord = snapshot.data!;
                          return ClipRect(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 0.0,
                                sigmaY: 0.0,
                              ),
                              child: StreamBuilder<List<LanguagesRecord>>(
                                stream: queryLanguagesRecord(
                                  queryBuilder: (languagesRecord) =>
                                      languagesRecord.where('Name',
                                          isEqualTo: blurUserRecord.language),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<LanguagesRecord>
                                      stackLanguagesRecordList = snapshot.data!;
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
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (subcategorySubcategoryRecord
                                                          .information !=
                                                      '')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    20.0,
                                                                    20.0,
                                                                    20.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Text(
                                                            valueOrDefault<
                                                                String>(
                                                              (stackLanguagesRecord!
                                                                              .name !=
                                                                          'English') &&
                                                                      (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.translateApp,
                                                                              '') ==
                                                                          'true')
                                                                  ? blurTranslations2RecordList
                                                                      .where((e) =>
                                                                          e.reference
                                                                              .id ==
                                                                          stackLanguagesRecord!
                                                                              .code)
                                                                      .toList()
                                                                      .first
                                                                      .value
                                                                  : subcategorySubcategoryRecord
                                                                      .information,
                                                              'no value',
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      17.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            StreamBuilder<
                                                List<ResourceproviderRecord>>(
                                              stream:
                                                  queryResourceproviderRecord(
                                                queryBuilder:
                                                    (resourceproviderRecord) =>
                                                        resourceproviderRecord.where(
                                                            'subcategory',
                                                            isEqualTo:
                                                                subcategorySubcategoryRecord
                                                                    .reference
                                                                    .id),
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
                                                List<ResourceproviderRecord>
                                                    columnResourceproviderRecordList =
                                                    snapshot.data!;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnResourceproviderRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnResourceproviderRecord =
                                                        columnResourceproviderRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
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
                                                          await launchURL(
                                                              columnResourceproviderRecord
                                                                  .link!);

                                                          final userUpdateData =
                                                              {
                                                            'recents': FieldValue
                                                                .arrayUnion([
                                                              columnResourceproviderRecord
                                                                  .name
                                                            ]),
                                                          };
                                                          await blurUserRecord
                                                              .reference
                                                              .update(
                                                                  userUpdateData);
                                                        },
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
                                                                        25.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          20.0,
                                                                          5.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                StreamBuilder<List<Translations9Record>>(
                                                                          stream:
                                                                              queryTranslations9Record(
                                                                            parent:
                                                                                columnResourceproviderRecord.reference,
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
                                                                            List<Translations9Record>
                                                                                textTranslations9RecordList =
                                                                                snapshot.data!;
                                                                            return Text(
                                                                              valueOrDefault<String>(
                                                                                (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations9RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value : columnResourceproviderRecord.name,
                                                                                'no value',
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    fontSize: 18.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ToggleIcon(
                                                                      onPressed:
                                                                          () async {
                                                                        final pinnedElement =
                                                                            columnResourceproviderRecord.name;
                                                                        final pinnedUpdate = blurUserRecord.pinned!.toList().contains(pinnedElement)
                                                                            ? FieldValue.arrayRemove([
                                                                                pinnedElement
                                                                              ])
                                                                            : FieldValue.arrayUnion([
                                                                                pinnedElement
                                                                              ]);
                                                                        final userUpdateData =
                                                                            {
                                                                          'pinned':
                                                                              pinnedUpdate,
                                                                        };
                                                                        await blurUserRecord
                                                                            .reference
                                                                            .update(userUpdateData);
                                                                      },
                                                                      value: blurUserRecord
                                                                          .pinned!
                                                                          .toList()
                                                                          .contains(
                                                                              columnResourceproviderRecord.name),
                                                                      onIcon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .mapPin,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                      offIcon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .mapPin,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder: (context) =>
                                                                      StreamBuilder<
                                                                          List<
                                                                              Translations10Record>>(
                                                                    stream:
                                                                        queryTranslations10Record(
                                                                      parent: columnResourceproviderRecord
                                                                          .reference,
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
                                                                                SpinKitPulse(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<Translations10Record>
                                                                          textTranslations10RecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (stackLanguagesRecord!.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true')
                                                                              ? textTranslations10RecordList.where((e) => e.reference.id == stackLanguagesRecord!.code).toList().first.value
                                                                              : columnResourceproviderRecord.information,
                                                                          'no value',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 15.0,
                                                                            ),
                                                                      );
                                                                    },
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
                                                                child: InkWell(
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
                                                                    await launchURL(
                                                                        columnResourceproviderRecord
                                                                            .link!);
                                                                  },
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'jt06tog3' /* Learn more */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                        ),
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
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
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
