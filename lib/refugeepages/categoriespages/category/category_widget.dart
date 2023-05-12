import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_model.dart';
export 'category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    Key? key,
    this.catrgorydetailed,
  }) : super(key: key);

  final DocumentReference? catrgorydetailed;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late CategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryModel());

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

    return StreamBuilder<CategoryRecord>(
      stream: CategoryRecord.getDocument(widget.catrgorydetailed!),
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
        final categoryCategoryRecord = snapshot.data!;
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
                        StreamBuilder<List<Translations7Record>>(
                          stream: queryTranslations7Record(
                            parent: widget.catrgorydetailed,
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
                            List<Translations7Record>
                                textTranslations7RecordList = snapshot.data!;
                            return Text(
                              valueOrDefault<String>(
                                (wrapLanguagesRecord!.name != 'English') &&
                                        (valueOrDefault(
                                                currentUserDocument
                                                    ?.translateApp,
                                                '') ==
                                            'true')
                                    ? valueOrDefault<String>(
                                        textTranslations7RecordList
                                            .where((e) =>
                                                e.reference.id ==
                                                wrapLanguagesRecord!.code)
                                            .toList()
                                            .first
                                            .value,
                                        'n',
                                      )
                                    : categoryCategoryRecord.title,
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
                    List<LanguagesRecord> stackLanguagesRecordList =
                        snapshot.data!;
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  categoryCategoryRecord.banner!,
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: StreamBuilder<List<Translations7Record>>(
                                  stream: queryTranslations7Record(
                                    parent: widget.catrgorydetailed,
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
                                    List<Translations7Record>
                                        textTranslations7RecordList =
                                        snapshot.data!;
                                    return Text(
                                      valueOrDefault<String>(
                                        (stackLanguagesRecord!.name !=
                                                    'English') &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.translateApp,
                                                        '') ==
                                                    'true')
                                            ? valueOrDefault<String>(
                                                textTranslations7RecordList
                                                    .where((e) =>
                                                        e.reference.id ==
                                                        stackLanguagesRecord!
                                                            .code)
                                                    .toList()
                                                    .first
                                                    .value,
                                                'n',
                                              )
                                            : categoryCategoryRecord.title,
                                        'no value',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 15.0, 10.0, 10.0),
                                child: StreamBuilder<List<Translations8Record>>(
                                  stream: queryTranslations8Record(
                                    parent: widget.catrgorydetailed,
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
                                    List<Translations8Record>
                                        textTranslations8RecordList =
                                        snapshot.data!;
                                    return Text(
                                      valueOrDefault<String>(
                                        (stackLanguagesRecord!.name !=
                                                    'English') &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.translateApp,
                                                        '') ==
                                                    'true')
                                            ? valueOrDefault<String>(
                                                textTranslations8RecordList
                                                    .where((e) =>
                                                        e.reference.id ==
                                                        stackLanguagesRecord!
                                                            .code)
                                                    .toList()
                                                    .first
                                                    .value,
                                                'n',
                                              )
                                            : categoryCategoryRecord
                                                .description,
                                        'n',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    );
                                  },
                                ),
                              ),
                              StreamBuilder<List<SubcategoryRecord>>(
                                stream: querySubcategoryRecord(
                                  queryBuilder: (subcategoryRecord) =>
                                      subcategoryRecord.where('category',
                                          isEqualTo:
                                              categoryCategoryRecord.title),
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
                                  List<SubcategoryRecord>
                                      columnSubcategoryRecordList =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnSubcategoryRecordList.length,
                                        (columnIndex) {
                                      final columnSubcategoryRecord =
                                          columnSubcategoryRecordList[
                                              columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 10.0),
                                        child: StreamBuilder<
                                            List<Translations1Record>>(
                                          stream: queryTranslations1Record(
                                            parent: columnSubcategoryRecord
                                                .reference,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<Translations1Record>
                                                containerTranslations1RecordList =
                                                snapshot.data!;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'subcategory',
                                                  queryParams: {
                                                    'subcategorydetail':
                                                        serializeParam(
                                                      columnSubcategoryRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                final userUpdateData = {
                                                  'recents':
                                                      FieldValue.arrayUnion([
                                                    columnSubcategoryRecord.name
                                                  ]),
                                                };
                                                await currentUserReference!
                                                    .update(userUpdateData);
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.75,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Text(
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
                                                                ? containerTranslations1RecordList
                                                                    .where((e) =>
                                                                        e.reference
                                                                            .id ==
                                                                        stackLanguagesRecord!
                                                                            .code)
                                                                    .toList()
                                                                    .first
                                                                    .value
                                                                : columnSubcategoryRecord
                                                                    .name,
                                                            'no value',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            UserRecord>(
                                                          stream: UserRecord
                                                              .getDocument(
                                                                  currentUserReference!),
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
                                                            final toggleIconUserRecord =
                                                                snapshot.data!;
                                                            return ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                final pinnedElement =
                                                                    columnSubcategoryRecord
                                                                        .name;
                                                                final pinnedUpdate = toggleIconUserRecord
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
                                                                final userUpdateData =
                                                                    {
                                                                  'pinned':
                                                                      pinnedUpdate,
                                                                };
                                                                await toggleIconUserRecord
                                                                    .reference
                                                                    .update(
                                                                        userUpdateData);
                                                              },
                                                              value: toggleIconUserRecord
                                                                  .pinned!
                                                                  .toList()
                                                                  .contains(
                                                                      columnSubcategoryRecord
                                                                          .name),
                                                              onIcon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .mapPin,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 25.0,
                                                              ),
                                                              offIcon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .mapPin,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
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
