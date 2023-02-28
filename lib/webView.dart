import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web View"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          final bool canGoBack = await _webViewController.canGoBack();
          if (canGoBack) {
            _webViewController.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ),
      ),
    );
  }

  late WebViewController _webViewController;
}
