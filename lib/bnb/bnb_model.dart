import '/components/side_nav01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'bnb_widget.dart' show BnbWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BnbModel extends FlutterFlowModel<BnbWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNav01 component.
  late SideNav01Model sideNav01Model;

  @override
  void initState(BuildContext context) {
    sideNav01Model = createModel(context, () => SideNav01Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNav01Model.dispose();
  }
}
