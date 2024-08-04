import '/flutter_flow/flutter_flow_util.dart';
import 'finances_screen_widget.dart' show FinancesScreenWidget;
import 'package:flutter/material.dart';

class FinancesScreenModel extends FlutterFlowModel<FinancesScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
