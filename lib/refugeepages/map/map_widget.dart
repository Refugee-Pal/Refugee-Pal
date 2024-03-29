import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mapsheet/mapsheet_widget.dart';
import '/components/user_profile/user_profile_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    this.locationtoLoad,
    bool? isLoadPrograms,
  })  : this.isLoadPrograms = isLoadPrograms ?? false,
        super(key: key);

  final LocationsRecord? locationtoLoad;
  final bool isLoadPrograms;

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLocation = !widget.isLoadPrograms;
      });
      if (widget.locationtoLoad != null) {
        setState(() {
          _model.locationSelected = widget.locationtoLoad;
        });
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: 650.0,
                  child: MapsheetWidget(
                    doc: _model.locationSelected,
                    isLocation: _model.isLocation!,
                    categorySelected: 'none',
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'recents': FieldValue.arrayUnion([_model.locationSelected?.name]),
            },
          ),
        });
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<LanguagesRecord>>(
        stream: queryLanguagesRecord(
          queryBuilder: (languagesRecord) => languagesRecord.where(
            'Name',
            isEqualTo: valueOrDefault(currentUserDocument?.language, ''),
          ),
          singleRecord: true,
        ),
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
          List<LanguagesRecord> mapLanguagesRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final mapLanguagesRecord = mapLanguagesRecordList.isNotEmpty
              ? mapLanguagesRecordList.first
              : null;
          return GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return true;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return true;
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
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
                          'y69o17bw' /* Interactive Map */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
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
                child: Stack(
                  children: [
                    if (!FFAppState().isViewingProfile)
                      Stack(
                        children: [
                          StreamBuilder<List<LocationsRecord>>(
                            stream: queryLocationsRecord(
                              queryBuilder: (locationsRecord) =>
                                  locationsRecord.where(
                                'category',
                                arrayContains: _model.categorySelected,
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<LocationsRecord>
                                  googleMapLocationsRecordList = snapshot.data!;
                              return FlutterFlowGoogleMap(
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) =>
                                    _model.googleMapsCenter = latLng,
                                initialLocation: _model.googleMapsCenter ??=
                                    currentUserLocationValue!,
                                markers: googleMapLocationsRecordList
                                    .map(
                                      (googleMapLocationsRecord) =>
                                          FlutterFlowMarker(
                                        googleMapLocationsRecord.reference.path,
                                        googleMapLocationsRecord.coordinates!,
                                        () async {
                                          setState(() {
                                            _model.locationSelected =
                                                googleMapLocationsRecord;
                                          });

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'recents':
                                                    FieldValue.arrayUnion([
                                                  googleMapLocationsRecord.name
                                                ]),
                                              },
                                            ),
                                          });
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: 650.0,
                                                    child: MapsheetWidget(
                                                      doc:
                                                          googleMapLocationsRecord,
                                                      isLocation:
                                                          _model.isLocation!,
                                                      categorySelected: _model
                                                          .categorySelected!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                      ),
                                    )
                                    .toList(),
                                markerColor: GoogleMarkerColor.azure,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.silver,
                                initialZoom: 12.0,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: false,
                                showLocation: true,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
                              );
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                if (_model.categorySelected !=
                                                    'none')
                                                  StreamBuilder<
                                                      List<CategoryRecord>>(
                                                    stream: queryCategoryRecord(
                                                      queryBuilder:
                                                          (categoryRecord) =>
                                                              categoryRecord
                                                                  .where(
                                                        'title',
                                                        isEqualTo: _model
                                                            .categorySelected,
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
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CategoryRecord>
                                                          blurCategoryRecordList =
                                                          snapshot.data!;
                                                      final blurCategoryRecord =
                                                          blurCategoryRecordList
                                                                  .isNotEmpty
                                                              ? blurCategoryRecordList
                                                                  .first
                                                              : null;
                                                      return ClipRect(
                                                        child: ImageFiltered(
                                                          imageFilter:
                                                              ImageFilter.blur(
                                                            sigmaX: 0.0,
                                                            sigmaY: 0.0,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    Translations8Record>>(
                                                              stream:
                                                                  queryTranslations8Record(
                                                                parent: blurCategoryRecord
                                                                    ?.reference,
                                                                queryBuilder:
                                                                    (translations8Record) =>
                                                                        translations8Record
                                                                            .where(
                                                                  'language',
                                                                  isEqualTo: mapLanguagesRecord
                                                                              ?.code !=
                                                                          ''
                                                                      ? mapLanguagesRecord
                                                                          ?.code
                                                                      : null,
                                                                ),
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
                                                                List<Translations8Record>
                                                                    buttonTranslations8RecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final buttonTranslations8Record =
                                                                    buttonTranslations8RecordList
                                                                            .isNotEmpty
                                                                        ? buttonTranslations8RecordList
                                                                            .first
                                                                        : null;
                                                                return FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isFiltering =
                                                                          true;
                                                                    });
                                                                  },
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    (mapLanguagesRecord?.name !=
                                                                                'English') &&
                                                                            (valueOrDefault(currentUserDocument?.translateApp, '') ==
                                                                                'true')
                                                                        ? buttonTranslations8Record
                                                                            ?.value
                                                                        : blurCategoryRecord
                                                                            ?.title,
                                                                    'All',
                                                                  ),
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .mapMarkerAlt,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        60.0,
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
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                        ),
                                                                    elevation:
                                                                        2.0,
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
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                if (_model.categorySelected ==
                                                    'none')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        setState(() {
                                                          _model.isFiltering =
                                                              true;
                                                        });
                                                      },
                                                      text: _model.isLocation!
                                                          ? 'All locations'
                                                          : 'All programs',
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .mapMarkerAlt,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 300.0,
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
                                                                      .primaryBtnText,
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if (!_model.isLocation!)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCalendar,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      _model.isLocation = true;
                                                    });
                                                  },
                                                ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: const CircleBorder(),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Visibility(
                                                    visible:
                                                        _model.isLocation ??
                                                            true,
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.location_on,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        setState(() {
                                                          _model.isLocation =
                                                              false;
                                                        });
                                                      },
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 95.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'home',
                                              queryParameters: {
                                                'startingCategory':
                                                    serializeParam(
                                                  _model.categorySelected ==
                                                          'none'
                                                      ? 'All'
                                                      : _model.categorySelected,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            't4pn4bv2' /* More  */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 80.0,
                                            height: 60.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: const CircleBorder(),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            icon: FaIcon(
                                              FontAwesomeIcons.listUl,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                'home',
                                                queryParameters: {
                                                  'startingChip':
                                                      serializeParam(
                                                    'Locations',
                                                    ParamType.String,
                                                  ),
                                                  'startingCategory':
                                                      serializeParam(
                                                    _model.categorySelected ==
                                                            'none'
                                                        ? 'All'
                                                        : _model
                                                            .categorySelected,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
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
                          ),
                          if (_model.isFiltering ?? true)
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.isFiltering = false;
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '1lvxoyd9' /* Xmark */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 60.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'fa',
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wvn627bu' /* Filter by category */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 25.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.isFiltering = false;
                                            _model.categorySelected = 'none';
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'obnfndut' /* bars */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'fa',
                                                            fontSize: 30.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '19ijymgm' /* No filter */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<List<CategoryRecord>>(
                                      stream: queryCategoryRecord(
                                        queryBuilder: (categoryRecord) =>
                                            categoryRecord.where(
                                          'isinmap',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CategoryRecord>
                                            columnCategoryRecordList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnCategoryRecordList.length,
                                              (columnIndex) {
                                            final columnCategoryRecord =
                                                columnCategoryRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 25.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.isFiltering = false;
                                                    _model.categorySelected =
                                                        columnCategoryRecord
                                                            .title;
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
                                                              columnCategoryRecord
                                                                  .icon,
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
                                                          StreamBuilder<
                                                              List<
                                                                  Translations8Record>>(
                                                            stream:
                                                                queryTranslations8Record(
                                                              parent:
                                                                  columnCategoryRecord
                                                                      .reference,
                                                              queryBuilder:
                                                                  (translations8Record) =>
                                                                      translations8Record
                                                                          .where(
                                                                'language',
                                                                isEqualTo:
                                                                    mapLanguagesRecord
                                                                        ?.code,
                                                              ),
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
                                                              List<Translations8Record>
                                                                  textTranslations8RecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final textTranslations8Record =
                                                                  textTranslations8RecordList
                                                                          .isNotEmpty
                                                                      ? textTranslations8RecordList
                                                                          .first
                                                                      : null;
                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  (mapLanguagesRecord?.name !=
                                                                              'English') &&
                                                                          (valueOrDefault(currentUserDocument?.translateApp, '') ==
                                                                              'true')
                                                                      ? textTranslations8Record
                                                                          ?.value
                                                                      : columnCategoryRecord
                                                                          .title,
                                                                  'n',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          19.0,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                    if (FFAppState().isViewingProfile)
                      wrapWithModel(
                        model: _model.userProfileModel,
                        updateCallback: () => setState(() {}),
                        child: UserProfileWidget(),
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
