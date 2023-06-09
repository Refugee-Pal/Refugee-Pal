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
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsAccInfoModel());

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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<LanguagesRecord>>(
        stream: queryLanguagesRecord(
          queryBuilder: (languagesRecord) => languagesRecord.where('Name',
              isEqualTo: valueOrDefault(currentUserDocument?.language, '')),
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
                    '78hdnm2w' /* Personal Information */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
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
                                alignment: AlignmentDirectional(-0.95, 0.0),
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
                                  List<Translations11Record>
                                      dropDownTranslations11RecordList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController1 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue1 ??=
                                          (settingsAccInfoLanguagesRecord!
                                                          .name !=
                                                      'English') &&
                                                  (valueOrDefault(
                                                          currentUserDocument
                                                              ?.translateApp,
                                                          '') ==
                                                      'true')
                                              ? dropDownTranslations11RecordList
                                                  .where((e) =>
                                                      e.reference.id ==
                                                      settingsAccInfoLanguagesRecord!
                                                          .code)
                                                  .toList()
                                                  .first
                                                  .value
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
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
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
                                    searchHintText: '',
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
                                  );
                                },
                              ),
                            if (valueOrDefault(
                                    currentUserDocument?.isRefugee, '') ==
                                'false')
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0.0),
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
                                            (settingsAccInfoLanguagesRecord!
                                                            .name !=
                                                        'English') &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.translateApp,
                                                            '') ==
                                                        'true')
                                                ? dropDownTranslations14RecordList
                                                    .where((e) =>
                                                        e.reference.id ==
                                                        settingsAccInfoLanguagesRecord!
                                                            .code)
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
                                      searchHintTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge,
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
                                      searchHintText: '',
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
                                    );
                                  },
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(-0.95, 0.0),
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
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController3 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue3 ??= valueOrDefault(
                                      currentUserDocument?.language, ''),
                                ),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'hpnw8yu4' /* English */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'd04pzwmc' /* Farsi */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'b6jpewfb' /* Pashto */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'qp75pzrn' /* Arabic */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'm0n2i0eo' /* Ukrainian */,
                                  )
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue3 = val),
                                width: double.infinity,
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context).labelLarge,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '4vawf6sw' /* Language */,
                                ),
                                searchHintText: '',
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: SwitchListTile.adaptive(
                                value: _model.switchListTileValue ??= true,
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
                              alignment: AlignmentDirectional(-1.0, 0.0),
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
                                          List<Translations7Record>>(
                                        stream: queryTranslations7Record(
                                          parent:
                                              listViewCategoryRecord.reference,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<Translations7Record>
                                              checkboxListTileTranslations7RecordList =
                                              snapshot.data!;
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
                                                  (settingsAccInfoLanguagesRecord!
                                                                  .name !=
                                                              'English') &&
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.translateApp,
                                                                  '') ==
                                                              'true')
                                                      ? checkboxListTileTranslations7RecordList
                                                          .where((e) =>
                                                              e.reference.id ==
                                                              settingsAccInfoLanguagesRecord!
                                                                  .code)
                                                          .toList()
                                                          .first
                                                          .value
                                                      : listViewCategoryRecord
                                                          .title,
                                                  'no value',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
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
                                    final userUpdateData1 = {
                                      ...createUserRecordData(
                                        language: _model.dropDownValue3,
                                        refugeeStatus: _model.dropDownValue1,
                                      ),
                                      'areasOfInterest': _model
                                          .checkboxListTileCheckedItems
                                          .map((e) => e.title)
                                          .withoutNulls
                                          .toList(),
                                    };
                                    await currentUserReference!
                                        .update(userUpdateData1);
                                  } else {
                                    final userUpdateData2 = {
                                      ...createUserRecordData(
                                        language: _model.dropDownValue3,
                                        displayName: _model.dropDownValue2,
                                      ),
                                      'areasOfInterest': _model
                                          .checkboxListTileCheckedItems
                                          .map((e) => e.title)
                                          .withoutNulls
                                          .toList(),
                                    };
                                    await currentUserReference!
                                        .update(userUpdateData2);
                                  }

                                  if (_model.switchListTileValue!) {
                                    setAppLanguage(
                                        context, _model.dropDownValue3!);

                                    final userUpdateData3 =
                                        createUserRecordData(
                                      translateApp: 'true',
                                    );
                                    await currentUserReference!
                                        .update(userUpdateData3);
                                  } else {
                                    setAppLanguage(context, 'en');

                                    final userUpdateData4 =
                                        createUserRecordData(
                                      translateApp: 'false',
                                    );
                                    await currentUserReference!
                                        .update(userUpdateData4);
                                  }

                                  context.pushNamed('settings');
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
