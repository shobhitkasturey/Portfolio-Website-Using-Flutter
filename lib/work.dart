import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Experience'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Job Title 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Company Name 1'),
            Text('Duration: Start Date - End Date'),
            SizedBox(height: 10),
            Text('Description of work and responsibilities at Job Title 1'),
            SizedBox(height: 20),
            Text('Job Title 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Company Name 2'),
            Text('Duration: Start Date - End Date'),
            SizedBox(height: 10),
            Text('Description of work and responsibilities at Job Title 2'),
            // Add more job experiences
          ],
        ),
      ),
    );
  }
}
