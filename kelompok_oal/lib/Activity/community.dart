import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

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

  final List<Map<String, dynamic>> createdCommunities = [];

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

  void _addCommunity(String name, Uint8List imageBytes) {
    setState(() {
      createdCommunities.add({"name": name, "image": imageBytes});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community')),
      body: Stack(
        children: [
          ListView.builder(
            itemCount:
                widget.selectedInterests.length + createdCommunities.length,
            itemBuilder: (context, index) {
              if (index < widget.selectedInterests.length) {
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
              } else {
                final community =
                    createdCommunities[index - widget.selectedInterests.length];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.memory(
                          community["image"],
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 16.0),
                        Text(community["name"]),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton.extended(
              onPressed: () async {
                final newCommunity = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateCommunity()),
                );
                if (newCommunity != null) {
                  _addCommunity(newCommunity['name'], newCommunity['image']);
                }
              },
              label: Text("CREATE"),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateCommunity extends StatefulWidget {
  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? _imageBytes;
  final TextEditingController _nameController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Community')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Community Name'),
                ),
                SizedBox(height: 20),
                _imageBytes != null
                    ? Image.memory(_imageBytes!)
                    : Container(
                        height: 200,
                        width: double.infinity,
                        child: Center(
                          child: Text("Images belum dipilih!!"),
                        ),
                        // child: Placeholder(
                        //     fallbackHeight: 200.0, fallbackWidth: double.infinity),
                      ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text("Pick Image"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_imageBytes != null &&
                        _nameController.text.isNotEmpty) {
                      Navigator.pop(context, {
                        'name': _nameController.text,
                        'image': _imageBytes!,
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please enter a name and pick an image."),
                      ));
                    }
                  },
                  child: Text("CREATE COMMUNITY"),
                ),
              ],
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
