import '/components/sidewidg_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_widget.dart' show SideWidget;
import 'package:flutter/material.dart';

class SideModel extends FlutterFlowModel<SideWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sidewidg component.
  late SidewidgModel sidewidgModel;

  @override
  void initState(BuildContext context) {
    sidewidgModel = createModel(context, () => SidewidgModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidewidgModel.dispose();
  }
}
