import '/flutter_flow/flutter_flow_util.dart';
import 'flight_details_screen_widget.dart' show FlightDetailsScreenWidget;
import 'package:flutter/material.dart';

class FlightDetailsScreenModel
    extends FlutterFlowModel<FlightDetailsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
