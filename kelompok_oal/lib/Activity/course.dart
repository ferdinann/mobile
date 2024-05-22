import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/test.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  // Simpan persentase jalan belajar untuk setiap materi
  Map<String, double> learningProgress = {
    'Data Science': 50.0, // contoh persentase jalan belajar untuk Data Science
    'Mobile Developer':
        30.0, // contoh persentase jalan belajar untuk Mobile Developer
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyTest()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/data.jpeg'),
                        height: 130,
                        width: 200,
                      ),
                      Text(
                        'Data Science',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      // Tampilkan bar persentase jalan belajar
                      LinearProgressIndicator(
                        value: learningProgress['Data Science']! / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${learningProgress['Data Science']}% Complete',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyTest()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/mobile.jpeg'),
                        height: 130,
                        width: 200,
                      ),
                      Text(
                        'Mobile Developer',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      // Tampilkan bar persentase jalan belajar
                      LinearProgressIndicator(
                        value: learningProgress['Mobile Developer']! / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${learningProgress['Mobile Developer']}% Complete',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
