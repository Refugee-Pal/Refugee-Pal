import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
    String? startingChip,
    String? startingCategory,
    bool? isNew,
  })  : this.startingChip = startingChip ?? 'All',
        this.startingCategory = startingCategory ?? 'all',
        this.isNew = isNew ?? false,
        super(key: key);

  final String startingChip;
  final String startingCategory;
  final bool isNew;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.isRefugee, '') == 'false') {
        context.pushNamed('helperChat');
      }
      if ((widget.startingChip == 'Locations') ||
          (widget.startingChip == 'Questions & Answers')) {
        setState(() {
          _model.choiceChipChoices = (String var1) {
            return ['All', '📍Pinned', 'Recents', var1];
          }(widget.startingChip)
              .toList()
              .cast<String>();
        });
      } else {
        setState(() {
          _model.choiceChipChoices =
              ['All', '📍Pinned', 'Recents'].toList().cast<String>();
        });
      }

      setAppLanguage(
          context, valueOrDefault(currentUserDocument?.language, ''));
    });

    _model.emailAddressController ??= TextEditingController();
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

    return StreamBuilder<List<CategoryRecord>>(
      stream: queryCategoryRecord(),
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
        List<CategoryRecord> homeCategoryRecordList = snapshot.data!;
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
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'u4lpja3d' /* Explore */,
                      ),
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
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
                  )
                : null,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<ChatsRecord>>(
                stream: queryChatsRecord(
                  queryBuilder: (chatsRecord) => chatsRecord.where(
                    'type',
                    isEqualTo: 'QA',
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
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<ChatsRecord> blurChatsRecordList = snapshot.data!;
                  return ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 0.0,
                        sigmaY: 0.0,
                      ),
                      child: StreamBuilder<List<LocationsRecord>>(
                        stream: queryLocationsRecord(
                          limit: 10,
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
                          List<LocationsRecord> blurLocationsRecordList =
                              snapshot.data!;
                          return ClipRect(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 0.0,
                                sigmaY: 0.0,
                              ),
                              child: StreamBuilder<UserRecord>(
                                stream: UserRecord.getDocument(
                                    currentUserReference!),
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
                                  final blurUserRecord = snapshot.data!;
                                  return ClipRect(
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                        sigmaX: 0.0,
                                        sigmaY: 0.0,
                                      ),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => StreamBuilder<
                                            List<LanguagesRecord>>(
                                          stream: queryLanguagesRecord(
                                            queryBuilder: (languagesRecord) =>
                                                languagesRecord.where(
                                              'Name',
                                              isEqualTo: valueOrDefault(
                                                  currentUserDocument?.language,
                                                  ''),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<LanguagesRecord>
                                                stackLanguagesRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final stackLanguagesRecord =
                                                stackLanguagesRecordList
                                                        .isNotEmpty
                                                    ? stackLanguagesRecordList
                                                        .first
                                                    : null;
                                            return Stack(
                                              children: [
                                                Stack(
                                                  children: [
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            60.0,
                                                                            10.0,
                                                                            40.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if ('all' != _model.categorySelected)
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      setState(() {
                                                                                        _model.categorySelected = 'all';
                                                                                      });
                                                                                    },
                                                                                    child: Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 2.0,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(50.0),
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        height: 100.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'v1b7t1k0' /* book */,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'fa',
                                                                                                    fontSize: 60.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (_model.categorySelected == 'all')
                                                                                  Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 2.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(55.0),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 105.0,
                                                                                      height: 105.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        borderRadius: BorderRadius.circular(55.0),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.book,
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            size: 60.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'fk5kwe4n' /* All */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            60.0,
                                                                            0.0,
                                                                            40.0),
                                                                        child: StreamBuilder<
                                                                            List<CategoryRecord>>(
                                                                          stream:
                                                                              queryCategoryRecord(),
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
                                                                                rowCategoryRecordList =
                                                                                snapshot.data!;
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(rowCategoryRecordList.length, (rowIndex) {
                                                                                final rowCategoryRecord = rowCategoryRecordList[rowIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Stack(
                                                                                        children: [
                                                                                          if (rowCategoryRecord.title != _model.categorySelected)
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                setState(() {
                                                                                                  _model.categorySelected = rowCategoryRecord.title;
                                                                                                });
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 2.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(50.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        rowCategoryRecord.icon,
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'fa',
                                                                                                              fontSize: 60.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (_model.categorySelected == rowCategoryRecord.title)
                                                                                            Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 2.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(55.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: 105.0,
                                                                                                height: 105.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  borderRadius: BorderRadius.circular(55.0),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      rowCategoryRecord.icon,
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'fa',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            fontSize: 55.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                        child: StreamBuilder<List<Translations8Record>>(
                                                                                          stream: queryTranslations8Record(
                                                                                            parent: rowCategoryRecord.reference,
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
                                                                                            final textTranslations8Record = textTranslations8RecordList.isNotEmpty ? textTranslations8RecordList.first : null;
                                                                                            return Text(
                                                                                              valueOrDefault<String>(
                                                                                                (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations8Record?.value : rowCategoryRecord.title,
                                                                                                'n',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
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
                                                                if (!((_model
                                                                            .choiceChipsValue ==
                                                                        'Recents') ||
                                                                    (_model.choiceChipsValue ==
                                                                        '📍Pinned')))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.emailAddressController,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                'mnpn1f78' /* Search... */,
                                                                              ),
                                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: Color(0xFF57636C),
                                                                                    fontSize: 15.0,
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
                                                                                  color: Color(0xFFDBE2E7),
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
                                                                            validator:
                                                                                _model.emailAddressControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                        if (false)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.98, -11.36),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await queryResourceproviderRecordOnce()
                                                                                    .then(
                                                                                      (records) => _model.simpleSearchResults1 = TextSearch(
                                                                                        records
                                                                                            .map(
                                                                                              (record) => TextSearchItem(record, [record.name!]),
                                                                                            )
                                                                                            .toList(),
                                                                                      ).search(_model.emailAddressController.text).map((r) => r.object).toList(),
                                                                                    )
                                                                                    .onError((_, __) => _model.simpleSearchResults1 = [])
                                                                                    .whenComplete(() => setState(() {}));
                                                                              },
                                                                              child: ClipRect(
                                                                                child: ImageFiltered(
                                                                                  imageFilter: ImageFilter.blur(
                                                                                    sigmaX: 0.0,
                                                                                    sigmaY: 0.0,
                                                                                  ),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await querySubcategoryRecordOnce()
                                                                                          .then(
                                                                                            (records) => _model.simpleSearchResults2 = TextSearch(
                                                                                              records
                                                                                                  .map(
                                                                                                    (record) => TextSearchItem(record, [
                                                                                                      record.name!,
                                                                                                      record.category!
                                                                                                    ]),
                                                                                                  )
                                                                                                  .toList(),
                                                                                            ).search(_model.emailAddressController.text).map((r) => r.object).toList(),
                                                                                          )
                                                                                          .onError((_, __) => _model.simpleSearchResults2 = [])
                                                                                          .whenComplete(() => setState(() {}));
                                                                                    },
                                                                                    child: ClipRect(
                                                                                      child: ImageFiltered(
                                                                                        imageFilter: ImageFilter.blur(
                                                                                          sigmaX: 0.0,
                                                                                          sigmaY: 0.0,
                                                                                        ),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            safeSetState(() {
                                                                                              _model.simpleSearchResults3 = TextSearch(
                                                                                                blurChatsRecordList
                                                                                                    .map(
                                                                                                      (record) => TextSearchItem(record, [record.name!]),
                                                                                                    )
                                                                                                    .toList(),
                                                                                              ).search(_model.emailAddressController.text).map((r) => r.object).toList();
                                                                                              ;
                                                                                            });
                                                                                            setState(() {
                                                                                              _model.resourceSearchResults = _model.simpleSearchResults2.map((e) => e.name).toList().cast<String>();
                                                                                            });
                                                                                          },
                                                                                          child: ClipRect(
                                                                                            child: ImageFiltered(
                                                                                              imageFilter: ImageFilter.blur(
                                                                                                sigmaX: 0.0,
                                                                                                sigmaY: 0.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (!_model
                                                                            .showAll!)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.65, 0.00),
                                                                            child:
                                                                                FlutterFlowIconButton(
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
                                                                                  _model.emailAddressController?.clear();
                                                                                });
                                                                                setState(() {
                                                                                  _model.showAll = true;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                              child: FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 30.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 60.0,
                                                                                icon: FaIcon(
                                                                                  FontAwesomeIcons.search,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 30.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  safeSetState(() {
                                                                                    _model.simpleSearchResults4 = TextSearch(
                                                                                      blurChatsRecordList
                                                                                          .map(
                                                                                            (record) => TextSearchItem(record, [record.name!]),
                                                                                          )
                                                                                          .toList(),
                                                                                    ).search(_model.emailAddressController.text).map((r) => r.object).toList();
                                                                                    ;
                                                                                  });
                                                                                  setState(() {
                                                                                    _model.resourceSearchResults = _model.simpleSearchResults2.map((e) => e.name).toList().cast<String>();
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.00, 0.00),
                                                                              child: FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 30.0,
                                                                                borderWidth: 1.0,
                                                                                buttonSize: 60.0,
                                                                                icon: FaIcon(
                                                                                  FontAwesomeIcons.search,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 30.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  await queryLocationsRecordOnce()
                                                                                      .then(
                                                                                        (records) => _model.simpleSearchResults5 = TextSearch(
                                                                                          records
                                                                                              .map(
                                                                                                (record) => TextSearchItem(record, [
                                                                                                  record.name!,
                                                                                                  record.organization!
                                                                                                ]),
                                                                                              )
                                                                                              .toList(),
                                                                                        ).search(_model.emailAddressController.text).map((r) => r.object).toList(),
                                                                                      )
                                                                                      .onError((_, __) => _model.simpleSearchResults5 = [])
                                                                                      .whenComplete(() => setState(() {}));

                                                                                  setState(() {
                                                                                    _model.showAll = false;
                                                                                    _model.searchResults = _model.simpleSearchResults5.map((e) => e.name).toList().cast<String>();
                                                                                    _model.resourceSearchResults = _model.simpleSearchResults2.map((e) => e.name).toList().cast<String>();
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
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
                                                                            48.0,
                                                                            0.0,
                                                                            13.0),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: _model
                                                                          .choiceChipChoices
                                                                          .map((label) =>
                                                                              ChipData(label))
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              setState(() => _model.choiceChipsValue = val?.first),
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        iconSize:
                                                                            25.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            8.0,
                                                                            5.0,
                                                                            10.0),
                                                                        elevation:
                                                                            2.0,
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent1,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        iconSize:
                                                                            25.0,
                                                                        labelPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            8.0,
                                                                            5.0,
                                                                            10.0),
                                                                        elevation:
                                                                            4.0,
                                                                      ),
                                                                      chipSpacing:
                                                                          10.0,
                                                                      rowSpacing:
                                                                          22.0,
                                                                      multiselect:
                                                                          false,
                                                                      initialized:
                                                                          _model.choiceChipsValue !=
                                                                              null,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .choiceChipsValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [
                                                                          widget
                                                                              .startingChip
                                                                        ],
                                                                      ),
                                                                      wrapped:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          100.0),
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
                                                                      final stackUserRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Stack(
                                                                        children: [
                                                                          if (_model.choiceChipsValue ==
                                                                              'All')
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
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '4z1r74v3' /* Questions and Answers */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).titleLarge,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final qanda = blurChatsRecordList.toList();
                                                                                          return SingleChildScrollView(
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: List.generate(qanda.length, (qandaIndex) {
                                                                                                final qandaItem = qanda[qandaIndex];
                                                                                                return Visibility(
                                                                                                  visible: ((_model.categorySelected == 'all') || qandaItem.categories.contains(_model.categorySelected)) && !(!_model.showAll! && !_model.searchResults.contains(qandaItem.name)),
                                                                                                  child: StreamBuilder<List<MessagesRecord>>(
                                                                                                    stream: queryMessagesRecord(
                                                                                                      parent: qandaItem.reference,
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
                                                                                                      List<MessagesRecord> cardMessagesRecordList = snapshot.data!;
                                                                                                      return InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          context.pushNamed(
                                                                                                            'connect',
                                                                                                            queryParameters: {
                                                                                                              'chatToLoad': serializeParam(
                                                                                                                qandaItem,
                                                                                                                ParamType.Document,
                                                                                                              ),
                                                                                                              'messagesToLoad': serializeParam(
                                                                                                                cardMessagesRecordList,
                                                                                                                ParamType.Document,
                                                                                                                true,
                                                                                                              ),
                                                                                                              'professionToLoad': serializeParam(
                                                                                                                'none',
                                                                                                                ParamType.String,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                            extra: <String, dynamic>{
                                                                                                              'chatToLoad': qandaItem,
                                                                                                              'messagesToLoad': cardMessagesRecordList,
                                                                                                            },
                                                                                                          );

                                                                                                          await stackUserRecord.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'recents': FieldValue.arrayUnion([qandaItem.name]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        },
                                                                                                        child: Card(
                                                                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          elevation: 2.0,
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                          child: StreamBuilder<List<Translations18Record>>(
                                                                                                            stream: queryTranslations18Record(
                                                                                                              parent: qandaItem.reference,
                                                                                                              queryBuilder: (translations18Record) => translations18Record.where(
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
                                                                                                              List<Translations18Record> containerTranslations18RecordList = snapshot.data!;
                                                                                                              final containerTranslations18Record = containerTranslations18RecordList.isNotEmpty ? containerTranslations18RecordList.first : null;
                                                                                                              return Container(
                                                                                                                width: 140.0,
                                                                                                                height: 200.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                          child: Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? containerTranslations18Record?.value : qandaItem.name,
                                                                                                                              'n',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Wrap(
                                                                                                                        spacing: 0.0,
                                                                                                                        runSpacing: 0.0,
                                                                                                                        alignment: WrapAlignment.start,
                                                                                                                        crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                        direction: Axis.vertical,
                                                                                                                        runAlignment: WrapAlignment.start,
                                                                                                                        verticalDirection: VerticalDirection.down,
                                                                                                                        clipBehavior: Clip.none,
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 10.0),
                                                                                                                              child: Text(
                                                                                                                                cardMessagesRecordList.where((e) => e.isAnswer).toList().length == 0 ? 'Unanswered' : '${cardMessagesRecordList.where((e) => e.isAnswer).toList().length.toString()} answers',
                                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: StreamBuilder<List<CategoryRecord>>(
                                                                                                                              stream: queryCategoryRecord(
                                                                                                                                queryBuilder: (categoryRecord) => categoryRecord.whereIn('title', qandaItem.categories),
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
                                                                                                                                return Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                  children: List.generate(rowCategoryRecordList.length, (rowIndex) {
                                                                                                                                    final rowCategoryRecord = rowCategoryRecordList[rowIndex];
                                                                                                                                    return Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        rowCategoryRecord.icon,
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
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
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
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 5.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '5ysniyfp' /* Subcategories */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).titleLarge,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      StreamBuilder<List<SubcategoryRecord>>(
                                                                                        stream: querySubcategoryRecord(
                                                                                          limit: 5,
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
                                                                                          List<SubcategoryRecord> rowSubcategoryRecordList = snapshot.data!;
                                                                                          return SingleChildScrollView(
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: List.generate(rowSubcategoryRecordList.length, (rowIndex) {
                                                                                                final rowSubcategoryRecord = rowSubcategoryRecordList[rowIndex];
                                                                                                return Visibility(
                                                                                                  visible: ((rowSubcategoryRecord.category == _model.categorySelected) || (_model.categorySelected == 'all')) && (_model.showAll! ? true : _model.resourceSearchResults.contains(rowSubcategoryRecord.name)),
                                                                                                  child: StreamBuilder<List<Translations1Record>>(
                                                                                                    stream: queryTranslations1Record(
                                                                                                      parent: rowSubcategoryRecord.reference,
                                                                                                      queryBuilder: (translations1Record) => translations1Record.where(
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
                                                                                                      List<Translations1Record> cardTranslations1RecordList = snapshot.data!;
                                                                                                      final cardTranslations1Record = cardTranslations1RecordList.isNotEmpty ? cardTranslations1RecordList.first : null;
                                                                                                      return InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          context.pushNamed(
                                                                                                            'subcategory',
                                                                                                            queryParameters: {
                                                                                                              'subcategorydetail': serializeParam(
                                                                                                                rowSubcategoryRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );

                                                                                                          await currentUserReference!.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'recents': FieldValue.arrayUnion([rowSubcategoryRecord.name]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        },
                                                                                                        child: Card(
                                                                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          elevation: 2.0,
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                          child: Container(
                                                                                                            width: 140.0,
                                                                                                            height: 200.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? cardTranslations1Record?.value : rowSubcategoryRecord.name,
                                                                                                                        'no value',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                    child: StreamBuilder<List<CategoryRecord>>(
                                                                                                                      stream: queryCategoryRecord(
                                                                                                                        queryBuilder: (categoryRecord) => categoryRecord.where(
                                                                                                                          'title',
                                                                                                                          isEqualTo: rowSubcategoryRecord.category,
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
                                                                                                                                  rowCategoryRecord.icon,
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
                                                                                                    },
                                                                                                  ),
                                                                                                );
                                                                                              }),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 5.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'g35gljal' /* Locations */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).titleLarge,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final locations = (_model.showAll! ? blurLocationsRecordList : _model.simpleSearchResults5).toList();
                                                                                          return SingleChildScrollView(
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: List.generate(locations.length, (locationsIndex) {
                                                                                                final locationsItem = locations[locationsIndex];
                                                                                                return Visibility(
                                                                                                  visible: locationsItem.category.contains(_model.categorySelected) || (_model.categorySelected == 'all'),
                                                                                                  child: FutureBuilder<List<Translations6Record>>(
                                                                                                    future: queryTranslations6RecordOnce(
                                                                                                      parent: locationsItem.reference,
                                                                                                      queryBuilder: (translations6Record) => translations6Record.where(
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
                                                                                                      List<Translations6Record> cardTranslations6RecordList = snapshot.data!;
                                                                                                      final cardTranslations6Record = cardTranslations6RecordList.isNotEmpty ? cardTranslations6RecordList.first : null;
                                                                                                      return InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          context.pushNamed(
                                                                                                            'map',
                                                                                                            queryParameters: {
                                                                                                              'locationtoLoad': serializeParam(
                                                                                                                locationsItem,
                                                                                                                ParamType.Document,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                            extra: <String, dynamic>{
                                                                                                              'locationtoLoad': locationsItem,
                                                                                                            },
                                                                                                          );

                                                                                                          await currentUserReference!.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'recents': FieldValue.arrayUnion([locationsItem.name]),
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                        },
                                                                                                        child: Card(
                                                                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          elevation: 2.0,
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                                          ),
                                                                                                          child: FutureBuilder<List<Translations5Record>>(
                                                                                                            future: queryTranslations5RecordOnce(
                                                                                                              parent: locationsItem.reference,
                                                                                                              queryBuilder: (translations5Record) => translations5Record.where(
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
                                                                                                              List<Translations5Record> containerTranslations5RecordList = snapshot.data!;
                                                                                                              final containerTranslations5Record = containerTranslations5RecordList.isNotEmpty ? containerTranslations5RecordList.first : null;
                                                                                                              return Container(
                                                                                                                width: 140.0,
                                                                                                                height: 200.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                                                        child: Container(
                                                                                                                          width: double.infinity,
                                                                                                                          height: 135.0,
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                            child: AutoSizeText(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? cardTranslations6Record?.value : locationsItem.name,
                                                                                                                                'no value',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Wrap(
                                                                                                                        spacing: 0.0,
                                                                                                                        runSpacing: 0.0,
                                                                                                                        alignment: WrapAlignment.start,
                                                                                                                        crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                        direction: Axis.vertical,
                                                                                                                        runAlignment: WrapAlignment.start,
                                                                                                                        verticalDirection: VerticalDirection.down,
                                                                                                                        clipBehavior: Clip.none,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 10.0),
                                                                                                                            child: Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? containerTranslations5Record?.value : locationsItem.type,
                                                                                                                                'no value',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: StreamBuilder<List<CategoryRecord>>(
                                                                                                                              stream: queryCategoryRecord(
                                                                                                                                queryBuilder: (categoryRecord) => categoryRecord.whereIn('title', locationsItem.category),
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
                                                                                                                                          rowCategoryRecord.icon,
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
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
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
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if (_model.choiceChipsValue !=
                                                                              'All')
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      () {
                                                                                        if (_model.choiceChipsValue == '📍Pinned') {
                                                                                          return 'Pinned';
                                                                                        } else if (_model.choiceChipsValue == 'Recents') {
                                                                                          return 'Recents';
                                                                                        } else if (_model.choiceChipsValue == 'Locations') {
                                                                                          return 'Locations';
                                                                                        } else {
                                                                                          return 'Questions & Answers';
                                                                                        }
                                                                                      }(),
                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final pinned = () {
                                                                                        if (_model.choiceChipsValue == '📍Pinned') {
                                                                                          return stackUserRecord.pinned;
                                                                                        } else if (_model.choiceChipsValue == 'Recents') {
                                                                                          return stackUserRecord.recents;
                                                                                        } else if (_model.choiceChipsValue == 'Locations') {
                                                                                          return (_model.showAll! ? blurLocationsRecordList.map((e) => e.name).toList() : _model.simpleSearchResults5.map((e) => e.name).toList());
                                                                                        } else {
                                                                                          return (_model.showAll! ? blurChatsRecordList.map((e) => e.name).toList() : _model.simpleSearchResults3.map((e) => e.name).toList());
                                                                                        }
                                                                                      }()
                                                                                          .toList();
                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: pinned.length,
                                                                                        itemBuilder: (context, pinnedIndex) {
                                                                                          final pinnedItem = pinned[pinnedIndex];
                                                                                          return Stack(
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                child: StreamBuilder<List<LocationsRecord>>(
                                                                                                  stream: queryLocationsRecord(
                                                                                                    queryBuilder: (locationsRecord) => locationsRecord
                                                                                                        .where(
                                                                                                          'name',
                                                                                                          isEqualTo: pinnedItem != '' ? pinnedItem : null,
                                                                                                        )
                                                                                                        .whereIn('name', _model.simpleSearchResults5.map((e) => e.name).toList() != '' ? _model.simpleSearchResults5.map((e) => e.name).toList() : null),
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
                                                                                                    List<LocationsRecord> containerLocationsRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final containerLocationsRecord = containerLocationsRecordList.isNotEmpty ? containerLocationsRecordList.first : null;
                                                                                                    return Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Visibility(
                                                                                                        visible: (_model.categorySelected == 'all') || containerLocationsRecord!.category.contains(_model.categorySelected),
                                                                                                        child: StreamBuilder<List<Translations5Record>>(
                                                                                                          stream: queryTranslations5Record(
                                                                                                            parent: containerLocationsRecord?.reference,
                                                                                                            queryBuilder: (translations5Record) => translations5Record.where(
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
                                                                                                            List<Translations5Record> containerTranslations5RecordList = snapshot.data!;
                                                                                                            // Return an empty Container when the item does not exist.
                                                                                                            if (snapshot.data!.isEmpty) {
                                                                                                              return Container();
                                                                                                            }
                                                                                                            final containerTranslations5Record = containerTranslations5RecordList.isNotEmpty ? containerTranslations5RecordList.first : null;
                                                                                                            return Material(
                                                                                                              color: Colors.transparent,
                                                                                                              elevation: 2.0,
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                ),
                                                                                                                child: StreamBuilder<List<Translations6Record>>(
                                                                                                                  stream: queryTranslations6Record(
                                                                                                                    parent: containerLocationsRecord?.reference,
                                                                                                                    queryBuilder: (translations6Record) => translations6Record.where(
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
                                                                                                                    List<Translations6Record> blurTranslations6RecordList = snapshot.data!;
                                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                                      return Container();
                                                                                                                    }
                                                                                                                    final blurTranslations6Record = blurTranslations6RecordList.isNotEmpty ? blurTranslations6RecordList.first : null;
                                                                                                                    return ClipRect(
                                                                                                                      child: ImageFiltered(
                                                                                                                        imageFilter: ImageFilter.blur(
                                                                                                                          sigmaX: 0.0,
                                                                                                                          sigmaY: 0.0,
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              context.pushNamed(
                                                                                                                                'map',
                                                                                                                                queryParameters: {
                                                                                                                                  'locationtoLoad': serializeParam(
                                                                                                                                    containerLocationsRecord,
                                                                                                                                    ParamType.Document,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                                extra: <String, dynamic>{
                                                                                                                                  'locationtoLoad': containerLocationsRecord,
                                                                                                                                },
                                                                                                                              );
                                                                                                                            },
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? blurTranslations6Record?.value : containerLocationsRecord?.name,
                                                                                                                                    'no value',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                                                ),
                                                                                                                                Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? containerTranslations5Record?.value : containerLocationsRecord?.type,
                                                                                                                                    'no value',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                                ),
                                                                                                                                Builder(
                                                                                                                                  builder: (context) {
                                                                                                                                    final categoryPinnedLocations = homeCategoryRecordList.where((e) => containerLocationsRecord!.category.contains(e.title)).toList().map((e) => e.icon).toList();
                                                                                                                                    return Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: List.generate(categoryPinnedLocations.length, (categoryPinnedLocationsIndex) {
                                                                                                                                        final categoryPinnedLocationsItem = categoryPinnedLocations[categoryPinnedLocationsIndex];
                                                                                                                                        return Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            categoryPinnedLocationsItem,
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
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      FaIcon(
                                                                                                                                        FontAwesomeIcons.mapMarkerAlt,
                                                                                                                                        color: Colors.black,
                                                                                                                                        size: 20.0,
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: Text(
                                                                                                                                          containerLocationsRecord!.address,
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Inter',
                                                                                                                                                fontSize: 15.0,
                                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        flex: 1,
                                                                                                                                        child: FFButtonWidget(
                                                                                                                                          onPressed: () async {
                                                                                                                                            await launchURL(containerLocationsRecord!.website);
                                                                                                                                          },
                                                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                                                            '3m100qmp' /* Website */,
                                                                                                                                          ),
                                                                                                                                          icon: FaIcon(
                                                                                                                                            FontAwesomeIcons.globe,
                                                                                                                                            size: 20.0,
                                                                                                                                          ),
                                                                                                                                          options: FFButtonOptions(
                                                                                                                                            height: 40.0,
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                  fontFamily: 'Inter',
                                                                                                                                                  color: Colors.white,
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
                                                                                                                                      Expanded(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                          child: FFButtonWidget(
                                                                                                                                            onPressed: () async {
                                                                                                                                              await launchUrl(Uri(
                                                                                                                                                scheme: 'tel',
                                                                                                                                                path: containerLocationsRecord!.phone.toString(),
                                                                                                                                              ));
                                                                                                                                            },
                                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                                              'faqnsr68' /* Call */,
                                                                                                                                            ),
                                                                                                                                            icon: FaIcon(
                                                                                                                                              FontAwesomeIcons.phone,
                                                                                                                                              size: 20.0,
                                                                                                                                            ),
                                                                                                                                            options: FFButtonOptions(
                                                                                                                                              width: 130.0,
                                                                                                                                              height: 40.0,
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                                    color: Colors.white,
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
                                                                                                                                      ),
                                                                                                                                      Expanded(
                                                                                                                                        flex: 1,
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                          child: FFButtonWidget(
                                                                                                                                            onPressed: () async {
                                                                                                                                              await launchURL(containerLocationsRecord!.mail);
                                                                                                                                            },
                                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                                              'e33sgfam' /* Email */,
                                                                                                                                            ),
                                                                                                                                            icon: FaIcon(
                                                                                                                                              FontAwesomeIcons.solidEnvelope,
                                                                                                                                              size: 20.0,
                                                                                                                                            ),
                                                                                                                                            options: FFButtonOptions(
                                                                                                                                              width: 130.0,
                                                                                                                                              height: 40.0,
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                                    color: Colors.white,
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
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
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
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                child: StreamBuilder<List<ProgramsRecord>>(
                                                                                                  stream: queryProgramsRecord(
                                                                                                    queryBuilder: (programsRecord) => programsRecord.where(
                                                                                                      'name',
                                                                                                      isEqualTo: pinnedItem,
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
                                                                                                    List<ProgramsRecord> blurProgramsRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final blurProgramsRecord = blurProgramsRecordList.isNotEmpty ? blurProgramsRecordList.first : null;
                                                                                                    return ClipRect(
                                                                                                      child: ImageFiltered(
                                                                                                        imageFilter: ImageFilter.blur(
                                                                                                          sigmaX: 0.0,
                                                                                                          sigmaY: 0.0,
                                                                                                        ),
                                                                                                        child: Visibility(
                                                                                                          visible: (_model.categorySelected == 'all') || blurProgramsRecord!.category.contains(_model.categorySelected),
                                                                                                          child: Material(
                                                                                                            color: Colors.transparent,
                                                                                                            elevation: 2.0,
                                                                                                            shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Container(
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                child: StreamBuilder<LocationsRecord>(
                                                                                                                  stream: LocationsRecord.getDocument(blurProgramsRecord!.parentReference),
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
                                                                                                                    final programLocationsRecord = snapshot.data!;
                                                                                                                    return InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        context.pushNamed(
                                                                                                                          'map',
                                                                                                                          queryParameters: {
                                                                                                                            'locationtoLoad': serializeParam(
                                                                                                                              programLocationsRecord,
                                                                                                                              ParamType.Document,
                                                                                                                            ),
                                                                                                                            'isLoadPrograms': serializeParam(
                                                                                                                              true,
                                                                                                                              ParamType.bool,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
                                                                                                                          extra: <String, dynamic>{
                                                                                                                            'locationtoLoad': programLocationsRecord,
                                                                                                                          },
                                                                                                                        );
                                                                                                                      },
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            programLocationsRecord.name,
                                                                                                                            style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            programLocationsRecord.type,
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                          ),
                                                                                                                          Builder(
                                                                                                                            builder: (context) {
                                                                                                                              final categoryPinnedLocations = homeCategoryRecordList.where((e) => programLocationsRecord.category.contains(e.title)).toList().map((e) => e.icon).toList();
                                                                                                                              return Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: List.generate(categoryPinnedLocations.length, (categoryPinnedLocationsIndex) {
                                                                                                                                  final categoryPinnedLocationsItem = categoryPinnedLocations[categoryPinnedLocationsIndex];
                                                                                                                                  return Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      pinnedItem,
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
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                FaIcon(
                                                                                                                                  FontAwesomeIcons.solidCalendar,
                                                                                                                                  color: Colors.black,
                                                                                                                                  size: 20.0,
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    blurProgramsRecord!.dates.first.toString(),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Inter',
                                                                                                                                          fontSize: 15.0,
                                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Align(
                                                                                                                                  alignment: AlignmentDirectional(0.00, -1.00),
                                                                                                                                  child: FaIcon(
                                                                                                                                    FontAwesomeIcons.mapMarkerAlt,
                                                                                                                                    color: Colors.black,
                                                                                                                                    size: 20.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Container(
                                                                                                                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                                                                                                                  constraints: BoxConstraints(
                                                                                                                                    maxHeight: 35.0,
                                                                                                                                  ),
                                                                                                                                  decoration: BoxDecoration(),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                    child: AutoSizeText(
                                                                                                                                      '${programLocationsRecord.name}, ${programLocationsRecord.address}',
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Inter',
                                                                                                                                            fontSize: 15.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                child: StreamBuilder<List<SubcategoryRecord>>(
                                                                                                  stream: querySubcategoryRecord(
                                                                                                    queryBuilder: (subcategoryRecord) => subcategoryRecord
                                                                                                        .where(
                                                                                                          'name',
                                                                                                          isEqualTo: pinnedItem != '' ? pinnedItem : null,
                                                                                                        )
                                                                                                        .whereIn('name', _model.simpleSearchResults2.map((e) => e.name).toList() != '' ? _model.simpleSearchResults2.map((e) => e.name).toList() : null),
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
                                                                                                    List<SubcategoryRecord> containerSubcategoryRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final containerSubcategoryRecord = containerSubcategoryRecordList.isNotEmpty ? containerSubcategoryRecordList.first : null;
                                                                                                    return Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Visibility(
                                                                                                        visible: (_model.categorySelected == 'all') || (_model.categorySelected == containerSubcategoryRecord?.category),
                                                                                                        child: StreamBuilder<List<Translations1Record>>(
                                                                                                          stream: queryTranslations1Record(
                                                                                                            parent: containerSubcategoryRecord?.reference,
                                                                                                            queryBuilder: (translations1Record) => translations1Record.where(
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
                                                                                                            List<Translations1Record> containerTranslations1RecordList = snapshot.data!;
                                                                                                            // Return an empty Container when the item does not exist.
                                                                                                            if (snapshot.data!.isEmpty) {
                                                                                                              return Container();
                                                                                                            }
                                                                                                            final containerTranslations1Record = containerTranslations1RecordList.isNotEmpty ? containerTranslations1RecordList.first : null;
                                                                                                            return Material(
                                                                                                              color: Colors.transparent,
                                                                                                              elevation: 2.0,
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      context.pushNamed(
                                                                                                                        'subcategory',
                                                                                                                        queryParameters: {
                                                                                                                          'subcategorydetail': serializeParam(
                                                                                                                            containerSubcategoryRecord?.reference,
                                                                                                                            ParamType.DocumentReference,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                      );
                                                                                                                    },
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                homeCategoryRecordList.where((e) => e.title == containerSubcategoryRecord?.category).toList().first.icon,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'fa',
                                                                                                                                      fontSize: 25.0,
                                                                                                                                      useGoogleFonts: false,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxHeight: 45.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(),
                                                                                                                              child: AutoSizeText(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? containerTranslations1Record?.value : containerSubcategoryRecord?.name,
                                                                                                                                  'no value',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                          child: StreamBuilder<List<Translations2Record>>(
                                                                                                                            stream: queryTranslations2Record(
                                                                                                                              parent: containerSubcategoryRecord?.reference,
                                                                                                                              queryBuilder: (translations2Record) => translations2Record.where(
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
                                                                                                                              List<Translations2Record> textTranslations2RecordList = snapshot.data!;
                                                                                                                              // Return an empty Container when the item does not exist.
                                                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                                                return Container();
                                                                                                                              }
                                                                                                                              final textTranslations2Record = textTranslations2RecordList.isNotEmpty ? textTranslations2RecordList.first : null;
                                                                                                                              return Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations2Record?.value : containerSubcategoryRecord?.information,
                                                                                                                                  'no value',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                child: StreamBuilder<List<ResourceproviderRecord>>(
                                                                                                  stream: queryResourceproviderRecord(
                                                                                                    queryBuilder: (resourceproviderRecord) => resourceproviderRecord
                                                                                                        .where(
                                                                                                          'name',
                                                                                                          isEqualTo: pinnedItem != '' ? pinnedItem : null,
                                                                                                        )
                                                                                                        .whereIn('name', _model.simpleSearchResults1.map((e) => e.name).toList() != '' ? _model.simpleSearchResults1.map((e) => e.name).toList() : null),
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
                                                                                                    List<ResourceproviderRecord> containerResourceproviderRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final containerResourceproviderRecord = containerResourceproviderRecordList.isNotEmpty ? containerResourceproviderRecordList.first : null;
                                                                                                    return Material(
                                                                                                      color: Colors.transparent,
                                                                                                      elevation: 2.0,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                      ),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        height: 175.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              await launchURL(containerResourceproviderRecord!.link);
                                                                                                            },
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                              children: [
                                                                                                                StreamBuilder<List<Translations9Record>>(
                                                                                                                  stream: queryTranslations9Record(
                                                                                                                    parent: containerResourceproviderRecord?.reference,
                                                                                                                    queryBuilder: (translations9Record) => translations9Record.where(
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
                                                                                                                    List<Translations9Record> textTranslations9RecordList = snapshot.data!;
                                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                                      return Container();
                                                                                                                    }
                                                                                                                    final textTranslations9Record = textTranslations9RecordList.isNotEmpty ? textTranslations9RecordList.first : null;
                                                                                                                    return AutoSizeText(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations9Record?.value : containerResourceproviderRecord?.name,
                                                                                                                        'no value',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<List<Translations10Record>>(
                                                                                                                    stream: queryTranslations10Record(
                                                                                                                      parent: containerResourceproviderRecord?.reference,
                                                                                                                      queryBuilder: (translations10Record) => translations10Record.where(
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
                                                                                                                      List<Translations10Record> textTranslations10RecordList = snapshot.data!;
                                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                                        return Container();
                                                                                                                      }
                                                                                                                      final textTranslations10Record = textTranslations10RecordList.isNotEmpty ? textTranslations10RecordList.first : null;
                                                                                                                      return Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations10Record?.value : containerResourceproviderRecord?.name,
                                                                                                                          'no value',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                child: StreamBuilder<List<ChatsRecord>>(
                                                                                                  stream: queryChatsRecord(
                                                                                                    queryBuilder: (chatsRecord) => chatsRecord
                                                                                                        .where(
                                                                                                          'name',
                                                                                                          isEqualTo: pinnedItem != '' ? pinnedItem : null,
                                                                                                        )
                                                                                                        .where(
                                                                                                          'type',
                                                                                                          isEqualTo: 'QA',
                                                                                                        )
                                                                                                        .whereIn('name', _model.simpleSearchResults3.map((e) => e.name).toList() != '' ? _model.simpleSearchResults3.map((e) => e.name).toList() : null),
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
                                                                                                    List<ChatsRecord> containerChatsRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final containerChatsRecord = containerChatsRecordList.isNotEmpty ? containerChatsRecordList.first : null;
                                                                                                    return Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Visibility(
                                                                                                        visible: (_model.categorySelected == 'all') || containerChatsRecord!.categories.contains(_model.categorySelected),
                                                                                                        child: Material(
                                                                                                          color: Colors.transparent,
                                                                                                          elevation: 2.0,
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                          ),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            constraints: BoxConstraints(
                                                                                                              maxHeight: 204.0,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  context.pushNamed(
                                                                                                                    'connect',
                                                                                                                    queryParameters: {
                                                                                                                      'chatToLoad': serializeParam(
                                                                                                                        containerChatsRecord,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                      'professionToLoad': serializeParam(
                                                                                                                        'none',
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'chatToLoad': containerChatsRecord,
                                                                                                                    },
                                                                                                                  );
                                                                                                                },
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                                                      constraints: BoxConstraints(
                                                                                                                        maxHeight: 45.0,
                                                                                                                      ),
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: StreamBuilder<List<Translations18Record>>(
                                                                                                                        stream: queryTranslations18Record(
                                                                                                                          parent: containerChatsRecord?.reference,
                                                                                                                          queryBuilder: (translations18Record) => translations18Record.where(
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
                                                                                                                          List<Translations18Record> textTranslations18RecordList = snapshot.data!;
                                                                                                                          // Return an empty Container when the item does not exist.
                                                                                                                          if (snapshot.data!.isEmpty) {
                                                                                                                            return Container();
                                                                                                                          }
                                                                                                                          final textTranslations18Record = textTranslations18RecordList.isNotEmpty ? textTranslations18RecordList.first : null;
                                                                                                                          return AutoSizeText(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              (stackLanguagesRecord?.name != 'English') && (valueOrDefault(currentUserDocument?.translateApp, '') == 'true') ? textTranslations18Record?.value : containerChatsRecord?.name,
                                                                                                                              'n',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                                                      child: FutureBuilder<int>(
                                                                                                                        future: queryMessagesRecordCount(
                                                                                                                          parent: containerChatsRecord?.reference,
                                                                                                                          queryBuilder: (messagesRecord) => messagesRecord.where(
                                                                                                                            'isAnswer',
                                                                                                                            isEqualTo: true,
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
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  size: 50.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          }
                                                                                                                          int textCount = snapshot.data!;
                                                                                                                          return Text(
                                                                                                                            textCount == 0 ? 'Unanswered' : '${textCount.toString()} answers',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Inter',
                                                                                                                                  fontSize: 15.0,
                                                                                                                                ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                      child: Builder(
                                                                                                                        builder: (context) {
                                                                                                                          final categoryPinnedLocations = homeCategoryRecordList.where((e) => containerChatsRecord!.categories.contains(e.title)).toList().map((e) => e.icon).toList();
                                                                                                                          return Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: List.generate(categoryPinnedLocations.length, (categoryPinnedLocationsIndex) {
                                                                                                                              final categoryPinnedLocationsItem = categoryPinnedLocations[categoryPinnedLocationsIndex];
                                                                                                                              return Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  categoryPinnedLocationsItem,
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
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          StreamBuilder<List<UserRecord>>(
                                                                                                                            stream: queryUserRecord(
                                                                                                                              queryBuilder: (userRecord) => userRecord.where(
                                                                                                                                'name',
                                                                                                                                isEqualTo: containerChatsRecord?.lastmessageuser,
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
                                                                                                                                  circleImageUserRecord!.photoUrl,
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              containerChatsRecord!.lastmessageuser,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        '${dateTimeFormat(
                                                                                                                          'relative',
                                                                                                                          containerChatsRecord?.lastmessagetime,
                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                        )} - ${containerChatsRecord?.lastmessage}',
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: 'Inter',
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                        ],
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
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 1.00),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .refugeeNavBarModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              RefugeeNavBarWidget(),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
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
