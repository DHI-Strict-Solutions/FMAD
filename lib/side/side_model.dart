import '/components/sidewidg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'side_widget.dart' show SideWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
