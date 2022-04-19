// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:url_launcher/url_launcher.dart';

Future urlLauncher(String url) async {
  if (await canLaunch(url))
    await launch(url, forceWebView: true);
  else
    // can't launch url, there is some error
    throw "Could not launch $url";
}
