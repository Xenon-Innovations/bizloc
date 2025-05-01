import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_model.dart';
export 'terms_model.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({super.key});

  static String routeName = 'Terms';
  static String routePath = '/terms';

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late TermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            icon: Icon(
              FFIcons.kback,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Term & Privacy',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.manrope(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (false)
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'These Terms of Use set the rules and conditions for using our mobile app. By using our app, you agree to these terms. If you do not agree to these terms, we recommend not using the app.\n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '1. Use of Services\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'You may use the app only for legal purposes. Any illegal activity or actions that violate the rights of third parties are prohibited. \n\nAll services and materials provided through the app are intended for personal use only.\n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '2. User Accounts\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'You may be required to create an account to access certain features. You must provide accurate and correct information when creating your account. Your account information and password must remain confidential, and you are responsible for all activities under your account.\n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '3. Intellectual Property Rights\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'All content in the app, including but not limited to texts, graphics, logos, and other materials, is the property of us or our licensors.\n\n\nYou may use this material only for personal, non-commercial purposes. Reproducing, distributing, or using it for commercial purposes is prohibited. \n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '4. User Responsibilities\n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'You may not provide false or misleading information through the app. \n\nYou must avoid any actions that harm other users. \n\n\nIt is prohibited to distribute software or viruses that could disrupt or damage our service. \n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '5. Limitation of Liability \n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'We do not guarantee the accuracy or completeness of the information provided through the app. Our services are provided \"as is\" without any explicit or implied warranties. \n\nWe are not responsible for any direct or indirect damages that may arise from your use of the app. \n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '6. Changes to Terms \n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'We reserve the right to update these Terms of Use from time to time. Any changes take effect immediately upon posting. Please regularly review this page to stay informed of updates. \n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '7. Third-Party Links \n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Our app may contain links to third-party websites or services. We are not responsible for these websites or services, and we recommend that you follow their privacy policies or terms.\n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '8. Law and Dispute Resolution \n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'These Terms of Use are governed by the laws of the Republic of Uzbekistan. Any disputes will be resolved only through the courts. \n\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '9. Contact Us \n\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'If you have any questions or suggestions regarding these Terms of Use, you can contact us at: [Email address or phone number].\n\n',
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.manrope(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  FlutterFlowWebView(
                    content:
                        'https://app.termly.io/policy-viewer/policy.html?policyUUID=71e863cc-b6be-4b70-bd54-064b033ef3db',
                    bypass: false,
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    verticalScroll: true,
                    horizontalScroll: false,
                  ),
                ].addToEnd(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
