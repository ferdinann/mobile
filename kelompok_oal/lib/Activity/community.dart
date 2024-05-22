import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/dropDown.dart';

class MyCommunity extends StatefulWidget {
  const MyCommunity({super.key});

  @override
  State<MyCommunity> createState() => _MyCommunityState();
}

class _MyCommunityState extends State<MyCommunity> {
  final List<String> communities = [
    "SNMBT",
    "Web Developer",
    "Mobile Developer",
    "Data Science",
    "Digital Marketing",
  ];

  final Map<String, String> communityImages = {
    "SNMBT": "assets/images/snbt.jpeg",
    "Web Developer": "assets/images/web.jpeg",
    "Mobile Developer": "assets/images/mobile.jpeg",
    "Data Science": "assets/images/data.jpeg",
    "Digital Marketing": "assets/images/digital.jpeg",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community')),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        communityImages[communities[index]] ??
                            "assets/placeholder.png",
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 16.0),
                      Text(communities[index]),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProgram()),
                );
              },
              label: Text("CREATE"),
            ),
          ),
        ],
      ),
    );
  }
}
