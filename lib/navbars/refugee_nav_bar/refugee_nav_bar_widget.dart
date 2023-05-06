import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'refugee_nav_bar_model.dart';
export 'refugee_nav_bar_model.dart';

class RefugeeNavBarWidget extends StatefulWidget {
  const RefugeeNavBarWidget({Key? key}) : super(key: key);

  @override
  _RefugeeNavBarWidgetState createState() => _RefugeeNavBarWidgetState();
}

class _RefugeeNavBarWidgetState extends State<RefugeeNavBarWidget> {
  late RefugeeNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefugeeNavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(0.0, -10.0),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                icon: FaIcon(
                  FontAwesomeIcons.solidCompass,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.pushNamed('home');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                icon: FaIcon(
                  FontAwesomeIcons.book,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.pushNamed('categoriesgallery');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                icon: FaIcon(
                  FontAwesomeIcons.mapMarkedAlt,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.pushNamed('map');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'connect',
                    queryParams: {
                      'professionToLoad': serializeParam(
                        'none',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
