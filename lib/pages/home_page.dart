import 'package:flutter/material.dart';
import 'application_page.dart';
import 'job_detail_page.dart';
import 'Profile_creation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> jobs = [
    {"title": "Flutter Developer", "company": "Tech Co", "location": "Remote"},
    {"title": "Backend Engineer", "company": "CloudSoft", "location": "New York"},
    {"title": "UI/UX Designer", "company": "DesignHub", "location": "San Francisco"},
  ];

  final List<Map<String, String>> savedJobs = [];
  final List<Map<String, String>> applications = [];

  void saveJob(Map<String, String> job) {
    setState(() {
      if (savedJobs.contains(job)) {
        savedJobs.remove(job);
      } else {
        savedJobs.add(job);
      }
    });
  }

  void applyJob(Map<String, String> job) {
    setState(() {
      if (!applications.contains(job)) {
        applications.add(job);
      }
    });
  }

  void navigateToJobDetails(BuildContext context, Map<String, String> job) async {
    // Show CircularProgressIndicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    // Simulate a loading delay
    await Future.delayed(Duration(seconds: 2));

    // Close the CircularProgressIndicator
    Navigator.pop(context);

    // Navigate to JobDetailsScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDetailsScreen(job: job),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Job Finder', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(icon: Icon(Icons.message, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Saved & Applications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedJobsScreen(savedJobs: savedJobs, applications: applications),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileCreationPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    // Search Field
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for jobs, company',
                        hintStyle: TextStyle(fontSize: 15),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(height: 12),
                    // Location Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Location',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Text("Jobs for you", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                final isSaved = savedJobs.contains(job);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(child: Text(job['company']![0])),
                        title: Text(job['title']!),
                        subtitle: Text('${job['company']} • ${job['location']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                isSaved ? Icons.bookmark : Icons.bookmark_border,
                                color: isSaved ? Colors.deepPurple : Colors.grey,
                              ),
                              onPressed: () => saveJob(job),
                            ),

                          ],
                        ),
                        onTap: () => navigateToJobDetails(context, job),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
