import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/components/small_map/small_map_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import '/navbars/helper_nav_bar/helper_nav_bar_widget.dart';
import 'dart:io';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'helper_organization_model.dart';
export 'helper_organization_model.dart';

class HelperOrganizationWidget extends StatefulWidget {
  const HelperOrganizationWidget({
    Key? key,
    this.locationToEdit,
    required this.editing,
    this.itemInList,
    this.programToEdit,
  }) : super(key: key);

  final LocationsRecord? locationToEdit;
  final String? editing;
  final int? itemInList;
  final ProgramsRecord? programToEdit;

  @override
  _HelperOrganizationWidgetState createState() =>
      _HelperOrganizationWidgetState();
}

class _HelperOrganizationWidgetState extends State<HelperOrganizationWidget> {
  late HelperOrganizationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelperOrganizationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.editing != 'false') {
        setState(() {
          _model.locationToEdit = widget.locationToEdit;
          _model.editing = widget.editing == 'programNames'
              ? 'programNames'
              : widget.editing;
          _model.isSettings = false;
          _model.programToEdit = widget.programToEdit;
        });
      } else {
        setState(() {
          _model.isSettings = true;
        });
      }
    });

    _model.emailAddressController1 ??= TextEditingController();
    _model.emailAddressController2 ??= TextEditingController();
    _model.emailAddressController3 ??= TextEditingController();
    _model.emailAddressController4 ??= TextEditingController();
    _model.emailAddressController10 ??= TextEditingController(text: '');
    _model.emailAddress1Controller ??= TextEditingController();
    _model.emailAddressController16 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.emailAddressController4?.text =
              FFLocalizations.of(context).getText(
            'yye0szji' /* test */,
          );
        }));
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

    return StreamBuilder<List<LocationsRecord>>(
      stream: queryLocationsRecord(),
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
        List<LocationsRecord> helperOrganizationLocationsRecordList =
            snapshot.data!;
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
              title: Text(
                FFLocalizations.of(context).getText(
                  'gx562305' /* Organizations */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
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
            ),
            body: SafeArea(
              child: StreamBuilder<List<OrganizationsRecord>>(
                stream: queryOrganizationsRecord(),
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
                  List<OrganizationsRecord> blurOrganizationsRecordList =
                      snapshot.data!;
                  return ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 0.0,
                        sigmaY: 0.0,
                      ),
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              if (blurOrganizationsRecordList.length == 0)
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 60.0, 0.0, 0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/undraw_team_up_re_84ok.svg',
                                            width: 210.0,
                                            height: 240.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'zcnvc7r7' /* No organizations */,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40.0, 20.0, 40.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '0mwgeyys' /* Join or create an organization... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 40.0, 20.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.isJoin = true;
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'w0h1png9' /* Join an organization */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.isOnboarding = true;
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'fkjkcktw' /* Create an organization */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Visibility(
                                  visible: _model.isOnboarding ?? true,
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 50.0),
                                          child: PageView(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 0),
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Form(
                                                  key: _model.formKey1,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      30.0,
                                                                      60.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'z7s1aeyx' /* Name your organization */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      30.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    40.0,
                                                                    20.0,
                                                                    40.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .emailAddressController1,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              '9dzdw8mx' /* Name */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFDBE2E7),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        24.0,
                                                                        20.0,
                                                                        24.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          maxLines: null,
                                                          validator: _model
                                                              .emailAddressController1Validator
                                                              .asValidator(
                                                                  context),
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
                                                                      30.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'zs6qswa9' /* Add your logo */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    40.0,
                                                                    40.0,
                                                                    40.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (_model.imgPath !=
                                                                    null &&
                                                                _model.imgPath !=
                                                                    '')
                                                              Container(
                                                                width: 130.0,
                                                                height: 130.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  _model.imgPath !=
                                                                              null &&
                                                                          _model.imgPath !=
                                                                              ''
                                                                      ? _model
                                                                          .imgPath!
                                                                      : _model
                                                                          .imgPath!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    65.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    130.0,
                                                                hoverColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                icon: Icon(
                                                                  Icons
                                                                      .edit_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 70.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final selectedMedia =
                                                                      await selectMediaWithSourceBottomSheet(
                                                                    context:
                                                                        context,
                                                                    imageQuality:
                                                                        100,
                                                                    allowPhoto:
                                                                        true,
                                                                  );
                                                                  if (selectedMedia !=
                                                                          null &&
                                                                      selectedMedia.every((m) => validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                    setState(() =>
                                                                        _model.isDataUploading1 =
                                                                            true);
                                                                    var selectedUploadedFiles =
                                                                        <FFUploadedFile>[];
                                                                    var downloadUrls =
                                                                        <String>[];
                                                                    try {
                                                                      selectedUploadedFiles = selectedMedia
                                                                          .map((m) => FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();

                                                                      downloadUrls = (await Future
                                                                              .wait(
                                                                        selectedMedia
                                                                            .map(
                                                                          (m) async => await uploadData(
                                                                              m.storagePath,
                                                                              m.bytes),
                                                                        ),
                                                                      ))
                                                                          .where((u) =>
                                                                              u !=
                                                                              null)
                                                                          .map((u) =>
                                                                              u!)
                                                                          .toList();
                                                                    } finally {
                                                                      _model.isDataUploading1 =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles.length ==
                                                                            selectedMedia
                                                                                .length &&
                                                                        downloadUrls.length ==
                                                                            selectedMedia.length) {
                                                                      setState(
                                                                          () {
                                                                        _model.uploadedLocalFile1 =
                                                                            selectedUploadedFiles.first;
                                                                        _model.uploadedFileUrl1 =
                                                                            downloadUrls.first;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  setState(() {
                                                                    _model.imgPath =
                                                                        _model
                                                                            .uploadedFileUrl1;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    60.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model.formKey1
                                                                        .currentState ==
                                                                    null ||
                                                                !_model.formKey1
                                                                    .currentState!
                                                                    .validate()) {
                                                              return;
                                                            }

                                                            final organizationsCreateData =
                                                                createOrganizationsRecordData(
                                                              name: _model
                                                                  .emailAddressController1
                                                                  .text,
                                                              logoPath: _model
                                                                  .uploadedFileUrl2,
                                                            );
                                                            var organizationsRecordReference =
                                                                OrganizationsRecord
                                                                    .collection
                                                                    .doc();
                                                            await organizationsRecordReference
                                                                .set(
                                                                    organizationsCreateData);
                                                            _model.newDocument =
                                                                OrganizationsRecord
                                                                    .getDocumentFromData(
                                                                        organizationsCreateData,
                                                                        organizationsRecordReference);
                                                            await _model
                                                                .pageViewController
                                                                ?.nextPage(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              curve:
                                                                  Curves.ease,
                                                            );

                                                            setState(() {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'isgo3fqs' /* Next */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
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
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  60.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/undraw_blank_canvas_re_2hwy.svg',
                                                        width: 200.0,
                                                        height: 210.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'y00vmr1x' /* Describe your organization */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Form(
                                                      key: _model.formKey3,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    40.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .emailAddressController2,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'trgc783p' /* Description */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFFDBE2E7),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        24.0,
                                                                        20.0,
                                                                        24.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          maxLines: null,
                                                          validator: _model
                                                              .emailAddressController2Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  40.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (_model.formKey3
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey3
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }

                                                          final organizationsUpdateData =
                                                              createOrganizationsRecordData(
                                                            description: _model
                                                                .emailAddressController2
                                                                .text,
                                                          );
                                                          await _model
                                                              .newDocument!
                                                              .reference
                                                              .update(
                                                                  organizationsUpdateData);
                                                          await _model
                                                              .pageViewController
                                                              ?.nextPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'uznrnibp' /* Next */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
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
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              StreamBuilder<List<UserRecord>>(
                                                stream: queryUserRecord(
                                                  queryBuilder: (userRecord) =>
                                                      userRecord
                                                          .where('isRefugee',
                                                              isEqualTo: false)
                                                          .orderBy('name'),
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
                                                      blurUserRecordList =
                                                      snapshot.data!
                                                          .where((u) =>
                                                              u.uid !=
                                                              currentUserUid)
                                                          .toList();
                                                  return ClipRect(
                                                    child: ImageFiltered(
                                                      imageFilter:
                                                          ImageFilter.blur(
                                                        sigmaX: 0.0,
                                                        sigmaY: 0.0,
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
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
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          80.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hw290zwx' /* Add people */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          60.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Stack(
                                                                    children: [
                                                                      TextFormField(
                                                                        controller:
                                                                            _model.emailAddressController3,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'd3kntq84' /* Search... */,
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
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0xFFDBE2E7),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              24.0,
                                                                              20.0,
                                                                              24.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        maxLines:
                                                                            null,
                                                                        validator: _model
                                                                            .emailAddressController3Validator
                                                                            .asValidator(context),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
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
                                                                              60.0,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.search,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.simpleSearchResults = TextSearch(
                                                                                blurUserRecordList
                                                                                    .map(
                                                                                      (record) => TextSearchItem(record, [
                                                                                        record.name!
                                                                                      ]),
                                                                                    )
                                                                                    .toList(),
                                                                              ).search(_model.emailAddressController3.text).map((r) => r.object).toList();
                                                                            });
                                                                            setState(() {
                                                                              _model.isShowAll = false;
                                                                            });
                                                                          },
                                                                        ),
                                                                      ),
                                                                      if (!_model
                                                                          .isShowAll!)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.68,
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
                                                                                60.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.close_rounded,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 30.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() {
                                                                                _model.isShowAll = true;
                                                                              });
                                                                            },
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        20.0,
                                                                        20.0,
                                                                        20.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final people = (_model.isShowAll!
                                                                            ? blurUserRecordList
                                                                            : _model.simpleSearchResults)
                                                                        .toList();
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          people
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              peopleIndex) {
                                                                        final peopleItem =
                                                                            people[peopleIndex];
                                                                        return Card(
                                                                          clipBehavior:
                                                                              Clip.antiAliasWithSaveLayer,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    peopleItem.photoUrl != null && peopleItem.photoUrl != '' ? peopleItem.photoUrl! : 'https://picsum.photos/seed/862/600',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Theme(
                                                                                    data: ThemeData(
                                                                                      checkboxTheme: CheckboxThemeData(
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(25),
                                                                                        ),
                                                                                      ),
                                                                                      unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                    ),
                                                                                    child: CheckboxListTile(
                                                                                      value: _model.checkboxListTileValueMap1[peopleItem] ??= false,
                                                                                      onChanged: (newValue) async {
                                                                                        setState(() => _model.checkboxListTileValueMap1[peopleItem] = newValue!);
                                                                                      },
                                                                                      title: Text(
                                                                                        peopleItem.name!,
                                                                                        style: FlutterFlowTheme.of(context).titleLarge,
                                                                                      ),
                                                                                      subtitle: Text(
                                                                                        peopleItem.displayName!,
                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                      ),
                                                                                      activeColor: FlutterFlowTheme.of(context).primary,
                                                                                      dense: false,
                                                                                      controlAffinity: ListTileControlAffinity.trailing,
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
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        40.0,
                                                                        20.0,
                                                                        0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    final organizationsUpdateData =
                                                                        {
                                                                      'people': (List<String> var1,
                                                                              String
                                                                                  var2) {
                                                                        return var1 +
                                                                            [
                                                                              var2
                                                                            ];
                                                                      }(
                                                                          _model
                                                                              .checkboxListTileCheckedItems1
                                                                              .map((e) => e
                                                                                  .name)
                                                                              .withoutNulls
                                                                              .toList(),
                                                                          valueOrDefault(
                                                                              currentUserDocument?.name,
                                                                              '')),
                                                                    };
                                                                    await _model
                                                                        .newDocument!
                                                                        .reference
                                                                        .update(
                                                                            organizationsUpdateData);
                                                                    setState(
                                                                        () {
                                                                      _model.isOnboarding =
                                                                          false;
                                                                    });
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'raifztuy' /* Done */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        50.0,
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
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                            20.0),
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller:
                                                  _model.pageViewController ??=
                                                      PageController(
                                                          initialPage: 0),
                                              count: 3,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model.pageViewController!
                                                    .animateToPage(
                                                  i,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              effect: smooth_page_indicator
                                                  .ExpandingDotsEffect(
                                                expansionFactor: 2.0,
                                                spacing: 8.0,
                                                radius: 16.0,
                                                dotWidth: 16.0,
                                                dotHeight: 16.0,
                                                dotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  if ((_model.organizationSelected == 'none') &&
                                      (blurOrganizationsRecordList.length !=
                                          0) &&
                                      !_model.isJoin! &&
                                      !_model.isOnboarding!)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 150.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    60.0,
                                                                    0.0,
                                                                    40.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'df8ycs2x' /* My Organizations */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Builder(
                                                        builder: (context) {
                                                          final userOrganizations =
                                                              blurOrganizationsRecordList
                                                                  .where((e) => e
                                                                      .people!
                                                                      .toList()
                                                                      .contains(
                                                                          currentUserDisplayName))
                                                                  .toList();
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                userOrganizations
                                                                    .length,
                                                            itemBuilder: (context,
                                                                userOrganizationsIndex) {
                                                              final userOrganizationsItem =
                                                                  userOrganizations[
                                                                      userOrganizationsIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
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
                                                                    setState(
                                                                        () {
                                                                      _model.organizationSelected =
                                                                          userOrganizationsItem
                                                                              .name;
                                                                    });
                                                                  },
                                                                  child:
                                                                      Material(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            StreamBuilder<List<OrganizationsRecord>>(
                                                                              stream: queryOrganizationsRecord(
                                                                                queryBuilder: (organizationsRecord) => organizationsRecord.where('name', isEqualTo: _model.organizationSelected),
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
                                                                                List<OrganizationsRecord> imageOrganizationsRecordList = snapshot.data!;
                                                                                // Return an empty Container when the item does not exist.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final imageOrganizationsRecord = imageOrganizationsRecordList.isNotEmpty ? imageOrganizationsRecordList.first : null;
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
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                userOrganizationsItem.name!,
                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  40.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          setState(() {
                                                            _model.isJoin =
                                                                true;
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'gd96pezh' /* Join Organization */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
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
                                                          elevation: 2.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  40.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          setState(() {
                                                            _model.isOnboarding =
                                                                true;
                                                          });
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3gpi8hfu' /* New Organization */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
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
                                                          elevation: 2.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
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
                                  if (_model.organizationSelected != 'none')
                                    Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            if (_model.isSettings ?? true)
                                              Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 115.0, 0.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      80.0,
                                                                      20.0,
                                                                      20.0),
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
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'k47x9dkv' /* Profile */,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleLarge,
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '72t8yug1' /* Edit */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130.0,
                                                                            height:
                                                                                45.0,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Colors.white,
                                                                                  fontSize: 20.0,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
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
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                            child:
                                                                                Image.network(
                                                                              'https://picsum.photos/seed/409/600',
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'rw7zk77v' /* Hello World */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleLarge,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '6px416if' /* Hello World */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      20.0,
                                                                      20.0,
                                                                      20.0),
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
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'v85man2e' /* People */,
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).titleLarge,
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '4sjnh3sj' /* Manage */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130.0,
                                                                            height:
                                                                                45.0,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Colors.white,
                                                                                  fontSize: 20.0,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            UserRecord>>(
                                                                      stream:
                                                                          queryUserRecord(
                                                                        queryBuilder:
                                                                            (userRecord) =>
                                                                                userRecord.orderBy('name'),
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
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<UserRecord>
                                                                            stackUserRecordList =
                                                                            snapshot.data!;
                                                                        return Stack(
                                                                          children: List.generate(
                                                                              stackUserRecordList.length,
                                                                              (stackIndex) {
                                                                            final stackUserRecord =
                                                                                stackUserRecordList[stackIndex];
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: (stackIndex * 35).toDouble(),
                                                                                  height: 1.0,
                                                                                  decoration: BoxDecoration(),
                                                                                ),
                                                                                Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    'https://picsum.photos/seed/588/600',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      20.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (bottomSheetContext) {
                                                                  return GestureDetector(
                                                                    onTap: () => FocusScope.of(
                                                                            context)
                                                                        .requestFocus(
                                                                            _unfocusNode),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery.of(
                                                                              bottomSheetContext)
                                                                          .viewInsets,
                                                                      child:
                                                                          DeleteConfirmationWidget(
                                                                        thingToDelete:
                                                                            FFLocalizations.of(context).getText(
                                                                          'bpaw1q9q' /* organization */,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(() =>
                                                                      _model.isDelete =
                                                                          value));

                                                              if (_model
                                                                  .isDelete!) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'test: deleted',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }

                                                              setState(() {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '14rdo1zd' /* Delete organization */,
                                                            ),
                                                            icon: Icon(
                                                              Icons.delete,
                                                              size: 30.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
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
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontSize:
                                                                            22.0,
                                                                      ),
                                                              elevation: 2.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Stack(
                                                children: [
                                                  if (!_model.isSettings!)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    114.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                CategoryRecord>>(
                                                          stream:
                                                              queryCategoryRecord(
                                                            queryBuilder: (categoryRecord) =>
                                                                categoryRecord.where(
                                                                    'isinmap',
                                                                    isEqualTo:
                                                                        true),
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
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<CategoryRecord>
                                                                tabBarCategoryRecordList =
                                                                snapshot.data!;
                                                            return DefaultTabController(
                                                              length: 3,
                                                              initialIndex: min(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    widget.programToEdit !=
                                                                            null
                                                                        ? 1
                                                                        : 0,
                                                                    0,
                                                                  ),
                                                                  2),
                                                              child: Column(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0),
                                                                    child:
                                                                        TabBar(
                                                                      labelColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                      indicatorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      tabs: [
                                                                        Tab(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'occk1fom' /* Locations */,
                                                                          ),
                                                                        ),
                                                                        Tab(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ym5ipmex' /* Programs */,
                                                                          ),
                                                                        ),
                                                                        Tab(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ctaeg04w' /* Resources */,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        TabBarView(
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          primary:
                                                                              false,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    setState(() {
                                                                                      _model.editing = 'locationNew';
                                                                                      _model.isNew = true;
                                                                                    });
                                                                                  },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 1.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              'assets/images/our-locations.jpeg',
                                                                                              width: 100.0,
                                                                                              height: 100.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 8.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.add_rounded,
                                                                                                    color: Colors.black,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'tbamoo26' /* New Location  */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontWeight: FontWeight.w500,
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
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final locationsList = helperOrganizationLocationsRecordList.toList().take(5).toList();
                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: locationsList.length,
                                                                                      itemBuilder: (context, locationsListIndex) {
                                                                                        final locationsListItem = locationsList[locationsListIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                          child: Material(
                                                                                            color: Colors.transparent,
                                                                                            elevation: 2.0,
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                            ),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 150.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  flex: 8,
                                                                                                                  child: Stack(
                                                                                                                    children: [
                                                                                                                      InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                                            context: context,
                                                                                                                            allowPhoto: true,
                                                                                                                          );
                                                                                                                          if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                                            setState(() => _model.isDataUploading2 = true);
                                                                                                                            var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                                                            var downloadUrls = <String>[];
                                                                                                                            try {
                                                                                                                              selectedUploadedFiles = selectedMedia
                                                                                                                                  .map((m) => FFUploadedFile(
                                                                                                                                        name: m.storagePath.split('/').last,
                                                                                                                                        bytes: m.bytes,
                                                                                                                                        height: m.dimensions?.height,
                                                                                                                                        width: m.dimensions?.width,
                                                                                                                                        blurHash: m.blurHash,
                                                                                                                                      ))
                                                                                                                                  .toList();

                                                                                                                              downloadUrls = (await Future.wait(
                                                                                                                                selectedMedia.map(
                                                                                                                                  (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                                                                ),
                                                                                                                              ))
                                                                                                                                  .where((u) => u != null)
                                                                                                                                  .map((u) => u!)
                                                                                                                                  .toList();
                                                                                                                            } finally {
                                                                                                                              _model.isDataUploading2 = false;
                                                                                                                            }
                                                                                                                            if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                                              setState(() {
                                                                                                                                _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                                                _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                                                              });
                                                                                                                            } else {
                                                                                                                              setState(() {});
                                                                                                                              return;
                                                                                                                            }
                                                                                                                          }

                                                                                                                          final locationsUpdateData = createLocationsRecordData(
                                                                                                                            imgPath: _model.uploadedFileUrl2,
                                                                                                                          );
                                                                                                                          await locationsListItem.reference.update(locationsUpdateData);
                                                                                                                        },
                                                                                                                        child: Stack(
                                                                                                                          children: [
                                                                                                                            Image.network(
                                                                                                                              locationsListItem.imgPath != null && locationsListItem.imgPath != '' ? locationsListItem.imgPath! : 'https://picsum.photos/seed/803/700',
                                                                                                                              width: double.infinity,
                                                                                                                              height: 120.0,
                                                                                                                              fit: BoxFit.cover,
                                                                                                                            ),
                                                                                                                            Align(
                                                                                                                              alignment: AlignmentDirectional(0.0, -0.25),
                                                                                                                              child: ClipRect(
                                                                                                                                child: ImageFiltered(
                                                                                                                                  imageFilter: ImageFilter.blur(
                                                                                                                                    sigmaX: 10.0,
                                                                                                                                    sigmaY: 10.0,
                                                                                                                                  ),
                                                                                                                                  child: Align(
                                                                                                                                    alignment: AlignmentDirectional(0.0, -0.25),
                                                                                                                                    child: Container(
                                                                                                                                      width: 110.0,
                                                                                                                                      height: 20.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: Color(0xFF666C73),
                                                                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                                                                        shape: BoxShape.rectangle,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Align(
                                                                                                                              alignment: AlignmentDirectional(0.0, -0.25),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                                                                                                                child: Text(
                                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                                    '08kcva61' /* Press to edit */,
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        fontFamily: 'Inter',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                                                Expanded(
                                                                                                                  flex: 5,
                                                                                                                  child: SmallMapWidget(
                                                                                                                    key: Key('Key24n_${locationsListIndex}_of_${locationsList.length}'),
                                                                                                                    coords: locationsListItem.coordinates!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: MediaQuery.of(context).size.width * 0.77,
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    maxHeight: 75.0,
                                                                                                                  ),
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 5.0),
                                                                                                                    child: AutoSizeText(
                                                                                                                      locationsListItem.name!,
                                                                                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      locationsListItem.type!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: MediaQuery.of(context).size.width * 0.76,
                                                                                                                      constraints: BoxConstraints(
                                                                                                                        maxHeight: 140.0,
                                                                                                                      ),
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                        child: AutoSizeText(
                                                                                                                          locationsListItem.description!,
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                      child: Builder(
                                                                                                                        builder: (context) {
                                                                                                                          final categories = tabBarCategoryRecordList.where((e) => locationsListItem.category!.toList().contains(e.title)).toList();
                                                                                                                          return Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: List.generate(categories.length, (categoriesIndex) {
                                                                                                                              final categoriesItem = categories[categoriesIndex];
                                                                                                                              return Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  categoriesItem.icon!,
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
                                                                                                              ),
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  if (Navigator.of(context).canPop()) {
                                                                                                                    context.pop();
                                                                                                                  }
                                                                                                                  context.pushNamed(
                                                                                                                    'helperOrganization',
                                                                                                                    queryParams: {
                                                                                                                      'locationToEdit': serializeParam(
                                                                                                                        locationsListItem,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                      'editing': serializeParam(
                                                                                                                        'locationOverview',
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'itemInList': serializeParam(
                                                                                                                        locationsListIndex,
                                                                                                                        ParamType.int,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'locationToEdit': locationsListItem,
                                                                                                                    },
                                                                                                                  );
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.edit_rounded,
                                                                                                                  color: Colors.black,
                                                                                                                  size: 25.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                              child: FaIcon(
                                                                                                                                FontAwesomeIcons.mapMarkerAlt,
                                                                                                                                color: Colors.black,
                                                                                                                                size: 25.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.of(context).size.width * 0.64,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxHeight: 70.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  locationsListItem.address!,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Inter',
                                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                            child: FaIcon(
                                                                                                                              FontAwesomeIcons.directions,
                                                                                                                              color: Colors.black,
                                                                                                                              size: 25.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            width: MediaQuery.of(context).size.width * 0.64,
                                                                                                                            constraints: BoxConstraints(
                                                                                                                              maxHeight: 70.0,
                                                                                                                            ),
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                              child: AutoSizeText(
                                                                                                                                locationsListItem.directions!,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                                      decoration: TextDecoration.underline,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      if (Navigator.of(context).canPop()) {
                                                                                                                        context.pop();
                                                                                                                      }
                                                                                                                      context.pushNamed(
                                                                                                                        'helperOrganization',
                                                                                                                        queryParams: {
                                                                                                                          'locationToEdit': serializeParam(
                                                                                                                            locationsListItem,
                                                                                                                            ParamType.Document,
                                                                                                                          ),
                                                                                                                          'editing': serializeParam(
                                                                                                                            'locationLocation',
                                                                                                                            ParamType.String,
                                                                                                                          ),
                                                                                                                          'itemInList': serializeParam(
                                                                                                                            locationsListIndex,
                                                                                                                            ParamType.int,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                        extra: <String, dynamic>{
                                                                                                                          'locationToEdit': locationsListItem,
                                                                                                                        },
                                                                                                                      );
                                                                                                                    },
                                                                                                                    child: Icon(
                                                                                                                      Icons.edit_rounded,
                                                                                                                      color: Colors.black,
                                                                                                                      size: 25.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                        child: FaIcon(
                                                                                                                          FontAwesomeIcons.globe,
                                                                                                                          color: Colors.black,
                                                                                                                          size: 25.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 0.64,
                                                                                                                        constraints: BoxConstraints(
                                                                                                                          maxHeight: 55.0,
                                                                                                                        ),
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: AutoSizeText(
                                                                                                                            locationsListItem.website!,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Inter',
                                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                  decoration: TextDecoration.underline,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                          child: FaIcon(
                                                                                                                            FontAwesomeIcons.phone,
                                                                                                                            color: Colors.black,
                                                                                                                            size: 25.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.of(context).size.width * 0.64,
                                                                                                                          constraints: BoxConstraints(
                                                                                                                            maxHeight: 55.0,
                                                                                                                          ),
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              locationsListItem.phone!.toString(),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  if (locationsListItem.mail != null && locationsListItem.mail != '')
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                            child: FaIcon(
                                                                                                                              FontAwesomeIcons.solidEnvelope,
                                                                                                                              color: Colors.black,
                                                                                                                              size: 25.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Container(
                                                                                                                            width: MediaQuery.of(context).size.width * 0.64,
                                                                                                                            constraints: BoxConstraints(
                                                                                                                              maxHeight: 55.0,
                                                                                                                            ),
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                locationsListItem.mail!,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  if (Navigator.of(context).canPop()) {
                                                                                                                    context.pop();
                                                                                                                  }
                                                                                                                  context.pushNamed(
                                                                                                                    'helperOrganization',
                                                                                                                    queryParams: {
                                                                                                                      'locationToEdit': serializeParam(
                                                                                                                        locationsListItem,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                      'editing': serializeParam(
                                                                                                                        'locationContact',
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'itemInList': serializeParam(
                                                                                                                        locationsListIndex,
                                                                                                                        ParamType.int,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'locationToEdit': locationsListItem,
                                                                                                                    },
                                                                                                                  );
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.edit_rounded,
                                                                                                                  color: Colors.black,
                                                                                                                  size: 25.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '4nqaunur' /* People */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      StreamBuilder<List<UserRecord>>(
                                                                                                                        stream: queryUserRecord(
                                                                                                                          queryBuilder: (userRecord) => userRecord.whereIn('name', locationsListItem.people!.toList()),
                                                                                                                          limit: 8,
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
                                                                                                                          List<UserRecord> stackUserRecordList = snapshot.data!;
                                                                                                                          return Stack(
                                                                                                                            children: List.generate(stackUserRecordList.length, (stackIndex) {
                                                                                                                              final stackUserRecord = stackUserRecordList[stackIndex];
                                                                                                                              return Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Container(
                                                                                                                                      width: stackIndex * 40,
                                                                                                                                      height: 1.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Container(
                                                                                                                                      width: 50.0,
                                                                                                                                      height: 50.0,
                                                                                                                                      clipBehavior: Clip.antiAlias,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        shape: BoxShape.circle,
                                                                                                                                      ),
                                                                                                                                      child: Image.network(
                                                                                                                                        stackUserRecord.photoUrl != null && stackUserRecord.photoUrl != '' ? stackUserRecord.photoUrl! : 'https://picsum.photos/seed/128/600',
                                                                                                                                        fit: BoxFit.cover,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                      FlutterFlowIconButton(
                                                                                                                        borderColor: Colors.transparent,
                                                                                                                        borderRadius: 30.0,
                                                                                                                        borderWidth: 1.0,
                                                                                                                        buttonSize: 50.0,
                                                                                                                        fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        icon: Icon(
                                                                                                                          Icons.add,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          size: 30.0,
                                                                                                                        ),
                                                                                                                        onPressed: () async {
                                                                                                                          if (Navigator.of(context).canPop()) {
                                                                                                                            context.pop();
                                                                                                                          }
                                                                                                                          context.pushNamed(
                                                                                                                            'helperOrganization',
                                                                                                                            queryParams: {
                                                                                                                              'locationToEdit': serializeParam(
                                                                                                                                locationsListItem,
                                                                                                                                ParamType.Document,
                                                                                                                              ),
                                                                                                                              'editing': serializeParam(
                                                                                                                                'locationPeople',
                                                                                                                                ParamType.String,
                                                                                                                              ),
                                                                                                                              'itemInList': serializeParam(
                                                                                                                                locationsListIndex,
                                                                                                                                ParamType.int,
                                                                                                                              ),
                                                                                                                            }.withoutNulls,
                                                                                                                            extra: <String, dynamic>{
                                                                                                                              'locationToEdit': locationsListItem,
                                                                                                                            },
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Builder(
                                                                                                                builder: (context) {
                                                                                                                  final bullet = locationsListItem.bullet!.toList();
                                                                                                                  return Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: List.generate(bullet.length, (bulletIndex) {
                                                                                                                      final bulletItem = bullet[bulletIndex];
                                                                                                                      return Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'i32ej0jo' /* 🙂  */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Inter',
                                                                                                                                    fontSize: 20.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.of(context).size.width * 0.61,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxHeight: 40.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(),
                                                                                                                              child: AutoSizeText(
                                                                                                                                bulletItem,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    }),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  context.pushNamed(
                                                                                                                    'helperOrganization',
                                                                                                                    queryParams: {
                                                                                                                      'locationToEdit': serializeParam(
                                                                                                                        locationsListItem,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                      'editing': serializeParam(
                                                                                                                        'locationBullet',
                                                                                                                        ParamType.String,
                                                                                                                      ),
                                                                                                                      'itemInList': serializeParam(
                                                                                                                        locationsListIndex,
                                                                                                                        ParamType.int,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'locationToEdit': locationsListItem,
                                                                                                                    },
                                                                                                                  );
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.edit_rounded,
                                                                                                                  color: Colors.black,
                                                                                                                  size: 25.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                        child: Text(
                                                                                                          locationsListItem.views != null ? '${locationsListItem.views?.toString()} views' : '0 views',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall,
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
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final locations = helperOrganizationLocationsRecordList.toList().take(5).toList();
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(locations.length, (locationsIndex) {
                                                                                        final locationsItem = locations[locationsIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Text(
                                                                                                  locationsItem.name!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 1.0,
                                                                                                color: Color(0xFFD0D0D0),
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  StreamBuilder<List<ProgramsRecord>>(
                                                                                                    stream: queryProgramsRecord(
                                                                                                      parent: locationsItem.reference,
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
                                                                                                      List<ProgramsRecord> columnProgramsRecordList = snapshot.data!;
                                                                                                      return Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: List.generate(columnProgramsRecordList.length, (columnIndex) {
                                                                                                          final columnProgramsRecord = columnProgramsRecordList[columnIndex];
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: Material(
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
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 15.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Builder(
                                                                                                                                    builder: (context) {
                                                                                                                                      final categoriesIcons = tabBarCategoryRecordList.where((e) => columnProgramsRecord.category!.toList().contains(e.title)).toList();
                                                                                                                                      return Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: List.generate(categoriesIcons.length, (categoriesIconsIndex) {
                                                                                                                                          final categoriesIconsItem = categoriesIcons[categoriesIconsIndex];
                                                                                                                                          return Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                            child: Text(
                                                                                                                                              categoriesIconsItem.icon!,
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
                                                                                                                                  Container(
                                                                                                                                    width: MediaQuery.of(context).size.width * 0.6,
                                                                                                                                    constraints: BoxConstraints(
                                                                                                                                      maxHeight: 50.0,
                                                                                                                                    ),
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    ),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: AutoSizeText(
                                                                                                                                        columnProgramsRecord.name!,
                                                                                                                                        style: FlutterFlowTheme.of(context).titleLarge,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              if (Navigator.of(context).canPop()) {
                                                                                                                                context.pop();
                                                                                                                              }
                                                                                                                              context.pushNamed(
                                                                                                                                'helperOrganization',
                                                                                                                                queryParams: {
                                                                                                                                  'editing': serializeParam(
                                                                                                                                    'programNames',
                                                                                                                                    ParamType.String,
                                                                                                                                  ),
                                                                                                                                  'itemInList': serializeParam(
                                                                                                                                    columnIndex,
                                                                                                                                    ParamType.int,
                                                                                                                                  ),
                                                                                                                                  'programToEdit': serializeParam(
                                                                                                                                    columnProgramsRecord,
                                                                                                                                    ParamType.Document,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                                extra: <String, dynamic>{
                                                                                                                                  'programToEdit': columnProgramsRecord,
                                                                                                                                },
                                                                                                                              );
                                                                                                                            },
                                                                                                                            child: Icon(
                                                                                                                              Icons.edit_rounded,
                                                                                                                              color: Colors.black,
                                                                                                                              size: 25.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            columnProgramsRecord.type!,
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 5.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.of(context).size.width * 0.76,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxHeight: 75.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(),
                                                                                                                              child: Text(
                                                                                                                                columnProgramsRecord.description!,
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                if (Navigator.of(context).canPop()) {
                                                                                                                                  context.pop();
                                                                                                                                }
                                                                                                                                context.pushNamed(
                                                                                                                                  'helperOrganization',
                                                                                                                                  queryParams: {
                                                                                                                                    'editing': serializeParam(
                                                                                                                                      'programOverview',
                                                                                                                                      ParamType.String,
                                                                                                                                    ),
                                                                                                                                    'itemInList': serializeParam(
                                                                                                                                      columnIndex,
                                                                                                                                      ParamType.int,
                                                                                                                                    ),
                                                                                                                                    'programToEdit': serializeParam(
                                                                                                                                      columnProgramsRecord,
                                                                                                                                      ParamType.Document,
                                                                                                                                    ),
                                                                                                                                  }.withoutNulls,
                                                                                                                                  extra: <String, dynamic>{
                                                                                                                                    'programToEdit': columnProgramsRecord,
                                                                                                                                  },
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Icon(
                                                                                                                                Icons.edit_rounded,
                                                                                                                                color: Colors.black,
                                                                                                                                size: 25.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                                                    child: FaIcon(
                                                                                                                                      FontAwesomeIcons.solidCalendar,
                                                                                                                                      color: Colors.black,
                                                                                                                                      size: 26.0,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      columnProgramsRecord.dates!.toList().length == 1
                                                                                                                                          ? dateTimeFormat(
                                                                                                                                              'M/d h:mm a',
                                                                                                                                              columnProgramsRecord.dates!.toList().first,
                                                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                                                            )
                                                                                                                                          : '${dateTimeFormat(
                                                                                                                                              'M/d h:mm a',
                                                                                                                                              columnProgramsRecord.dates!.toList().first,
                                                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                                                            )} +${(columnProgramsRecord.dates!.toList().length - 1).toString()} dates',
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                if (Navigator.of(context).canPop()) {
                                                                                                                                  context.pop();
                                                                                                                                }
                                                                                                                                context.pushNamed(
                                                                                                                                  'helperOrganization',
                                                                                                                                  queryParams: {
                                                                                                                                    'editing': serializeParam(
                                                                                                                                      'programDate',
                                                                                                                                      ParamType.String,
                                                                                                                                    ),
                                                                                                                                    'itemInList': serializeParam(
                                                                                                                                      columnIndex,
                                                                                                                                      ParamType.int,
                                                                                                                                    ),
                                                                                                                                    'programToEdit': serializeParam(
                                                                                                                                      columnProgramsRecord,
                                                                                                                                      ParamType.Document,
                                                                                                                                    ),
                                                                                                                                  }.withoutNulls,
                                                                                                                                  extra: <String, dynamic>{
                                                                                                                                    'programToEdit': columnProgramsRecord,
                                                                                                                                  },
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Icon(
                                                                                                                                Icons.edit_rounded,
                                                                                                                                color: Colors.black,
                                                                                                                                size: 25.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                                                  child: FaIcon(
                                                                                                                                    FontAwesomeIcons.globe,
                                                                                                                                    color: Colors.black,
                                                                                                                                    size: 26.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: InkWell(
                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                    onTap: () async {
                                                                                                                                      await launchURL(columnProgramsRecord.website!);
                                                                                                                                    },
                                                                                                                                    child: Text(
                                                                                                                                      columnProgramsRecord.website!,
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Inter',
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            decoration: TextDecoration.underline,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                            InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                if (Navigator.of(context).canPop()) {
                                                                                                                                  context.pop();
                                                                                                                                }
                                                                                                                                context.pushNamed(
                                                                                                                                  'helperOrganization',
                                                                                                                                  queryParams: {
                                                                                                                                    'editing': serializeParam(
                                                                                                                                      'programWebsite',
                                                                                                                                      ParamType.String,
                                                                                                                                    ),
                                                                                                                                    'itemInList': serializeParam(
                                                                                                                                      columnIndex,
                                                                                                                                      ParamType.int,
                                                                                                                                    ),
                                                                                                                                    'programToEdit': serializeParam(
                                                                                                                                      columnProgramsRecord,
                                                                                                                                      ParamType.Document,
                                                                                                                                    ),
                                                                                                                                  }.withoutNulls,
                                                                                                                                  extra: <String, dynamic>{
                                                                                                                                    'programToEdit': columnProgramsRecord,
                                                                                                                                  },
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Icon(
                                                                                                                                Icons.edit_rounded,
                                                                                                                                color: Colors.black,
                                                                                                                                size: 25.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              '6ri00r2a' /* People */,
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
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
                                                                                                                                    child: CircularProgressIndicator(
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              }
                                                                                                                              List<UserRecord> stackUserRecordList = snapshot.data!;
                                                                                                                              return Stack(
                                                                                                                                children: List.generate(stackUserRecordList.length, (stackIndex) {
                                                                                                                                  final stackUserRecord = stackUserRecordList[stackIndex];
                                                                                                                                  return Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          width: stackIndex * 40,
                                                                                                                                          height: 1.0,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Container(
                                                                                                                                          width: 50.0,
                                                                                                                                          height: 50.0,
                                                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                          ),
                                                                                                                                          child: Image.network(
                                                                                                                                            stackUserRecord.photoUrl != null && stackUserRecord.photoUrl != '' ? stackUserRecord.photoUrl! : 'https://picsum.photos/seed/128/600',
                                                                                                                                            fit: BoxFit.cover,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ),
                                                                                                                          FlutterFlowIconButton(
                                                                                                                            borderColor: Colors.transparent,
                                                                                                                            borderRadius: 30.0,
                                                                                                                            borderWidth: 1.0,
                                                                                                                            buttonSize: 50.0,
                                                                                                                            fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            icon: Icon(
                                                                                                                              Icons.add,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              size: 30.0,
                                                                                                                            ),
                                                                                                                            onPressed: () async {
                                                                                                                              if (Navigator.of(context).canPop()) {
                                                                                                                                context.pop();
                                                                                                                              }
                                                                                                                              context.pushNamed(
                                                                                                                                'helperOrganization',
                                                                                                                                queryParams: {
                                                                                                                                  'editing': serializeParam(
                                                                                                                                    'programPeople',
                                                                                                                                    ParamType.String,
                                                                                                                                  ),
                                                                                                                                  'itemInList': serializeParam(
                                                                                                                                    columnIndex,
                                                                                                                                    ParamType.int,
                                                                                                                                  ),
                                                                                                                                  'programToEdit': serializeParam(
                                                                                                                                    columnProgramsRecord,
                                                                                                                                    ParamType.Document,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                                extra: <String, dynamic>{
                                                                                                                                  'programToEdit': columnProgramsRecord,
                                                                                                                                },
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        }),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              setState(() {
                                                                                                                _model.editing = 'programNew';
                                                                                                                _model.programToEdit = widget.programToEdit;
                                                                                                                _model.parentLocation = locationsItem;
                                                                                                                _model.isNew = true;
                                                                                                              });
                                                                                                            },
                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                              'tly54o9n' /* New program or event */,
                                                                                                            ),
                                                                                                            options: FFButtonOptions(
                                                                                                              height: 50.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: Colors.white,
                                                                                                                    fontSize: 22.0,
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
                                                                                                ],
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
                                                                        StreamBuilder<
                                                                            List<ResourceproviderRecord>>(
                                                                          stream:
                                                                              queryResourceproviderRecord(),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            List<ResourceproviderRecord>
                                                                                blurResourceproviderRecordList =
                                                                                snapshot.data!;
                                                                            return ClipRect(
                                                                              child: ImageFiltered(
                                                                                imageFilter: ImageFilter.blur(
                                                                                  sigmaX: 0.0,
                                                                                  sigmaY: 0.0,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                  child: StreamBuilder<List<SubcategoryRecord>>(
                                                                                    stream: querySubcategoryRecord(),
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
                                                                                      List<SubcategoryRecord> columnSubcategoryRecordList = snapshot.data!;
                                                                                      return Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(columnSubcategoryRecordList.length, (columnIndex) {
                                                                                          final columnSubcategoryRecord = columnSubcategoryRecordList[columnIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: StreamBuilder<List<CategoryRecord>>(
                                                                                                    stream: queryCategoryRecord(
                                                                                                      queryBuilder: (categoryRecord) => categoryRecord.where('title', isEqualTo: columnSubcategoryRecord.category),
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
                                                                                                      List<CategoryRecord> richTextCategoryRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final richTextCategoryRecord = richTextCategoryRecordList.isNotEmpty ? richTextCategoryRecordList.first : null;
                                                                                                      return RichText(
                                                                                                        text: TextSpan(
                                                                                                          children: [
                                                                                                            TextSpan(
                                                                                                              text: richTextCategoryRecord!.icon!,
                                                                                                              style: TextStyle(
                                                                                                                fontFamily: 'fa',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              ),
                                                                                                            ),
                                                                                                            TextSpan(
                                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                                '4ucv5yv2' /*   */,
                                                                                                              ),
                                                                                                              style: GoogleFonts.getFont(
                                                                                                                'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              ),
                                                                                                            ),
                                                                                                            TextSpan(
                                                                                                              text: columnSubcategoryRecord.name!,
                                                                                                              style: TextStyle(),
                                                                                                            )
                                                                                                          ],
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                                Divider(
                                                                                                  thickness: 1.0,
                                                                                                  color: Color(0xFFD0D0D0),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      final resourceprovider = blurResourceproviderRecordList.where((e) => e.subcategory == columnSubcategoryRecord.reference.id).toList();
                                                                                                      return Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: List.generate(resourceprovider.length, (resourceproviderIndex) {
                                                                                                          final resourceproviderItem = resourceprovider[resourceproviderIndex];
                                                                                                          return Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                            child: Material(
                                                                                                              color: Colors.transparent,
                                                                                                              elevation: 2.0,
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                              ),
                                                                                                              child: ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.of(context).size.width * 0.76,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxHeight: 50.0,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                              child: AutoSizeText(
                                                                                                                                resourceproviderItem.name!,
                                                                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      fontSize: 22.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Icon(
                                                                                                                              Icons.edit_rounded,
                                                                                                                              color: Colors.black,
                                                                                                                              size: 25.0,
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 3.0),
                                                                                                                            child: Text(
                                                                                                                              resourceproviderItem.information!,
                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                                                            child: InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                await launchURL(resourceproviderItem.link!);
                                                                                                                              },
                                                                                                                              child: Text(
                                                                                                                                resourceproviderItem.link!,
                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                                      decoration: TextDecoration.underline,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
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
                                                                                          );
                                                                                        }),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
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
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        10.0,
                                                                        3.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
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
                                                                            60.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_back_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            _model.organizationSelected =
                                                                                'none';
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            OrganizationsRecord>>(
                                                                      stream:
                                                                          queryOrganizationsRecord(
                                                                        queryBuilder: (organizationsRecord) => organizationsRecord.where(
                                                                            'name',
                                                                            isEqualTo:
                                                                                _model.organizationSelected),
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
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<OrganizationsRecord>
                                                                            imageOrganizationsRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final imageOrganizationsRecord = imageOrganizationsRecordList.isNotEmpty
                                                                            ? imageOrganizationsRecordList.first
                                                                            : null;
                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              Image.network(
                                                                            imageOrganizationsRecord!.logoPath!,
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        _model
                                                                            .organizationSelected!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                  .isSettings!) {
                                                                setState(() {
                                                                  _model.isSettings =
                                                                      false;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.isSettings =
                                                                      true;
                                                                });
                                                              }
                                                            },
                                                            child: Stack(
                                                              children: [
                                                                if (!_model
                                                                    .isSettings!)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .cog,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'pj1tvk12' /* Organization Settings */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .isSettings ??
                                                                    true)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            6.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .book,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'yl3gkeaj' /* Manage Services */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
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
                                                  if (!_model.isSettings! &&
                                                      (_model.editing !=
                                                          'false'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  50.0,
                                                                  25.0,
                                                                  130.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      40.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          4.0,
                                                                          10.0),
                                                                  spreadRadius:
                                                                      20.0,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            20.0,
                                                                            20.0,
                                                                            20.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    (_model.editing == 'locationPeople') || (_model.editing == 'programPeople')
                                                                                        ? 'Add people'
                                                                                        : '${_model.isNew! ? 'New ' : 'Edit '}${valueOrDefault<String>(
                                                                                            (widget.editing == 'programOverview') || (widget.editing == 'programDate') || (widget.editing == 'programWebsite') || (_model.editing == 'programNames') || (widget.editing == 'programDates') || (widget.editing == 'programPeople') || (_model.editing == 'programNew') ? 'program' : 'location',
                                                                                            'test',
                                                                                          )}',
                                                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                                                  ),
                                                                                ),
                                                                                if (!_model.isNew!)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 40.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        (widget.editing == 'programOverview') || (widget.editing == 'programDate') || (widget.editing == 'programWebsite') || (_model.editing == 'programNames') || (widget.editing == 'programDates') || (widget.editing == 'programPeople') || (_model.editing == 'programNew') ? _model.programToEdit!.name : _model.locationToEdit!.name,
                                                                                        'test',
                                                                                      ),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodySmall,
                                                                                    ),
                                                                                  ),
                                                                                Stack(
                                                                                  children: [
                                                                                    if (_model.editing == 'locationName')
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 200.0),
                                                                                        child: StreamBuilder<List<LocationsRecord>>(
                                                                                          stream: queryLocationsRecord(
                                                                                            queryBuilder: (locationsRecord) => locationsRecord.where('name', isEqualTo: _model.locationToEdit!.name != '' ? _model.locationToEdit!.name : null),
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
                                                                                            List<LocationsRecord> emailAddressLocationsRecordList = snapshot.data!;
                                                                                            // Return an empty Container when the item does not exist.
                                                                                            if (snapshot.data!.isEmpty) {
                                                                                              return Container();
                                                                                            }
                                                                                            final emailAddressLocationsRecord = emailAddressLocationsRecordList.isNotEmpty ? emailAddressLocationsRecordList.first : null;
                                                                                            return TextFormField(
                                                                                              controller: _model.emailAddressController4,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelText: FFLocalizations.of(context).getText(
                                                                                                  '7xnli4tz' /* Location name */,
                                                                                                ),
                                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: Color(0xFF57636C),
                                                                                                      fontSize: 14.0,
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
                                                                                                    color: Color(0x00000000),
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
                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                              maxLines: null,
                                                                                              validator: _model.emailAddressController4Validator.asValidator(context),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    if (_model.editing == 'locationOverview')
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          StreamBuilder<LocationsRecord>(
                                                                                            stream: LocationsRecord.getDocument(_model.locationToEdit!.reference),
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
                                                                                              final wrapLocationsRecord = snapshot.data!;
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
                                                                                                  TextFormField(
                                                                                                    controller: _model.emailAddressController5 ??= TextEditingController(
                                                                                                      text: wrapLocationsRecord.type,
                                                                                                    ),
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                                        'vrysdfol' /* Type of location */,
                                                                                                      ),
                                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: Color(0xFF57636C),
                                                                                                            fontSize: 14.0,
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
                                                                                                          color: Color(0x00000000),
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
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                    maxLines: null,
                                                                                                    validator: _model.emailAddressController5Validator.asValidator(context),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.emailAddressController6 ??= TextEditingController(
                                                                                                        text: wrapLocationsRecord.description,
                                                                                                      ),
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          'kjc3eq02' /* Description */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: Color(0xFF57636C),
                                                                                                              fontSize: 14.0,
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
                                                                                                            color: Color(0x00000000),
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
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                      maxLines: null,
                                                                                                      validator: _model.emailAddressController6Validator.asValidator(context),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '57v3thf8' /* Categories */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: StreamBuilder<List<CategoryRecord>>(
                                                                                              stream: queryCategoryRecord(
                                                                                                queryBuilder: (categoryRecord) => categoryRecord.where('isinmap', isEqualTo: true),
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
                                                                                                List<CategoryRecord> listViewCategoryRecordList = snapshot.data!;
                                                                                                return ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  shrinkWrap: true,
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: listViewCategoryRecordList.length,
                                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                                    final listViewCategoryRecord = listViewCategoryRecordList[listViewIndex];
                                                                                                    return Theme(
                                                                                                      data: ThemeData(
                                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(25),
                                                                                                          ),
                                                                                                        ),
                                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                                      ),
                                                                                                      child: CheckboxListTile(
                                                                                                        value: _model.checkboxListTileValueMap2[listViewCategoryRecord] ??= _model.locationToEdit!.category!.toList().contains(listViewCategoryRecord.title),
                                                                                                        onChanged: (newValue) async {
                                                                                                          setState(() => _model.checkboxListTileValueMap2[listViewCategoryRecord] = newValue!);
                                                                                                        },
                                                                                                        title: Text(
                                                                                                          listViewCategoryRecord.title!,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                        tileColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        dense: false,
                                                                                                        controlAffinity: ListTileControlAffinity.trailing,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    if (_model.editing == 'locationContact')
                                                                                      StreamBuilder<LocationsRecord>(
                                                                                        stream: LocationsRecord.getDocument(_model.locationToEdit!.reference),
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
                                                                                          final columnLocationsRecord = snapshot.data!;
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              TextFormField(
                                                                                                controller: _model.emailAddressController7 ??= TextEditingController(
                                                                                                  text: columnLocationsRecord.website,
                                                                                                ),
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'gq83apb1' /* Website URL */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: Color(0xFF57636C),
                                                                                                        fontSize: 14.0,
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
                                                                                                      color: Color(0x00000000),
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
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                                maxLines: null,
                                                                                                validator: _model.emailAddressController7Validator.asValidator(context),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                                child: TextFormField(
                                                                                                  controller: _model.emailAddressController8 ??= TextEditingController(
                                                                                                    text: columnLocationsRecord.phone?.toString(),
                                                                                                  ),
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                                      'c0h09gsn' /* Phone */,
                                                                                                    ),
                                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: Color(0xFF57636C),
                                                                                                          fontSize: 14.0,
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
                                                                                                        color: Color(0x00000000),
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
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                  maxLines: null,
                                                                                                  keyboardType: TextInputType.number,
                                                                                                  validator: _model.emailAddressController8Validator.asValidator(context),
                                                                                                  inputFormatters: [
                                                                                                    _model.emailAddressMask8
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                                child: TextFormField(
                                                                                                  controller: _model.emailAddressController9 ??= TextEditingController(
                                                                                                    text: columnLocationsRecord.mail,
                                                                                                  ),
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                                      'kbvto1x8' /* Email */,
                                                                                                    ),
                                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: Color(0xFF57636C),
                                                                                                          fontSize: 14.0,
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
                                                                                                        color: Color(0x00000000),
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
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                  maxLines: null,
                                                                                                  keyboardType: TextInputType.emailAddress,
                                                                                                  validator: _model.emailAddressController9Validator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    if (_model.editing == 'locationBullet')
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: StreamBuilder<LocationsRecord>(
                                                                                          stream: LocationsRecord.getDocument(_model.locationToEdit!.reference),
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
                                                                                            final columnLocationsRecord = snapshot.data!;
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Builder(
                                                                                                  builder: (context) {
                                                                                                    final bullets = columnLocationsRecord.bullet!.toList();
                                                                                                    return ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: bullets.length,
                                                                                                      itemBuilder: (context, bulletsIndex) {
                                                                                                        final bulletsItem = bullets[bulletsIndex];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: MediaQuery.of(context).size.width * 0.67,
                                                                                                                constraints: BoxConstraints(
                                                                                                                  maxHeight: 40.0,
                                                                                                                ),
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: AutoSizeText(
                                                                                                                  bulletsItem,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                ),
                                                                                                              ),
                                                                                                              InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  final locationsUpdateData = {
                                                                                                                    'bullet': FieldValue.arrayRemove([bulletsItem]),
                                                                                                                  };
                                                                                                                  await _model.locationToEdit!.reference.update(locationsUpdateData);
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.delete,
                                                                                                                  color: Colors.black,
                                                                                                                  size: 30.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                Form(
                                                                                                  key: _model.formKey2,
                                                                                                  autovalidateMode: AutovalidateMode.disabled,
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        TextFormField(
                                                                                                          controller: _model.emailAddressController10,
                                                                                                          autofocus: true,
                                                                                                          obscureText: false,
                                                                                                          decoration: InputDecoration(
                                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                                              '2kbyjnsd' /* Add item */,
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
                                                                                                                color: Color(0x00000000),
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
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                          maxLines: null,
                                                                                                          validator: _model.emailAddressController10Validator.asValidator(context),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                          child: FlutterFlowIconButton(
                                                                                                            borderColor: Colors.transparent,
                                                                                                            borderRadius: 32.0,
                                                                                                            borderWidth: 1.0,
                                                                                                            buttonSize: 58.0,
                                                                                                            fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                            icon: FaIcon(
                                                                                                              FontAwesomeIcons.solidSave,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              size: 30.0,
                                                                                                            ),
                                                                                                            onPressed: () async {
                                                                                                              if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                                                return;
                                                                                                              }

                                                                                                              final locationsUpdateData = {
                                                                                                                'bullet': FieldValue.arrayUnion([
                                                                                                                  _model.emailAddressController10.text
                                                                                                                ]),
                                                                                                              };
                                                                                                              await columnLocationsRecord.reference.update(locationsUpdateData);
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    if (_model.editing == 'locationLocation')
                                                                                      StreamBuilder<LocationsRecord>(
                                                                                        stream: LocationsRecord.getDocument(_model.locationToEdit!.reference),
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
                                                                                          final columnLocationsRecord = snapshot.data!;
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              FlutterFlowPlacePicker(
                                                                                                iOSGoogleMapsApiKey: 'AIzaSyAD3m0KLiLYk9B8XspEEvIdGTuoj5pgbvI',
                                                                                                androidGoogleMapsApiKey: 'AIzaSyD2XvHRL9NHdgx6a4jNyPKPKjUKKfLoN0I',
                                                                                                webGoogleMapsApiKey: 'AIzaSyBboeB5b9WGL_M7qMopmvLPEepi74rOHWk',
                                                                                                onSelect: (place) async {
                                                                                                  setState(() => _model.placePickerValue = place);
                                                                                                },
                                                                                                defaultText: FFLocalizations.of(context).getText(
                                                                                                  'tuybig44' /* Select Location */,
                                                                                                ),
                                                                                                icon: Icon(
                                                                                                  Icons.place,
                                                                                                  color: Colors.white,
                                                                                                  size: 30.0,
                                                                                                ),
                                                                                                buttonOptions: FFButtonOptions(
                                                                                                  width: double.infinity,
                                                                                                  height: 50.0,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        fontSize: 18.0,
                                                                                                      ),
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                ),
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    _model.placePickerValue.address,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                                child: TextFormField(
                                                                                                  controller: _model.emailAddressController11 ??= TextEditingController(
                                                                                                    text: columnLocationsRecord.directions,
                                                                                                  ),
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                                      'n0hvrrl4' /* Directions URL (on Google Maps... */,
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
                                                                                                        color: Color(0x00000000),
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
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                  maxLines: null,
                                                                                                  validator: _model.emailAddressController11Validator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ldbang37' /* To get the directions URL, go ... */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    if (_model.editing == 'programOverview')
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          StreamBuilder<ProgramsRecord>(
                                                                                            stream: ProgramsRecord.getDocument(_model.programToEdit!.reference),
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
                                                                                              final wrapProgramsRecord = snapshot.data!;
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
                                                                                                  TextFormField(
                                                                                                    controller: _model.emailAddressController12 ??= TextEditingController(
                                                                                                      text: wrapProgramsRecord.type,
                                                                                                    ),
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                                        '8o31vn7h' /* Program type */,
                                                                                                      ),
                                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: Color(0xFF57636C),
                                                                                                            fontSize: 14.0,
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
                                                                                                          color: Color(0x00000000),
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
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                    maxLines: null,
                                                                                                    validator: _model.emailAddressController12Validator.asValidator(context),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.emailAddressController13 ??= TextEditingController(
                                                                                                        text: wrapProgramsRecord.description,
                                                                                                      ),
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: FFLocalizations.of(context).getText(
                                                                                                          'dr8p2nax' /* Description */,
                                                                                                        ),
                                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: Color(0xFF57636C),
                                                                                                              fontSize: 14.0,
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
                                                                                                            color: Color(0x00000000),
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
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                      maxLines: null,
                                                                                                      validator: _model.emailAddressController13Validator.asValidator(context),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'm7ydhcyp' /* Categories */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleLarge,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: StreamBuilder<List<CategoryRecord>>(
                                                                                              stream: queryCategoryRecord(
                                                                                                queryBuilder: (categoryRecord) => categoryRecord.where('isinmap', isEqualTo: true),
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
                                                                                                List<CategoryRecord> listViewCategoryRecordList = snapshot.data!;
                                                                                                return ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  shrinkWrap: true,
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: listViewCategoryRecordList.length,
                                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                                    final listViewCategoryRecord = listViewCategoryRecordList[listViewIndex];
                                                                                                    return Theme(
                                                                                                      data: ThemeData(
                                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(25),
                                                                                                          ),
                                                                                                        ),
                                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                                      ),
                                                                                                      child: CheckboxListTile(
                                                                                                        value: _model.checkboxListTileValueMap3[listViewCategoryRecord] ??= _model.programToEdit!.category!.toList().contains(listViewCategoryRecord.title),
                                                                                                        onChanged: (newValue) async {
                                                                                                          setState(() => _model.checkboxListTileValueMap3[listViewCategoryRecord] = newValue!);
                                                                                                        },
                                                                                                        title: Text(
                                                                                                          listViewCategoryRecord.title!,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                        tileColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                        dense: false,
                                                                                                        controlAffinity: ListTileControlAffinity.trailing,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    if (_model.editing == 'programWebsite')
                                                                                      StreamBuilder<ProgramsRecord>(
                                                                                        stream: ProgramsRecord.getDocument(_model.programToEdit!.reference),
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
                                                                                          final emailAddressProgramsRecord = snapshot.data!;
                                                                                          return TextFormField(
                                                                                            controller: _model.emailAddressController14 ??= TextEditingController(
                                                                                              text: emailAddressProgramsRecord.website,
                                                                                            ),
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                                '9k5rskrx' /* Website URL */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: Color(0xFF57636C),
                                                                                                    fontSize: 14.0,
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
                                                                                                  color: Color(0x00000000),
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
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                            maxLines: null,
                                                                                            validator: _model.emailAddressController14Validator.asValidator(context),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    if (_model.editing == 'programNames')
                                                                                      StreamBuilder<ProgramsRecord>(
                                                                                        stream: ProgramsRecord.getDocument(_model.programToEdit!.reference),
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
                                                                                          final emailAddressProgramsRecord = snapshot.data!;
                                                                                          return TextFormField(
                                                                                            controller: _model.emailAddressController15 ??= TextEditingController(
                                                                                              text: emailAddressProgramsRecord.name != null && emailAddressProgramsRecord.name != '' ? emailAddressProgramsRecord.name : '',
                                                                                            ),
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                                '4hf9809q' /* Program name  */,
                                                                                              ),
                                                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: Color(0xFF57636C),
                                                                                                    fontSize: 14.0,
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
                                                                                                  color: Color(0x00000000),
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
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                            maxLines: null,
                                                                                            validator: _model.emailAddressController15Validator.asValidator(context),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    if (widget.editing == 'programDate')
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          StreamBuilder<ProgramsRecord>(
                                                                                            stream: ProgramsRecord.getDocument(_model.programToEdit!.reference),
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
                                                                                              final listViewProgramsRecord = snapshot.data!;
                                                                                              return Builder(
                                                                                                builder: (context) {
                                                                                                  final dates = listViewProgramsRecord.dates!.toList();
                                                                                                  return ListView.builder(
                                                                                                    padding: EdgeInsets.zero,
                                                                                                    shrinkWrap: true,
                                                                                                    scrollDirection: Axis.vertical,
                                                                                                    itemCount: dates.length,
                                                                                                    itemBuilder: (context, datesIndex) {
                                                                                                      final datesItem = dates[datesIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              dateTimeFormat(
                                                                                                                'M/d h:mm a',
                                                                                                                datesItem,
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                final programsUpdateData = {
                                                                                                                  'dates': FieldValue.arrayRemove([datesItem]),
                                                                                                                };
                                                                                                                await listViewProgramsRecord.reference.update(programsUpdateData);
                                                                                                              },
                                                                                                              child: Icon(
                                                                                                                Icons.delete,
                                                                                                                color: Colors.black,
                                                                                                                size: 25.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                final _datePickedDate = await showDatePicker(
                                                                                                  context: context,
                                                                                                  initialDate: getCurrentTimestamp,
                                                                                                  firstDate: getCurrentTimestamp,
                                                                                                  lastDate: DateTime(2050),
                                                                                                );

                                                                                                TimeOfDay? _datePickedTime;
                                                                                                if (_datePickedDate != null) {
                                                                                                  _datePickedTime = await showTimePicker(
                                                                                                    context: context,
                                                                                                    initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                                  );
                                                                                                }

                                                                                                if (_datePickedDate != null && _datePickedTime != null) {
                                                                                                  setState(() {
                                                                                                    _model.datePicked = DateTime(
                                                                                                      _datePickedDate.year,
                                                                                                      _datePickedDate.month,
                                                                                                      _datePickedDate.day,
                                                                                                      _datePickedTime!.hour,
                                                                                                      _datePickedTime.minute,
                                                                                                    );
                                                                                                  });
                                                                                                }

                                                                                                final programsUpdateData = {
                                                                                                  'dates': FieldValue.arrayUnion([_model.datePicked]),
                                                                                                };
                                                                                                await _model.programToEdit!.reference.update(programsUpdateData);
                                                                                              },
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'hf5zau3h' /* Add date */,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                width: double.infinity,
                                                                                                height: 50.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                        ],
                                                                                      ),
                                                                                    if ((_model.editing == 'locationPeople') || (_model.editing == 'programPeople'))
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, -4.83),
                                                                                        child: StreamBuilder<List<UserRecord>>(
                                                                                          stream: queryUserRecord(
                                                                                            queryBuilder: (userRecord) => userRecord.where('isRefugee', isEqualTo: false),
                                                                                            limit: 5,
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
                                                                                            List<UserRecord> columnUserRecordList = snapshot.data!;
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: List.generate(columnUserRecordList.length, (columnIndex) {
                                                                                                final columnUserRecord = columnUserRecordList[columnIndex];
                                                                                                return Card(
                                                                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(25.0),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          width: 50.0,
                                                                                                          height: 50.0,
                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                          decoration: BoxDecoration(
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: Image.network(
                                                                                                            columnUserRecord.photoUrl != null && columnUserRecord.photoUrl != '' ? columnUserRecord.photoUrl! : 'https://picsum.photos/seed/862/600',
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Theme(
                                                                                                          data: ThemeData(
                                                                                                            checkboxTheme: CheckboxThemeData(
                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                borderRadius: BorderRadius.circular(25),
                                                                                                              ),
                                                                                                            ),
                                                                                                            unselectedWidgetColor: FlutterFlowTheme.of(context).accent2,
                                                                                                          ),
                                                                                                          child: CheckboxListTile(
                                                                                                            value: _model.checkboxListTileValueMap4[columnUserRecord] ??= _model.editing == 'locationPeople' ? _model.locationToEdit!.people!.toList().contains(columnUserRecord.name) : _model.programToEdit!.people!.toList().contains(columnUserRecord.name),
                                                                                                            onChanged: (newValue) async {
                                                                                                              setState(() => _model.checkboxListTileValueMap4[columnUserRecord] = newValue!);
                                                                                                            },
                                                                                                            title: Text(
                                                                                                              columnUserRecord.name!,
                                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontSize: 20.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            subtitle: Text(
                                                                                                              columnUserRecord.displayName!,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                            dense: false,
                                                                                                            controlAffinity: ListTileControlAffinity.trailing,
                                                                                                          ),
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
                                                                                    if (_model.editing == 'locationNew')
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 200.0),
                                                                                        child: TextFormField(
                                                                                          controller: _model.emailAddress1Controller,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              'nwhmhuzs' /* Location name */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: Color(0xFF57636C),
                                                                                                  fontSize: 14.0,
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
                                                                                                color: Color(0x00000000),
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
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                          maxLines: null,
                                                                                          validator: _model.emailAddress1ControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                    if (_model.editing == 'programNew')
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 200.0),
                                                                                        child: TextFormField(
                                                                                          controller: _model.emailAddressController16,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: FFLocalizations.of(context).getText(
                                                                                              '2s9zlvnq' /* Location name */,
                                                                                            ),
                                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: Color(0xFF57636C),
                                                                                                  fontSize: 14.0,
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
                                                                                                color: Color(0x00000000),
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
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                          maxLines: null,
                                                                                          validator: _model.emailAddressController16Validator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  if (_model.editing == 'locationName') {
                                                                                    final locationsUpdateData1 = createLocationsRecordData(
                                                                                      name: _model.emailAddressController4.text,
                                                                                    );
                                                                                    await _model.locationToEdit!.reference.update(locationsUpdateData1);
                                                                                  } else {
                                                                                    if (_model.editing == 'locationOverview') {
                                                                                      final locationsUpdateData2 = {
                                                                                        ...createLocationsRecordData(
                                                                                          type: _model.emailAddressController5.text,
                                                                                          description: _model.emailAddressController6.text,
                                                                                        ),
                                                                                        'category': _model.checkboxListTileCheckedItems2.map((e) => e.title).withoutNulls.toList(),
                                                                                      };
                                                                                      await _model.locationToEdit!.reference.update(locationsUpdateData2);
                                                                                    } else {
                                                                                      if (_model.editing == 'locationContact') {
                                                                                        final locationsUpdateData3 = createLocationsRecordData(
                                                                                          phone: int.tryParse(_model.emailAddressController8.text),
                                                                                          website: '',
                                                                                          mail: _model.emailAddressController9.text,
                                                                                        );
                                                                                        await _model.locationToEdit!.reference.update(locationsUpdateData3);
                                                                                      } else {
                                                                                        if (_model.editing == 'locationContact') {
                                                                                          final locationsUpdateData4 = createLocationsRecordData(
                                                                                            phone: int.tryParse(_model.emailAddressController8.text),
                                                                                            website: '',
                                                                                            mail: _model.emailAddressController9.text,
                                                                                          );
                                                                                          await _model.locationToEdit!.reference.update(locationsUpdateData4);
                                                                                        } else {
                                                                                          if (_model.editing == 'locationLocation') {
                                                                                            final locationsUpdateData5 = createLocationsRecordData(
                                                                                              coordinates: _model.placePickerValue.latLng,
                                                                                              directions: _model.emailAddressController11.text,
                                                                                              address: _model.placePickerValue.address,
                                                                                            );
                                                                                            await _model.locationToEdit!.reference.update(locationsUpdateData5);
                                                                                          } else {
                                                                                            if (_model.editing == 'programOverview') {
                                                                                              final programsUpdateData1 = {
                                                                                                ...createProgramsRecordData(
                                                                                                  type: _model.emailAddressController5.text,
                                                                                                  description: _model.emailAddressController13.text,
                                                                                                ),
                                                                                                'category': _model.checkboxListTileCheckedItems3.map((e) => e.title).withoutNulls.toList(),
                                                                                              };
                                                                                              await _model.programToEdit!.reference.update(programsUpdateData1);
                                                                                            } else {
                                                                                              if (_model.editing == 'programPeople') {
                                                                                                final programsUpdateData2 = {
                                                                                                  'people': _model.checkboxListTileCheckedItems4.map((e) => e.name).withoutNulls.toList(),
                                                                                                };
                                                                                                await _model.programToEdit!.reference.update(programsUpdateData2);
                                                                                              } else {
                                                                                                if (_model.editing == 'locationPeople') {
                                                                                                  final locationsUpdateData6 = {
                                                                                                    'people': _model.checkboxListTileCheckedItems4.map((e) => e.name).withoutNulls.toList(),
                                                                                                  };
                                                                                                  await _model.locationToEdit!.reference.update(locationsUpdateData6);
                                                                                                } else {
                                                                                                  if (_model.editing == 'locationNew') {
                                                                                                    final locationsCreateData = createLocationsRecordData(
                                                                                                      name: _model.emailAddress1Controller.text,
                                                                                                    );
                                                                                                    await LocationsRecord.collection.doc().set(locationsCreateData);
                                                                                                  } else {
                                                                                                    if (_model.editing == 'programNew') {
                                                                                                      final programsCreateData = createProgramsRecordData(
                                                                                                        name: _model.emailAddressController15.text,
                                                                                                      );
                                                                                                      await ProgramsRecord.createDoc(_model.parentLocation!.reference).set(programsCreateData);
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }

                                                                                  setState(() {
                                                                                    _model.editing = 'false';
                                                                                  });
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'lan6xnig' /* Save changes */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: 50.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        55.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(20.0),
                                                                        topRight:
                                                                            Radius.circular(20.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -0.95,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.editing = 'false';
                                                                            });
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.close_rounded,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              if (_model.isJoin ?? true)
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 150.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 60.0,
                                                icon: Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 30.0,
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    _model.isJoin = false;
                                                  });
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 60.0, 0.0, 40.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'm7nesi1z' /* Join organization */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final userOrganizations =
                                                    blurOrganizationsRecordList
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      userOrganizations.length,
                                                  itemBuilder: (context,
                                                      userOrganizationsIndex) {
                                                    final userOrganizationsItem =
                                                        userOrganizations[
                                                            userOrganizationsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
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
                                                          setState(() {
                                                            _model.organizationSelected =
                                                                userOrganizationsItem
                                                                    .name;
                                                            _model.isJoin =
                                                                false;
                                                          });

                                                          final organizationsUpdateData =
                                                              {
                                                            'people': FieldValue
                                                                .arrayUnion([
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.name,
                                                                  '')
                                                            ]),
                                                          };
                                                          await userOrganizationsItem
                                                              .reference
                                                              .update(
                                                                  organizationsUpdateData);
                                                        },
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
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  StreamBuilder<
                                                                      List<
                                                                          OrganizationsRecord>>(
                                                                    stream:
                                                                        queryOrganizationsRecord(
                                                                      queryBuilder: (organizationsRecord) => organizationsRecord.where(
                                                                          'name',
                                                                          isEqualTo:
                                                                              _model.organizationSelected),
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
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<OrganizationsRecord>
                                                                          imageOrganizationsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Return an empty Container when the item does not exist.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container();
                                                                      }
                                                                      final imageOrganizationsRecord = imageOrganizationsRecordList
                                                                              .isNotEmpty
                                                                          ? imageOrganizationsRecordList
                                                                              .first
                                                                          : null;
                                                                      return ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        child: Image
                                                                            .network(
                                                                          imageOrganizationsRecord!
                                                                              .logoPath!,
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      userOrganizationsItem
                                                                          .name!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
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
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.helperNavBarModel,
                              updateCallback: () => setState(() {}),
                              child: HelperNavBarWidget(),
                            ),
                          ),
                        ],
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
