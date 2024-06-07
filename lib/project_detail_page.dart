import 'package:flutter/material.dart';
import 'webview_container.dart';

class ProjectDetailPage extends StatelessWidget {
  final String url;
  const ProjectDetailPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Detail'),
      ),
      body: WebViewContainer(url: url),
    );
  }
}
