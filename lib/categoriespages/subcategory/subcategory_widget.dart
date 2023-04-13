import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subcategory_model.dart';
export 'subcategory_model.dart';

class SubcategoryWidget extends StatefulWidget {
  const SubcategoryWidget({
    Key? key,
    this.subcategorydetail,
  }) : super(key: key);

  final DocumentReference? subcategorydetail;

  @override
  _SubcategoryWidgetState createState() => _SubcategoryWidgetState();
}

class _SubcategoryWidgetState extends State<SubcategoryWidget> {
  late SubcategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubcategoryModel());

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
    return StreamBuilder<SubcategoryRecord>(
      stream: SubcategoryRecord.getDocument(widget.subcategorydetail!),
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
        final subcategorySubcategoryRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Align(
                alignment: AlignmentDirectional(-0.95, 0.0),
                child: Text(
                  subcategorySubcategoryRecord.name!,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                ),
              ),
              actions: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('settings');
                      },
                      child: FaIcon(
                        FontAwesomeIcons.cog,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 4.0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2svqgjx9' /* Note, by clicking on any of th... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                          ),
                          if (subcategorySubcategoryRecord.information != '')
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: Text(
                                  subcategorySubcategoryRecord.information!,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    StreamBuilder<List<ResourceproviderRecord>>(
                      stream: queryResourceproviderRecord(
                        queryBuilder: (resourceproviderRecord) =>
                            resourceproviderRecord.where('subcategory',
                                isEqualTo:
                                    subcategorySubcategoryRecord.reference.id),
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
                        List<ResourceproviderRecord>
                            columnResourceproviderRecordList = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnResourceproviderRecordList.length,
                              (columnIndex) {
                            final columnResourceproviderRecord =
                                columnResourceproviderRecordList[columnIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: InkWell(
                                onTap: () async {
                                  await launchURL(
                                      columnResourceproviderRecord.link!);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 5.0),
                                        child: Text(
                                          columnResourceproviderRecord.name!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          columnResourceproviderRecord
                                              .information!,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
        );
      },
    );
  }
}
