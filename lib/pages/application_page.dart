import 'package:flutter/material.dart';

class SavedJobsScreen extends StatelessWidget {
  final List<Map<String, String>> savedJobs;
  final List<Map<String, String>> applications;

  SavedJobsScreen({required this.savedJobs, required this.applications});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Saved & Applications'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Saved Jobs'),
              Tab(text: 'Applications'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Saved Jobs Tab
            savedJobs.isNotEmpty
                ? ListView.builder(
              itemCount: savedJobs.length,
              itemBuilder: (context, index) {
                final job = savedJobs[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(job['title']!),
                    subtitle: Text('${job['company']} • ${job['location']}'),
                    trailing: Icon(Icons.bookmark),
                  ),
                );
              },
            )
                : Center(
              child: Text(
                'No Saved Jobs Yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            // Applications Tab
            applications.isNotEmpty
                ? ListView.builder(
              itemCount: applications.length,
              itemBuilder: (context, index) {
                final application = applications[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(application['title']!),
                    subtitle: Text('${application['company']} • ${application['location']}'),
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  ),
                );
              },
            )
                : Center(
              child: Text(
                'No Applications Yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
