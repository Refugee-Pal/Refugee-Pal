import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryModel());

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

    return StreamBuilder<CategoryRecord>(
      stream: CategoryRecord.getDocument(widget.catrgorydetailed!),
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
        final categoryCategoryRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return true;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return true;
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return true;
              } else {
                return false;
              }
            }()
                ? AppBar(
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
                      builder: (context) =>
                          StreamBuilder<List<LanguagesRecord>>(
                        stream: queryLanguagesRecord(
                          queryBuilder: (languagesRecord) =>
                              languagesRecord.where(
                            'Name',
                            isEqualTo: valueOrDefault(
                                currentUserDocument?.language, ''),
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
                              StreamBuilder<List<Translations8Record>>(
                                stream: queryTranslations8Record(
                                  parent: widget.catrgorydetailed,
                                  queryBuilder: (translations8Record) =>
                                      translations8Record.where(
                                    'language',
                                    isEqualTo: wrapLanguagesRecord?.code,
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
                                  final textTranslations8Record =
                                      textTranslations8RecordList.isNotEmpty
                                          ? textTranslations8RecordList.first
                                          : null;
                                  return Text(
                                    valueOrDefault<String>(
                                      (wrapLanguagesRecord?.name !=
                                                  'English') &&
                                              (valueOrDefault(
                                                      currentUserDocument
                                                          ?.translateApp,
                                                      '') ==
                                                  'true')
                                          ? textTranslations8Record?.value
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
                  )
                : null,
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
                    final stackLanguagesRecord =
                        stackLanguagesRecordList.isNotEmpty
                            ? stackLanguagesRecordList.first
                            : null;
                    return Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Container(
                                width: 100.0,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 40.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 100.0,
                                        icon: Icon(
                                          Icons.arrow_back_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                        onPressed: () async {
                                          context.pop();
                                        },
                                      ),
                                      Wrap(
                                        spacing: 20.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.vertical,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 40.0,
                                            borderWidth: 1.0,
                                            buttonSize: 100.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidCompass,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 40.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed('home');
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 40.0,
                                            borderWidth: 1.0,
                                            buttonSize: 100.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.book,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 40.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                  'categoriesgallery');
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 40.0,
                                            borderWidth: 1.0,
                                            buttonSize: 100.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.mapMarkedAlt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 40.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed('map');
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 40.0,
                                            borderWidth: 1.0,
                                            buttonSize: 100.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidUser,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 40.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                'connect',
                                                queryParameters: {
                                                  'professionToLoad':
                                                      serializeParam(
                                                    'none',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 100.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.cog,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 35.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('settings');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        categoryCategoryRecord.banner,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        categoryCategoryRecord.banner,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: StreamBuilder<
                                        List<Translations8Record>>(
                                      stream: queryTranslations8Record(
                                        parent: widget.catrgorydetailed,
                                        queryBuilder: (translations8Record) =>
                                            translations8Record.where(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<Translations8Record>
                                            textTranslations8RecordList =
                                            snapshot.data!;
                                        final textTranslations8Record =
                                            textTranslations8RecordList
                                                    .isNotEmpty
                                                ? textTranslations8RecordList
                                                    .first
                                                : null;
                                        return Text(
                                          valueOrDefault<String>(
                                            (stackLanguagesRecord?.name !=
                                                        'English') &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.translateApp,
                                                            '') ==
                                                        'true')
                                                ? textTranslations8Record?.value
                                                : categoryCategoryRecord.title,
                                            'n',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: StreamBuilder<
                                        List<Translations7Record>>(
                                      stream: queryTranslations7Record(
                                        parent: widget.catrgorydetailed,
                                        queryBuilder: (translations7Record) =>
                                            translations7Record.where(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<Translations7Record>
                                            textTranslations7RecordList =
                                            snapshot.data!;
                                        final textTranslations7Record =
                                            textTranslations7RecordList
                                                    .isNotEmpty
                                                ? textTranslations7RecordList
                                                    .first
                                                : null;
                                        return Text(
                                          valueOrDefault<String>(
                                            (stackLanguagesRecord?.name !=
                                                        'English') &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.translateApp,
                                                            '') ==
                                                        'true')
                                                ? textTranslations7Record?.value
                                                : categoryCategoryRecord
                                                    .description,
                                            'n',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    StreamBuilder<List<SubcategoryRecord>>(
                                      stream: querySubcategoryRecord(
                                        queryBuilder: (subcategoryRecord) =>
                                            subcategoryRecord.where(
                                          'category',
                                          isEqualTo:
                                              categoryCategoryRecord.title,
                                        ),
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
                                        List<SubcategoryRecord>
                                            columnSubcategoryRecordList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnSubcategoryRecordList
                                                  .length, (columnIndex) {
                                            final columnSubcategoryRecord =
                                                columnSubcategoryRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 10.0, 20.0, 10.0),
                                              child: StreamBuilder<
                                                  List<Translations1Record>>(
                                                stream:
                                                    queryTranslations1Record(
                                                  parent:
                                                      columnSubcategoryRecord
                                                          .reference,
                                                  queryBuilder:
                                                      (translations1Record) =>
                                                          translations1Record
                                                              .where(
                                                    'language',
                                                    isEqualTo:
                                                        stackLanguagesRecord
                                                            ?.code,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<Translations1Record>
                                                      containerTranslations1RecordList =
                                                      snapshot.data!;
                                                  final containerTranslations1Record =
                                                      containerTranslations1RecordList
                                                              .isNotEmpty
                                                          ? containerTranslations1RecordList
                                                              .first
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
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'subcategory',
                                                        queryParameters: {
                                                          'subcategorydetail':
                                                              serializeParam(
                                                            columnSubcategoryRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'recents': FieldValue
                                                                .arrayUnion([
                                                              columnSubcategoryRecord
                                                                  .name
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
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
                                                                .circular(25.0),
                                                      ),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
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
                                                                  (stackLanguagesRecord?.name !=
                                                                              'English') &&
                                                                          (valueOrDefault(currentUserDocument?.translateApp, '') ==
                                                                              'true')
                                                                      ? containerTranslations1Record
                                                                          ?.value
                                                                      : columnSubcategoryRecord
                                                                          .name,
                                                                  'no value',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.00,
                                                                    -1.00),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  StreamBuilder<
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
                                                                  final toggleIconUserRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final pinnedElement =
                                                                          columnSubcategoryRecord
                                                                              .name;
                                                                      final pinnedUpdate = toggleIconUserRecord
                                                                              .pinned
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
                                                                      await toggleIconUserRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'pinned':
                                                                                pinnedUpdate,
                                                                          },
                                                                        ),
                                                                      });
                                                                    },
                                                                    value: toggleIconUserRecord
                                                                        .pinned
                                                                        .contains(
                                                                            columnSubcategoryRecord.name),
                                                                    onIcon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .mapPin,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                    offIcon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .mapPin,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
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
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                  ))
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 30.0),
                                        child: StreamBuilder<
                                            List<SubcategoryRecord>>(
                                          stream: querySubcategoryRecord(
                                            queryBuilder: (subcategoryRecord) =>
                                                subcategoryRecord.where(
                                              'category',
                                              isEqualTo:
                                                  categoryCategoryRecord.title,
                                            ),
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
                                            List<SubcategoryRecord>
                                                rowSubcategoryRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    rowSubcategoryRecordList
                                                        .length, (rowIndex) {
                                                  final rowSubcategoryRecord =
                                                      rowSubcategoryRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                10.0,
                                                                20.0,
                                                                10.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            Translations1Record>>(
                                                      stream:
                                                          queryTranslations1Record(
                                                        parent:
                                                            rowSubcategoryRecord
                                                                .reference,
                                                        queryBuilder:
                                                            (translations1Record) =>
                                                                translations1Record
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
                                                        List<Translations1Record>
                                                            containerTranslations1RecordList =
                                                            snapshot.data!;
                                                        final containerTranslations1Record =
                                                            containerTranslations1RecordList
                                                                    .isNotEmpty
                                                                ? containerTranslations1RecordList
                                                                    .first
                                                                : null;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'subcategory',
                                                              queryParameters: {
                                                                'subcategorydetail':
                                                                    serializeParam(
                                                                  rowSubcategoryRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'recents':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    rowSubcategoryRecord
                                                                        .name
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.2,
                                                            height: 400.0,
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
                                                                          25.0),
                                                            ),
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          20.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true')
                                                                              ? containerTranslations1Record?.value
                                                                              : rowSubcategoryRecord.name,
                                                                          'no value',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          20.0,
                                                                          30.0,
                                                                          30.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              Translations2Record>>(
                                                                        stream:
                                                                            queryTranslations2Record(
                                                                          parent:
                                                                              rowSubcategoryRecord.reference,
                                                                          queryBuilder: (translations2Record) =>
                                                                              translations2Record.where(
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
                                                                              textTranslations2RecordList =
                                                                              snapshot.data!;
                                                                          final textTranslations2Record = textTranslations2RecordList.isNotEmpty
                                                                              ? textTranslations2RecordList.first
                                                                              : null;
                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations2Record?.value : rowSubcategoryRecord.information,
                                                                              'n',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 75,
                                                                              replacement: '…',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          -1.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        UserRecord>(
                                                                      stream: UserRecord
                                                                          .getDocument(
                                                                              currentUserReference!),
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
                                                                        final toggleIconUserRecord =
                                                                            snapshot.data!;
                                                                        return ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            final pinnedElement =
                                                                                rowSubcategoryRecord.name;
                                                                            final pinnedUpdate = toggleIconUserRecord.pinned.contains(pinnedElement)
                                                                                ? FieldValue.arrayRemove([
                                                                                    pinnedElement
                                                                                  ])
                                                                                : FieldValue.arrayUnion([
                                                                                    pinnedElement
                                                                                  ]);
                                                                            await toggleIconUserRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'pinned': pinnedUpdate,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value: toggleIconUserRecord
                                                                              .pinned
                                                                              .contains(rowSubcategoryRecord.name),
                                                                          onIcon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.mapPin,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                          offIcon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.mapPin,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                25.0,
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
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (responsiveVisibility(
                          context: context,
                          desktop: false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.00, 1.00),
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
