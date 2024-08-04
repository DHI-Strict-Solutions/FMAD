import '/flutter_flow/flutter_flow_util.dart';
import 'aircraft_screen_widget.dart' show AircraftScreenWidget;
import 'package:flutter/material.dart';

class AircraftScreenModel extends FlutterFlowModel<AircraftScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
