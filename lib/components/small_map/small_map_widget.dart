import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'small_map_model.dart';
export 'small_map_model.dart';

class SmallMapWidget extends StatefulWidget {
  const SmallMapWidget({
    Key? key,
    required this.coords,
  }) : super(key: key);

  final LatLng? coords;

  @override
  _SmallMapWidgetState createState() => _SmallMapWidgetState();
}

class _SmallMapWidgetState extends State<SmallMapWidget> {
  late SmallMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallMapModel());

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

    return Builder(builder: (context) {
      final _googleMapMarker = widget.coords;
      return FlutterFlowGoogleMap(
        controller: _model.googleMapsController,
        onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
        initialLocation: _model.googleMapsCenter ??= widget.coords!,
        markers: [
          if (_googleMapMarker != null)
            FlutterFlowMarker(
              _googleMapMarker.serialize(),
              _googleMapMarker,
            ),
        ],
        markerColor: GoogleMarkerColor.azure,
        mapType: MapType.normal,
        style: GoogleMapStyle.silver,
        initialZoom: 11.0,
        allowInteraction: false,
        allowZoom: false,
        showZoomControls: false,
        showLocation: false,
        showCompass: false,
        showMapToolbar: false,
        showTraffic: false,
        centerMapOnMarkerTap: false,
      );
    });
  }
}
