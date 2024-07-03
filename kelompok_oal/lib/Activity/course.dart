import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/test.dart';
import 'package:intl/intl.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  // Simpan persentase progress belajar untuk setiap materi
  Map<String, double> learningProgress = {
    'Data Science': 50.0, // contoh progress belajar untuk Data Science
    'Mobile Developer': 30.0, // contoh progress belajar untuk Mobile Developer
  };

  // Simpan deadline untuk setiap materi
  Map<String, DateTime?> deadlines = {
    'Data Science': null,
    'Mobile Developer': null,
  };

  Future<void> _selectDate(BuildContext context, String course) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: deadlines[course] ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != deadlines[course]) {
      setState(() {
        deadlines[course] = DateTime(picked.year, picked.month, picked.day,
            deadlines[course]?.hour ?? 0, deadlines[course]?.minute ?? 0);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, String course) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(deadlines[course] ?? DateTime.now()),
    );
    if (picked != null) {
      setState(() {
        final date = deadlines[course] ?? DateTime.now();
        deadlines[course] = DateTime(
            date.year, date.month, date.day, picked.hour, picked.minute);
      });
    }
  }

  String _formatRemainingTime(DateTime deadline) {
    final duration = deadline.difference(DateTime.now());
    if (duration.isNegative) {
      return 'Deadline Passed!';
    }

    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    return '$hours hours $minutes minutes $seconds seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        //backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCourseCard(context, 'Data Science'),
          _buildCourseCard(context, 'Mobile Developer'),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, String course) {
    final deadline = deadlines[course];
    final formattedDeadline = deadline != null
        ? DateFormat('MMM d, yyyy HH:mm').format(deadline)
        : 'No Deadline Chosen!';

    String imagePath;
    if (course == 'Mobile Developer') {
      imagePath = 'assets/images/mobile.jpeg';
    } else {
      imagePath = 'assets/images/cyber.jpeg';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyTest()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath,
                  height: 130, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(course,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: learningProgress[course]! / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 5),
              Text('${learningProgress[course]}% Complete',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                deadline == null
                    ? 'No Deadline Chosen!'
                    : 'Time Remaining: ${_formatRemainingTime(deadline)}',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                formattedDeadline,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.teal),
                    onPressed: () => _selectDate(context, course),
                    tooltip: 'Set Deadline Date',
                  ),
                  IconButton(
                    icon: Icon(Icons.access_time, color: Colors.teal),
                    onPressed: () => _selectTime(context, course),
                    tooltip: 'Set Deadline Time',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
