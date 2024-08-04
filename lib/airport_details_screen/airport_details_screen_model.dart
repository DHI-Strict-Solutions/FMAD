import '/flutter_flow/flutter_flow_util.dart';
import 'airport_details_screen_widget.dart' show AirportDetailsScreenWidget;
import 'package:flutter/material.dart';

class AirportDetailsScreenModel
    extends FlutterFlowModel<AirportDetailsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
