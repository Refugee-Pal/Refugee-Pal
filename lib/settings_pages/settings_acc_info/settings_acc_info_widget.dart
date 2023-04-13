import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '62c6fehh' /* Personal Info */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowDropDown<String>(
                        controller: _model.dropDownController1 ??=
                            FormFieldController<String>(
                          _model.dropDownValue1 ??= valueOrDefault(
                              currentUserDocument?.refugeeStatus, ''),
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
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue1 = val),
                        width: double.infinity,
                        height: 50.0,
                        searchHintTextStyle:
                            FlutterFlowTheme.of(context).labelLarge,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'hf6zfi4z' /* Refugee Status */,
                        ),
                        searchHintText: '',
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
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
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowDropDown<String>(
                        controller: _model.dropDownController2 ??=
                            FormFieldController<String>(
                          _model.dropDownValue2 ??=
                              valueOrDefault(currentUserDocument?.language, ''),
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
                            setState(() => _model.dropDownValue2 = val),
                        width: double.infinity,
                        height: 50.0,
                        searchHintTextStyle:
                            FlutterFlowTheme.of(context).labelLarge,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          '4vawf6sw' /* Language */,
                        ),
                        searchHintText: '',
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
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
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: FlutterFlowLanguageSelector(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50.0,
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      borderColor: Colors.transparent,
                      dropdownIconColor: Colors.white,
                      borderRadius: 0.0,
                      textStyle: GoogleFonts.getFont(
                        'Inter',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                      hideFlags: false,
                      flagSize: 24.0,
                      flagTextGap: 8.0,
                      currentLanguage: FFLocalizations.of(context).languageCode,
                      languages: FFLocalizations.languages(),
                      onChanged: (lang) => setAppLanguage(context, lang),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: SwitchListTile.adaptive(
                      value: _model.switchListTileValue ??= true,
                      onChanged: (newValue) async {
                        setState(() => _model.switchListTileValue = newValue!);
                      },
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'fes6rmrc' /* Translate the app for me */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18.0,
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 10.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ppkdvsq2' /* Main Challenges */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium,
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
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<CategoryRecord> listViewCategoryRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCategoryRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCategoryRecord =
                              listViewCategoryRecordList[listViewIndex];
                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) => Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context).accent2,
                                ),
                                child: CheckboxListTile(
                                  value: _model.checkboxListTileValueMap[
                                          listViewCategoryRecord] ??=
                                      (currentUserDocument?.areasOfInterest
                                                  ?.toList() ??
                                              [])
                                          .contains(
                                              listViewCategoryRecord.title),
                                  onChanged: (newValue) async {
                                    setState(() => _model
                                            .checkboxListTileValueMap[
                                        listViewCategoryRecord] = newValue!);
                                  },
                                  title: Text(
                                    listViewCategoryRecord.title!,
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 25.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final userUpdateData = {
                          ...createUserRecordData(
                            language: _model.dropDownValue2,
                            translateApp: _model.switchListTileValue,
                            refugeeStatus: _model.dropDownValue1,
                          ),
                          'areasOfInterest': _model.checkboxListTileCheckedItems
                              .map((e) => e.title)
                              .withoutNulls
                              .toList(),
                        };
                        await currentUserReference!.update(userUpdateData);

                        context.pushNamed('settings');
                      },
                      text: FFLocalizations.of(context).getText(
                        'iu08vel5' /* Save Changes */,
                      ),
                      options: FFButtonOptions(
                        width: 225.0,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
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
          ),
        ),
      ),
    );
  }
}
