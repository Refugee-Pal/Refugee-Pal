import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_answers_yet_model.dart';
export 'no_answers_yet_model.dart';

class NoAnswersYetWidget extends StatefulWidget {
  const NoAnswersYetWidget({Key? key}) : super(key: key);

  @override
  _NoAnswersYetWidgetState createState() => _NoAnswersYetWidgetState();
}

class _NoAnswersYetWidgetState extends State<NoAnswersYetWidget> {
  late NoAnswersYetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoAnswersYetModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Text(
          FFLocalizations.of(context).getText(
            'v86w8so2' /* No answers yet */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
