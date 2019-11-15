import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TestWeb extends StatefulWidget {
  @override
  _TestWebState createState() => _TestWebState();
}

class _TestWebState extends State<TestWeb> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://androidthai.in.th',
      hidden: true,
      appBar: AppBar(title: Text("androidthai.in.th")),
    );
  }
}
