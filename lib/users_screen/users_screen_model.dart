import '/flutter_flow/flutter_flow_util.dart';
import 'users_screen_widget.dart' show UsersScreenWidget;
import 'package:flutter/material.dart';

class UsersScreenModel extends FlutterFlowModel<UsersScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
