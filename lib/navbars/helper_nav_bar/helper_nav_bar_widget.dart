import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'helper_nav_bar_model.dart';
export 'helper_nav_bar_model.dart';

class HelperNavBarWidget extends StatefulWidget {
  const HelperNavBarWidget({Key? key}) : super(key: key);

  @override
  _HelperNavBarWidgetState createState() => _HelperNavBarWidgetState();
}

class _HelperNavBarWidgetState extends State<HelperNavBarWidget> {
  late HelperNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelperNavBarModel());

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
                  FontAwesomeIcons.pen,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.pushNamed('helperEdit');
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                icon: FaIcon(
                  FontAwesomeIcons.solidBuilding,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'helperOrganization',
                    queryParams: {
                      'locationToEdit': serializeParam(
                        null,
                        ParamType.Document,
                      ),
                      'editing': serializeParam(
                        'false',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'locationToEdit': null,
                    },
                  );
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 40.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                icon: Icon(
                  Icons.chat_bubble_outlined,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.pushNamed('helperChat');
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
                  context.pushNamed('helperProfile');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
