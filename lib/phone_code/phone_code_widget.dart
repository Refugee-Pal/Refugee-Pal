import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_code_model.dart';
export 'phone_code_model.dart';

class PhoneCodeWidget extends StatefulWidget {
  const PhoneCodeWidget({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final int? phoneNumber;

  @override
  _PhoneCodeWidgetState createState() => _PhoneCodeWidgetState();
}

class _PhoneCodeWidgetState extends State<PhoneCodeWidget> {
  late PhoneCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneCodeModel());

    authManager.handlePhoneAuthStateChanges(context);
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 80.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'su6coj0g' /* Enter your verification code */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Inter',
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(44.0, 10.0, 44.0, 0.0),
                    child: Text(
                      'We sent you a text message at ${widget.phoneNumber.toString()}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      length: 6,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: true,
                      enablePinAutofill: false,
                      errorTextSpace: 0.0,
                      showCursor: true,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      obscureText: false,
                      hintCharacter: '-',
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 60.0,
                        fieldWidth: 60.0,
                        borderWidth: 2.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        inactiveColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        selectedColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        activeFillColor: FlutterFlowTheme.of(context).primary,
                        inactiveFillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        selectedFillColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (_) {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _model.pinCodeControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
              child: FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  final smsCodeVal = _model.pinCodeController!.text;
                  if (smsCodeVal == null || smsCodeVal.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter SMS verification code.'),
                      ),
                    );
                    return;
                  }
                  final phoneVerifiedUser = await authManager.verifySmsCode(
                    context: context,
                    smsCode: smsCodeVal,
                  );
                  if (phoneVerifiedUser == null) {
                    return;
                  }

                  if (valueOrDefault(currentUserDocument?.language, '') !=
                          null &&
                      valueOrDefault(currentUserDocument?.language, '') != '') {
                    context.goNamedAuth('home', context.mounted);
                  } else {
                    context.goNamedAuth('userjourney', context.mounted);
                  }
                },
                text: FFLocalizations.of(context).getText(
                  'mnyma7kj' /* Continue */,
                ),
                options: FFButtonOptions(
                  width: 180.0,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 21.5,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 160.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final phoneNumberVal = '+1${widget.phoneNumber?.toString()}';
                  if (phoneNumberVal == null ||
                      phoneNumberVal.isEmpty ||
                      !phoneNumberVal.startsWith('+')) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Phone Number is required and has to start with +.'),
                      ),
                    );
                    return;
                  }
                  await authManager.beginPhoneAuth(
                    context: context,
                    phoneNumber: phoneNumberVal,
                    onCodeSent: (context) async {
                      context.goNamedAuth(
                        'PhoneCode',
                        context.mounted,
                        queryParameters: {
                          'phoneNumber': serializeParam(
                            widget.phoneNumber,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                        ignoreRedirect: true,
                      );
                    },
                  );
                },
                child: Text(
                  FFLocalizations.of(context).getText(
                    'fldjvsun' /* Resend code */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
