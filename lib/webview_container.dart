import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

// Import platform-specific webview
import 'webview_container_web.dart';

class WebViewContainer extends StatelessWidget {
  final String url;

  const WebViewContainer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewContainerPlatform(url: url);
  }
}
