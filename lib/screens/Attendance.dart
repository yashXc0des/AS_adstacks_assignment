import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AttendanceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> candidates = [
    {
      'name': 'John Doe',
      'status': 'Present',
      'percentage': 0.95,
      'color': Colors.green,
    },
    {
      'name': 'Emily Carter',
      'status': 'Late',
      'percentage': 0.75,
      'color': Colors.orange,
    },
    {
      'name': 'Michael Brown',
      'status': 'Absent',
      'percentage': 0.0,
      'color': Colors.red,
    },
    {
      'name': 'Sophia Lee',
      'status': 'Present',
      'percentage': 0.87,
      'color': Colors.green,
    },
    {
      'name': 'James Smith',
      'status': 'Present',
      'percentage': 0.90,
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1B254A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Attendance Overview",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(color: Colors.white.withOpacity(0.2)),
              Expanded(
                child: ListView.builder(
                  itemCount: candidates.length,
                  itemBuilder: (context, index) {
                    final candidate = candidates[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF2A2F4F),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: candidate['color'].withOpacity(0.1),
                              radius: 25,
                              child: Icon(
                                Icons.person,
                                color: candidate['color'],
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    candidate['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    candidate['status'],
                                    style: TextStyle(
                                      color: candidate['color'],
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  LinearPercentIndicator(
                                    lineHeight: 8,
                                    percent: candidate['percentage'],
                                    progressColor: candidate['color'],
                                    backgroundColor: Colors.grey.withOpacity(0.3),
                                    barRadius: Radius.circular(10),
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.more_vert, color: Colors.white54),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
