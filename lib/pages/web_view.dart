import 'package:flutter/material.dart';
import 'package:flutter_day_7/widgets/app_bar.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatelessWidget {
  final String websiteUrl;
  const WebView({super.key, required this.websiteUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WowPizzaAppBar(title: 'WOW Pizza'),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(this.websiteUrl)),
        ));
  }
}
