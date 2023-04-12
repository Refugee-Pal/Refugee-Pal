import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'refugeepalwelcomescreen_model.dart';
export 'refugeepalwelcomescreen_model.dart';

class RefugeepalwelcomescreenWidget extends StatefulWidget {
  const RefugeepalwelcomescreenWidget({Key? key}) : super(key: key);

  @override
  _RefugeepalwelcomescreenWidgetState createState() =>
      _RefugeepalwelcomescreenWidgetState();
}

class _RefugeepalwelcomescreenWidgetState
    extends State<RefugeepalwelcomescreenWidget> with TickerProviderStateMixin {
  late RefugeepalwelcomescreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefugeepalwelcomescreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1E2429),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).primary
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(1.0, -1.0),
            end: AlignmentDirectional(-1.0, 1.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500.0,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 100.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.55),
                                  child: Image.asset(
                                    'assets/images/refugeeicon.png',
                                    width: 250.0,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation']!),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'a636luf0' /* Welcome to Refugee Pal */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 120.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ffm6jii0' /* An All in One App for Refugees */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation2']!),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'bxj3ytw3' /* Digital Resource Hub */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation3']!),
                                ),
                              ),
                              Image.asset(
                                'assets/images/undraw_search_app_oso2.png',
                                width: 300.0,
                                height: 300.0,
                                fit: BoxFit.contain,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.2),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'pcud7qmp' /* Our comprehensive library offe... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'tuuv8igp' /* Connect with Healthcare Profes... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation4']!),
                                ),
                              ),
                              Image.asset(
                                'assets/images/healthcare.png',
                                width: 300.0,
                                height: 300.0,
                                fit: BoxFit.contain,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.2),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5faocj4g' /* Find practicing doctors in Sur... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'whtqq13n' /* The Newcomer's Map */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation5']!),
                                ),
                              ),
                              Image.asset(
                                'assets/images/undraw_destination_re_sr74.png',
                                width: 300.0,
                                height: 300.0,
                                fit: BoxFit.contain,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.2),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'rhcs3963' /* Our map feature displays impor... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'y6sh2xxa' /* Q&A Chat Threads and Connect w... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation6']!),
                                ),
                              ),
                              Image.asset(
                                'assets/images/undraw_community_re_cyrm.png',
                                width: 300.0,
                                height: 300.0,
                                fit: BoxFit.contain,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.2),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ldju8z38' /* Ask questions and get answers ... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'z9xmaiwx' /* Accessibility for All */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation7']!),
                                ),
                              ),
                              Image.asset(
                                'assets/images/culture_and_community.png',
                                width: 300.0,
                                height: 300.0,
                                fit: BoxFit.contain,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.2),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '85yz6d8b' /* Our user-friendly design and m... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('home');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'peqbp5xz' /* Next */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 160.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.9),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 6,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 2.0,
                            spacing: 8.0,
                            radius: 16.0,
                            dotWidth: 16.0,
                            dotHeight: 16.0,
                            dotColor: Color(0xFF62C7E6),
                            activeDotColor: Colors.white,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
