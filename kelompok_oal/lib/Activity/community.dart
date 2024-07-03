import 'package:flutter/material.dart';

class InterestSelection extends StatefulWidget {
  const InterestSelection({super.key});

  @override
  State<InterestSelection> createState() => _InterestSelectionState();
}

class _InterestSelectionState extends State<InterestSelection> {
  final Map<String, bool> interests = {
    "SNMBT": false,
    "Web Developer": false,
    "Mobile Developer": false,
    "Data Science": false,
    "Digital Marketing": false,
    "Python": false,
  };

  void _submitSelections() {
    final selectedInterests = interests.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyCommunity(selectedInterests: selectedInterests),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Minat dan Bakat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...interests.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: interests[key],
                onChanged: (bool? value) {
                  setState(() {
                    interests[key] = value!;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitSelections,
              child: Text("SUBMIT"),
            ),
          ],
        ),
      ),
    );
  }
}

// MyCommunity Widget
class MyCommunity extends StatefulWidget {
  final List<String> selectedInterests;

  const MyCommunity({required this.selectedInterests, super.key});

  @override
  State<MyCommunity> createState() => _MyCommunityState();
}

class _MyCommunityState extends State<MyCommunity> {
  final Map<String, String> communityImages = {
    "SNMBT": "assets/images/snbt.jpeg",
    "Web Developer": "assets/images/web.jpeg",
    "Mobile Developer": "assets/images/mobile.jpeg",
    "Data Science": "assets/images/data.jpeg",
    "Digital Marketing": "assets/images/digital.jpeg",
    "Python": "assets/images/python.jpeg"
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content:
            Text("Anda telah bergabung dengan komunitas. Selamat Belajar!!"),
        action: SnackBarAction(
          label: "",
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community')),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: widget.selectedInterests.length,
            itemBuilder: (context, index) {
              final interest = widget.selectedInterests[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        communityImages[interest] ?? "assets/placeholder.png",
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 16.0),
                      Text(interest),
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

class MyProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Program')),
      body: Center(child: Text('Program Content Goes Here')),
    );
  }
}
