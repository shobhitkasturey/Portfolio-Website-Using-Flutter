import 'package:flutter/material.dart';

class CertificationsPage extends StatelessWidget {
  const CertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certifications'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Certification 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Issuing Organization'),
            Text('Date Issued: Date'),
            SizedBox(height: 10),
            Text('Description or details about Certification 1'),
            SizedBox(height: 20),
            Text('Certification 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Issuing Organization'),
            Text('Date Issued: Date'),
            SizedBox(height: 10),
            Text('Description or details about Certification 2'),
            // Add more certifications
          ],
        ),
      ),
    );
  }
}
