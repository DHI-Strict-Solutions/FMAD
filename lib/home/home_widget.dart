import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Home',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF0F5F9),
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '6mev8r9u' /* Dashboard */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleLargeFamily),
                          ),
                    ),
                    actions: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent('HOME_PAGE_Icon_sdachqs5_ON_TAP');
                            logFirebaseEvent('Icon_navigate_to');

                            context.pushNamed('Profile');
                          },
                          child: Icon(
                            Icons.settings_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                    centerTitle: true,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('HOME_PAGE_FLIGHTS_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('FlightsScreen');
                        },
                        text: FFLocalizations.of(context).getText(
                          'ubnscupp' /* Flights */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 55.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const Spacer(),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_AIRCRAFT_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('AircraftScreen');
                      },
                      text: FFLocalizations.of(context).getText(
                        'atvc6iqr' /* Aircraft */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 55.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),

                    // Make this side nav a component. You can then set the colors of the icons to be selected base on an integer.
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 72.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6F61EF),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: Color(0xFFE5E7EB),
                                  offset: Offset(
                                    1.0,
                                    0.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: const Color(0x9AFFFFFF),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Logo should go here.
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.add_task_rounded,
                                      color: Colors.white,
                                      size: 32.0,
                                    ),
                                  ),
                                  const Divider(
                                    height: 12.0,
                                    thickness: 2.0,
                                    color: Color(0x4D9489F5),
                                  ),
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6F61EF),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.ssid_chart_rounded,
                                        color: Color(0x9AFFFFFF),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0x4D9489F5),
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: const Color(0x4D9489F5),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.forum_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6F61EF),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.groups_sharp,
                                        color: Color(0x9AFFFFFF),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6F61EF),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.table_chart_outlined,
                                        color: Color(0x9AFFFFFF),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6F61EF),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.settings_rounded,
                                        color: Color(0x9AFFFFFF),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    const Spacer(),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_AIRPORTS_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('AirportsScreen');
                      },
                      text: FFLocalizations.of(context).getText(
                        'pjg1bqqz' /* Airports */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 55.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const Spacer(),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_USERS_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('UsersScreen');
                      },
                      text: FFLocalizations.of(context).getText(
                        'at9l86kl' /* Users */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 55.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const Spacer(),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('HOME_PAGE_FINANCES_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('FinancesScreen');
                      },
                      text: FFLocalizations.of(context).getText(
                        'ehv5p6gs' /* Finances */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 55.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
