import 'package:flutter/material.dart';

class JobDetailsScreen extends StatefulWidget {
  final Map<String, String> job;

  JobDetailsScreen({required this.job});

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late String basePay;
  late String payPeriod;
  late String shift;
  late String schedule;

  @override
  void initState() {
    super.initState();
    // Initialize editable fields with default values
    basePay = "\$50,000 - \$70,000 per year";
    payPeriod = "Monthly";
    shift = "Day Shift";
    schedule = "Full-Time";
  }

  void _editField({
    required String title,
    required String currentValue,
    required ValueChanged<String> onSave,
  }) {
    TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: title,
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue.shade600
              ),
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      


      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height*2,
          width: 500,
          child: Card(
        
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
        
                children: [
                  // Job Title and Basic Details
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.job['title']!,
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:40),
                        child: IconButton(onPressed: (){}, icon:Icon(Icons.share) ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${widget.job['company']} • ${widget.job['location']}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),

                  SizedBox(height: 16),
                  Divider(
        
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Job Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10,
                  ),
        
                  // Editable Salary Section
                  GestureDetector(
                    onTap: () => _editField(
                      title: "Base Pay",
                      currentValue: basePay,
                      onSave: (newValue) {
                        setState(() {
                          basePay = newValue;
                        });
                      },
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.monetization_on, color: Colors.green),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Base Pay: $basePay',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Icon(Icons.edit, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _editField(
                      title: "Pay Period",
                      currentValue: payPeriod,
                      onSave: (newValue) {
                        setState(() {
                          payPeriod = newValue;
                        });
                      },
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.blue),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Pay Period: $payPeriod',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Icon(Icons.edit, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
        
                  // Editable Shift and Schedule Section
                  GestureDetector(
                    onTap: () => _editField(
                      title: "Shift",
                      currentValue: shift,
                      onSave: (newValue) {
                        setState(() {
                          shift = newValue;
                        });
                      },
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.schedule, color: Colors.orange),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Shift: $shift',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Icon(Icons.edit, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _editField(
                      title: "Schedule",
                      currentValue: schedule,
                      onSave: (newValue) {
                        setState(() {
                          schedule = newValue;
                        });
                      },
                    ),
                    child: Row(

                      children: [
                        Icon(Icons.access_time, color: Colors.purple),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Schedule: $schedule',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Icon(Icons.edit, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
        
                  Divider(),
        
                  // Job Description
                  Text("Location"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${widget.job['location']}",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  Text(
                    'Job Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a placeholder description for the ${widget.job['title']} position at ${widget.job['company']}. '
                        'The role involves developing and maintaining applications, collaborating with teams, and ensuring optimal performance.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
        
                  SizedBox(height: 30),
        
                  // Apply Button
                  SizedBox(
                    height: 50,
                    width: 320,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Apply functionality here
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Application submitted successfully!')),
                            );
                          },
                          child: Text('Apply Now'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue.shade600,
                            minimumSize: Size(double.infinity, 50),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
