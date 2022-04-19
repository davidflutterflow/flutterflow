import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestComp2Widget extends StatefulWidget {
  const TestComp2Widget({Key key}) : super(key: key);

  @override
  _TestComp2WidgetState createState() => _TestComp2WidgetState();
}

class _TestComp2WidgetState extends State<TestComp2Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Text(
        FFLocalizations.of(context).getText(
          'j6uv9eab' /* Hello World */,
        ),
        style: FlutterFlowTheme.of(context).bodyText1,
      ),
    );
  }
}
