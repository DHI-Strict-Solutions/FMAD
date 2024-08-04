import '/flutter_flow/flutter_flow_util.dart';
import 'flights_screen_widget.dart' show FlightsScreenWidget;
import 'package:flutter/material.dart';

class FlightsScreenModel extends FlutterFlowModel<FlightsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
