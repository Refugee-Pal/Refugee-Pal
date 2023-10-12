import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_acc_info_model.dart';
export 'settings_acc_info_model.dart';

class SettingsAccInfoWidget extends StatefulWidget {
  const SettingsAccInfoWidget({Key? key}) : super(key: key);

  @override
  _SettingsAccInfoWidgetState createState() => _SettingsAccInfoWidgetState();
}

class _SettingsAccInfoWidgetState extends State<SettingsAccInfoWidget> {
  late SettingsAccInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsAccInfoModel());

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
          List<LanguagesRecord> settingsAccInfoLanguagesRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final settingsAccInfoLanguagesRecord =
              settingsAccInfoLanguagesRecordList.isNotEmpty
                  ? settingsAccInfoLanguagesRecordList.first
                  : null;
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
                          '78hdnm2w' /* Personal Information */,
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
                      actions: [],
                      centerTitle: false,
                      elevation: 2.0,
                    )
                  : null,
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 0.0, 25.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 50.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '62c6fehh' /* Personal Info */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            if (valueOrDefault(
                                    currentUserDocument?.isRefugee, '') ==
                                'true')
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 5.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '1qcbh8zd' /* Refugee status */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                              ),
                            if (valueOrDefault(
                                        currentUserDocument?.refugeeStatus,
                                        '') !=
                                    null &&
                                valueOrDefault(
                                        currentUserDocument?.refugeeStatus,
                                        '') !=
                                    '')
                              StreamBuilder<List<Translations11Record>>(
                                stream: queryTranslations11Record(
                                  parent: currentUserReference,
                                  queryBuilder: (translations11Record) =>
                                      translations11Record.where(
                                    'language',
                                    isEqualTo:
                                        settingsAccInfoLanguagesRecord?.code,
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
                                  List<Translations11Record>
                                      dropDownTranslations11RecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final dropDownTranslations11Record =
                                      dropDownTranslations11RecordList
                                              .isNotEmpty
                                          ? dropDownTranslations11RecordList
                                              .first
                                          : null;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController1 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue1 ??=
                                          (settingsAccInfoLanguagesRecord
                                                          ?.name !=
                                                      'English') &&
                                                  (valueOrDefault(
                                                          currentUserDocument
                                                              ?.translateApp,
                                                          '') ==
                                                      'true')
                                              ? dropDownTranslations11Record
                                                  ?.value
                                              : valueOrDefault(
                                                  currentUserDocument
                                                      ?.refugeeStatus,
                                                  ''),
                                    ),
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        'hiinjdvx' /* Government Assisted (GAR) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '2wxov0vd' /* Private Sponsored (PSR) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '4vtiyluh' /* Blended Visa (BVOR) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '5fj02fub' /* Refugee Claimant */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue1 = val),
                                    width: double.infinity,
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'hf6zfi4z' /* Refugee Status */,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 0.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            if (valueOrDefault(
                                    currentUserDocument?.isRefugee, '') ==
                                'false')
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'qx5mmau9' /* Area of expertise */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                              ),
                            if (currentUserDisplayName != null &&
                                currentUserDisplayName != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child:
                                    StreamBuilder<List<Translations14Record>>(
                                  stream: queryTranslations14Record(
                                    parent: currentUserReference,
                                    limit: 1,
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
                                    List<Translations14Record>
                                        dropDownTranslations14RecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController2 ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue2 ??=
                                            (settingsAccInfoLanguagesRecord
                                                            ?.name !=
                                                        'English') &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.translateApp,
                                                            '') ==
                                                        'true')
                                                ? dropDownTranslations14RecordList
                                                    .where((e) =>
                                                        e.reference.id ==
                                                        settingsAccInfoLanguagesRecord
                                                            ?.code)
                                                    .toList()
                                                    .first
                                                    .value
                                                : currentUserDisplayName,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'zjkaov6a' /* Government Assisted (GAR) */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '62oc4av1' /* Private Sponsored (PSR) */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'ql1ldg46' /* Blended Visa (BVOR) */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'jvjbwde3' /* Refugee Claimant */,
                                        )
                                      ],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue2 = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'djm1uvc7' /* Area of expertise */,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 0.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(-0.95, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'yhkpimsd' /* Language */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: StreamBuilder<List<LanguagesRecord>>(
                                stream: queryLanguagesRecord(),
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
                                      dropDownLanguagesRecordList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController3 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue3 ??= valueOrDefault(
                                          currentUserDocument?.language, ''),
                                    ),
                                    options: dropDownLanguagesRecordList
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue3 = val),
                                    width: double.infinity,
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '4vawf6sw' /* Language */,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 0.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                            if (currentUserDocument?.dateArrived != null)
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '58shaoue' /* Date arrived in Canada */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                              ),
                            if (currentUserDocument?.dateArrived != null)
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    dateTimeFormat(
                                      'yMMMd',
                                      currentUserDocument!.dateArrived!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            if (valueOrDefault(
                                    currentUserDocument?.isRefugee, '') ==
                                'true')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: SwitchListTile.adaptive(
                                  value: _model
                                      .switchListTileValue ??= valueOrDefault(
                                              currentUserDocument?.translateApp,
                                              '') ==
                                          'true'
                                      ? true
                                      : false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.switchListTileValue = newValue!);
                                  },
                                  title: Text(
                                    FFLocalizations.of(context).getText(
                                      'fes6rmrc' /* Translate the app for me */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                        ),
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 25.0, 0.0, 10.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ppkdvsq2' /* Main Challenges */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                              ),
                            ),
                            FutureBuilder<List<CategoryRecord>>(
                              future: queryCategoryRecordOnce(),
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
                                List<CategoryRecord>
                                    listViewCategoryRecordList = snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewCategoryRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewCategoryRecord =
                                        listViewCategoryRecordList[
                                            listViewIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: StreamBuilder<
                                          List<Translations8Record>>(
                                        stream: queryTranslations8Record(
                                          parent:
                                              listViewCategoryRecord.reference,
                                          queryBuilder: (translations8Record) =>
                                              translations8Record.where(
                                            'language',
                                            isEqualTo:
                                                settingsAccInfoLanguagesRecord
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<Translations8Record>
                                              checkboxListTileTranslations8RecordList =
                                              snapshot.data!;
                                          final checkboxListTileTranslations8Record =
                                              checkboxListTileTranslations8RecordList
                                                      .isNotEmpty
                                                  ? checkboxListTileTranslations8RecordList
                                                      .first
                                                  : null;
                                          return Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
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
                                                valueOrDefault<String>(
                                                  (settingsAccInfoLanguagesRecord
                                                                  ?.name !=
                                                              'English') &&
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.translateApp,
                                                                  '') ==
                                                              'true')
                                                      ? checkboxListTileTranslations8Record
                                                          ?.value
                                                      : listViewCategoryRecord
                                                          .title,
                                                  'no value',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                        ),
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 40.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (valueOrDefault(
                                          currentUserDocument?.isRefugee, '') ==
                                      'true') {
                                    await currentUserReference!.update({
                                      ...createUserRecordData(
                                        language: _model.dropDownValue3,
                                        refugeeStatus: _model.dropDownValue1,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'areasOfInterest': _model
                                              .checkboxListTileCheckedItems
                                              .map((e) => e.title)
                                              .toList(),
                                        },
                                      ),
                                    });
                                  } else {
                                    await currentUserReference!.update({
                                      ...createUserRecordData(
                                        language: _model.dropDownValue3,
                                        displayName: _model.dropDownValue2,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'areasOfInterest': _model
                                              .checkboxListTileCheckedItems
                                              .map((e) => e.title)
                                              .toList(),
                                        },
                                      ),
                                    });
                                  }

                                  if (_model.switchListTileValue!) {
                                    setAppLanguage(
                                        context, _model.dropDownValue3!);

                                    await currentUserReference!
                                        .update(createUserRecordData(
                                      translateApp: 'true',
                                    ));
                                  } else {
                                    setAppLanguage(context, 'en');

                                    await currentUserReference!
                                        .update(createUserRecordData(
                                      translateApp: 'false',
                                    ));
                                  }

                                  context.safePop();
                                },
                                text: FFLocalizations.of(context).getText(
                                  'iu08vel5' /* Save Changes */,
                                ),
                                options: FFButtonOptions(
                                  width: 235.0,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
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
    );
  }
}
