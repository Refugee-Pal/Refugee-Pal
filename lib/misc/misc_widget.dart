import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'misc_model.dart';
export 'misc_model.dart';

class MiscWidget extends StatefulWidget {
  const MiscWidget({Key? key}) : super(key: key);

  @override
  _MiscWidgetState createState() => _MiscWidgetState();
}

class _MiscWidgetState extends State<MiscWidget> {
  late MiscModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiscModel());

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
            buttonSize: 65.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 35.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'qfx7kuwh' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  fontSize: 18.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => FlutterFlowDropDown<String>(
                    controller: _model.dropDownController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??=
                          valueOrDefault(currentUserDocument?.language, ''),
                    ),
                    options: [
                      FFLocalizations.of(context).getText(
                        'dhb40tno' /* English */,
                      ),
                      FFLocalizations.of(context).getText(
                        'crlqtvx8' /* Farsi */,
                      ),
                      FFLocalizations.of(context).getText(
                        'tlta33fp' /* Pashto */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hwct04bu' /* Arabic */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xuz0sy0h' /* Ukrainian */,
                      )
                    ],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue = val),
                    width: double.infinity,
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).labelLarge,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'nxu1vczs' /* Language */,
                    ),
                    searchHintText: '',
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
