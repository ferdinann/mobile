import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/home.dart';
import 'package:kelompok_oal/Activity/profile.dart';

class MyLearning extends StatefulWidget {
  const MyLearning({super.key});

  @override
  State<MyLearning> createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Learning'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyProfile()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: const Card(
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyHome()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
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
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
