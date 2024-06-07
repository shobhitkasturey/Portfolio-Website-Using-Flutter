import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;

class WebViewContainerPlatform extends StatelessWidget {
  final String url;

  const WebViewContainerPlatform({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    // Register a view type for the webview
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webview',
      (int viewId) => IFrameElement()
        ..width = '100%'
        ..height = '100%'
        ..src = url
        ..style.border = 'none',
    );

    return HtmlElementView(viewType: 'webview');
  }
}
