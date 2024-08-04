import '/flutter_flow/flutter_flow_util.dart';
import 'aircraft_details_screen_widget.dart' show AircraftDetailsScreenWidget;
import 'package:flutter/material.dart';

class AircraftDetailsScreenModel
    extends FlutterFlowModel<AircraftDetailsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
