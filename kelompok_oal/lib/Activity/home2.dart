import 'package:flutter/material.dart';
import 'package:kelompok_oal/Activity/aboutus.dart';
import 'package:kelompok_oal/Activity/community.dart';
import 'package:kelompok_oal/Activity/course.dart';
import 'package:kelompok_oal/Activity/dropDown.dart';
import 'package:kelompok_oal/Activity/elearning.dart';
import 'package:kelompok_oal/Activity/profile.dart';
import 'package:kelompok_oal/provider/Switch.dart';
import 'package:kelompok_oal/provider/obscure.dart';
import 'package:tugas_kelompok/Activity/aboutus.dart';
import 'package:tugas_kelompok/Activity/community.dart';
import 'package:tugas_kelompok/Activity/course.dart';
import 'package:tugas_kelompok/Activity/dropDown.dart';
import 'package:tugas_kelompok/Activity/elearning.dart';
import 'package:tugas_kelompok/Activity/profile.dart';
import 'package:tugas_kelompok/provider/Switch.dart';
import 'package:tugas_kelompok/provider/obscure.dart';
import 'package:provider/provider.dart';

class MyHome2 extends StatefulWidget {
  const MyHome2({super.key});

  @override
  State<MyHome2> createState() => _MyHome2State();
}

class _MyHome2State extends State<MyHome2> {
  final TextEditingController _serchBar = TextEditingController();
  List<String> data = ['Data science', 'Pemrograman', 'SNBT', 'Cyber security'];
  List<String> filteredData = [];
  final dropDown = const [
    MyHomePage(),
    MyCyber(),
    MyDataScience(),
    MyProgram(),
    MySnbt()
  ];
  var selectedDDB = null;
  bool isBannerVisible = true;

  @override
  void initState() {
    super.initState();
    filteredData = data;
  }

  void updateSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredData = data;
      });
    } else {
      setState(() {
        filteredData = data
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Search = Provider.of<serchClick>(context);
    var DarkMode = Provider.of<Mode>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<serchClick>(context, listen: false).toogleVisible();
            },
            icon: Icon(Search.searchClick ? Icons.close : Icons.search),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      color:
                          DarkMode.enableDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUsPage(),
                      ),
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: DarkMode.enableDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Spacer(),
                    Switch(
                      value: DarkMode.enableDarkMode,
                      onChanged: (value) {
                        DarkMode.enableDarkMode = value;
                      },
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color:
                          DarkMode.enableDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
              ),
            ],
          ),
        ],
        title: Search.searchClick
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _serchBar,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                    hintText: "Search...",
                  ),
                  onChanged: updateSearchResults,
                ),
              )
            : Text('LiteBrain'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            GestureDetector(
              child: UserAccountsDrawerHeader(
                accountName: Text("Ferdinan"),
                accountEmail: Text("ferdinantag8@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Container(
                    height: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/profile.jpeg'),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded),
              title: const Text('E-Learning'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyLearning()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_sharp),
              title: const Text('Course'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCourse()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_activity),
              title: const Text('Aktivity'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyProfileTab()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.groups),
              title: const Text('Community'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyCommunity()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (isBannerVisible)
            MaterialBanner(
              content: Text(
                  'Selamat Datang Kembali! Ayo, Lanjutkan Proses Belajar!.'),
              backgroundColor: Colors.yellow[100],
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isBannerVisible = false;
                    });
                  },
                  child: Text('Dismiss'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyCourse()),
                    );
                  },
                  child: Text('See Course'),
                ),
              ],
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  if (Search.searchClick) ...[
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: filteredData.map((item) {
                        return Chip(
                          label: Text(item),
                          onDeleted: () {
                            setState(() {
                              filteredData.remove(item);
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, left: 10),
                    child: Text(
                      'LiteBrain',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  const Text(
                    'Persiapkan dirimu dari sekarang. Dimulai dari belajar skill yang dibutuhkan oleh startup dan industri saat ini. Yuk, tingkatkan skillmu sekarang juga.',
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        DropdownButton(
                          value: selectedDDB,
                          hint: const Text("Product"),
                          items: const [
                            DropdownMenuItem(
                              value: "Pemrograman",
                              child: Text(
                                'Pemrograman',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Data science',
                              child: Text(
                                'Data science',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'Cyber security',
                              child: Text(
                                'Cyber security',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'SNBT',
                              child: Text(
                                'SNBT',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedDDB = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  selectedDDB == null
                      ? dropDown[0]
                      : selectedDDB == "Data science"
                          ? dropDown[2]
                          : selectedDDB == "Cyber security"
                              ? dropDown[1]
                              : selectedDDB == "Pemrograman"
                                  ? dropDown[3]
                                  : dropDown[4],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
