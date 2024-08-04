import '/flutter_flow/flutter_flow_util.dart';
import 'user_details_screen_widget.dart' show UserDetailsScreenWidget;
import 'package:flutter/material.dart';

class UserDetailsScreenModel extends FlutterFlowModel<UserDetailsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
