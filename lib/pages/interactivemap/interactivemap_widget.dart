import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mapsheet/mapsheet_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interactivemap_model.dart';
export 'interactivemap_model.dart';

class InteractivemapWidget extends StatefulWidget {
  const InteractivemapWidget({
    Key? key,
    this.locationtoLoad,
  }) : super(key: key);

  final LocationsRecord? locationtoLoad;

  @override
  _InteractivemapWidgetState createState() => _InteractivemapWidgetState();
}

class _InteractivemapWidgetState extends State<InteractivemapWidget> {
  late InteractivemapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InteractivemapModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.locationtoLoad != null) {
        setState(() {
          _model.showMapSheet = true;
          _model.locationSelected = widget.locationtoLoad;
        });
      }
    });

    _model.emailAddressController1 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.name
            : 'Enter');
    _model.emailAddressController2 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.type
            : 'Enter');
    _model.emailAddressController3 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.description
            : 'Enter');
    _model.emailAddressController4 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.address
            : 'Enter');
    _model.emailAddressController5 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.website
            : 'Enter');
    _model.emailAddressController6 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.phone?.toString()
            : 'Enter');
    _model.emailAddressController7 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.mail
            : 'Enter');
    _model.emailAddressController8 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.coordinates?.toString()
            : '49,-187');
    _model.emailAddressController9 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? ((List<String> var1) {
                return var1.join('');
              }(_model.locationSelected!.bullet!.toList().toList()))
            : 'Offers culturally appropriate foods,banking services');
    _model.emailAddressController10 ??= TextEditingController(
        text: _model.locationtoEdit != null
            ? _model.locationtoEdit!.directions
            : 'Enter');
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Visibility(
          visible: _model.showMapSheet ?? true,
          child: FloatingActionButton(
            onPressed: () async {
              setState(() {
                _model.showMapSheet = false;
              });
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            elevation: 8.0,
            child: Text(
              FFLocalizations.of(context).getText(
                'dzpdz508' /* X */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'fa',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 25.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Align(
            alignment: AlignmentDirectional(-0.95, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '9vplo88o' /* Interactive Map */,
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
              if (valueOrDefault<bool>(currentUserDocument?.isRefugee, false))
                AuthUserStreamWidget(
                  builder: (context) => Stack(
                    children: [
                      StreamBuilder<List<LocationsRecord>>(
                        stream: queryLocationsRecord(
                          queryBuilder: (locationsRecord) =>
                              locationsRecord.where('category',
                                  arrayContains: _model.categorySelected),
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
                          List<LocationsRecord> googleMapLocationsRecordList =
                              snapshot.data!;
                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??=
                                LatLng(49.170049098020606, -122.8458442123441),
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
                                      setState(() {
                                        _model.showMapSheet = true;
                                      });
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
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 10.0, 25.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        _model.isFiltering = true;
                                      });
                                    },
                                    text: _model.categorySelected == 'none'
                                        ? 'All locations'
                                        : _model.categorySelected!,
                                    icon: FaIcon(
                                      FontAwesomeIcons.mapMarkerAlt,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 54.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(27.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_model.showMapSheet ?? true)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 100.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.mapsheetModel,
                                    updateCallback: () => setState(() {}),
                                    child: MapsheetWidget(
                                      doc: _model.locationSelected,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (_model.isFiltering ?? true)
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
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
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '1lvxoyd9' /* Xmark */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 60.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'wvn627bu' /* Filter by category */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'obnfndut' /* bars */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'fa',
                                                        fontSize: 30.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '19ijymgm' /* No filter */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              ),
                                            ],
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
                                ),
                                StreamBuilder<List<CategoryRecord>>(
                                  stream: queryCategoryRecord(
                                    queryBuilder: (categoryRecord) =>
                                        categoryRecord.where('isinmap',
                                            isEqualTo: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 0.0, 25.0, 0.0),
                                          child: InkWell(
                                            onTap: () async {
                                              setState(() {
                                                _model.isFiltering = false;
                                                _model.categorySelected =
                                                    columnCategoryRecord.title;
                                              });
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
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
                                                              .icon!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
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
                                                        ),
                                                      ),
                                                      Text(
                                                        columnCategoryRecord
                                                            .title!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
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
                ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!valueOrDefault<bool>(
                        currentUserDocument?.isRefugee, false))
                      AuthUserStreamWidget(
                        builder: (context) => Stack(
                          children: [
                            if (!_model.isEdit!)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 75.0, 25.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 100.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            _model.isEdit = true;
                                            _model.isSelectingLocation = false;
                                            _model.locationtoEdit = null;
                                          });
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'w1c1edb4' /* New Location */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 250.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 50.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            _model.isSelectingLocation = true;
                                            _model.isEdit = true;
                                          });
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '2ddncqdl' /* Edit Location */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 250.0,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.isEdit! && _model.isSelectingLocation!)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 75.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'cnyxota0' /* Select location */,
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
                                        25.0, 50.0, 25.0, 0.0),
                                    child: StreamBuilder<List<LocationsRecord>>(
                                      stream: queryLocationsRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        List<LocationsRecord>
                                            listViewLocationsRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listViewLocationsRecordList
                                              .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewLocationsRecord =
                                                listViewLocationsRecordList[
                                                    listViewIndex];
                                            return InkWell(
                                              onTap: () async {
                                                setState(() {
                                                  _model.isSelectingLocation =
                                                      false;
                                                  _model.locationtoEdit =
                                                      listViewLocationsRecord;
                                                });
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewLocationsRecord
                                                          .name!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge,
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                ],
                              ),
                            if (_model.isEdit! && !_model.isSelectingLocation!)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 75.0, 25.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.emailAddressController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '4o56uqx9' /* Name */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF57636C),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
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
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24.0, 24.0, 20.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: null,
                                      validator: _model
                                          .emailAddressController1Validator
                                          .asValidator(context),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController2,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            '1fj93l79' /* Type */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController2Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController3,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'afv8z9sl' /* Description */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController3Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController4,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'sncje7kz' /* Address */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController4Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController5,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'rup84xq1' /* Website */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController5Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController6,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'r74j357s' /* Phone */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        keyboardType: TextInputType.phone,
                                        validator: _model
                                            .emailAddressController6Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController7,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'e8qsoj60' /* Email */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController7Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController8,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'j97a4ca8' /* Coordinates */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController8Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController9,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'm9bosawo' /* Bulleted List */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController9Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController10,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'jtb3ixqd' /* Directions */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .emailAddressController10Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'b9ml88kb' /* Categories */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                    ),
                                    FutureBuilder<List<CategoryRecord>>(
                                      future: queryCategoryRecordOnce(
                                        queryBuilder: (categoryRecord) =>
                                            categoryRecord.where('isinmap',
                                                isEqualTo: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CategoryRecord>
                                            listViewCategoryRecordList =
                                            snapshot.data!;
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewCategoryRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewCategoryRecord =
                                                listViewCategoryRecordList[
                                                    listViewIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                ),
                                                child: CheckboxListTile(
                                                  value: _model
                                                              .checkboxListTileValueMap[
                                                          listViewCategoryRecord] ??=
                                                      (currentUserDocument
                                                                  ?.areasOfInterest
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(
                                                              listViewCategoryRecord
                                                                  .title),
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                                .checkboxListTileValueMap[
                                                            listViewCategoryRecord] =
                                                        newValue!);
                                                  },
                                                  title: Text(
                                                    listViewCategoryRecord
                                                        .title!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge,
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.locationtoEdit != null) {
                                            final locationsUpdateData = {
                                              ...createLocationsRecordData(
                                                name: _model
                                                    .emailAddressController1
                                                    .text,
                                                address: _model
                                                    .emailAddressController4
                                                    .text,
                                                type: _model
                                                    .emailAddressController2
                                                    .text,
                                                description: _model
                                                    .emailAddressController3
                                                    .text,
                                                website: _model
                                                    .emailAddressController5
                                                    .text,
                                                directions: _model
                                                    .emailAddressController10
                                                    .text,
                                                mail: _model
                                                    .emailAddressController7
                                                    .text,
                                                phone: int.tryParse(_model
                                                    .emailAddressController6
                                                    .text),
                                              ),
                                              'bullet': (String var1) {
                                                return var1.split(',');
                                              }(_model.emailAddressController9
                                                  .text),
                                              'category': _model
                                                  .checkboxListTileCheckedItems
                                                  .map((e) => e.title)
                                                  .withoutNulls
                                                  .toList(),
                                            };
                                            await _model
                                                .locationtoEdit!.reference
                                                .update(locationsUpdateData);
                                          } else {
                                            final locationsCreateData = {
                                              ...createLocationsRecordData(
                                                name: _model
                                                    .emailAddressController1
                                                    .text,
                                                address: _model
                                                    .emailAddressController4
                                                    .text,
                                                type: _model
                                                    .emailAddressController2
                                                    .text,
                                                description: _model
                                                    .emailAddressController3
                                                    .text,
                                                website: _model
                                                    .emailAddressController5
                                                    .text,
                                                directions: _model
                                                    .emailAddressController10
                                                    .text,
                                                mail: _model
                                                    .emailAddressController7
                                                    .text,
                                                phone: int.tryParse(_model
                                                    .emailAddressController6
                                                    .text),
                                              ),
                                              'bullet': (String var1) {
                                                return var1.split(',');
                                              }(_model.emailAddressController9
                                                  .text),
                                              'category': _model
                                                  .checkboxListTileCheckedItems
                                                  .map((e) => e.title)
                                                  .withoutNulls
                                                  .toList(),
                                            };
                                            await LocationsRecord.collection
                                                .doc()
                                                .set(locationsCreateData);
                                          }

                                          setState(() {
                                            _model.isEdit = false;
                                          });
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          't1yvuh2u' /* Save Changes */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 60.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
