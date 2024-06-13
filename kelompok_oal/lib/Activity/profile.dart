import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kelompok_oal/Activity/home.dart';
import 'package:kelompok_oal/Activity/myButton.dart';
import 'package:kelompok_oal/Activity/test.dart';
import 'package:kelompok_oal/provider/Switch.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, left: 15),
                          height: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/profile.jpeg'))),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                          flex: 6,
                          child: Text(
                            'Ferdinan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            const MyProfileData()
          ],
        ));
  }
}

class MyProfileData extends StatefulWidget {
  const MyProfileData({super.key});

  @override
  State<MyProfileData> createState() => _MyProfileDataState();
}

class _MyProfileDataState extends State<MyProfileData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: TextEditingController(text: 'Ferdinanta Ginting'),
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Nama',
                label: const Text('Nama lengkap')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: TextField(
                  controller: TextEditingController(text: '28/05/2004'),
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Tanggal Lahir',
                      suffix: const Icon(Icons.date_range_rounded),
                      label: const Text('Tanggal Lahir')),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  controller: TextEditingController(text: 'Laki-laki'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Gender',
                      label: const Text('Gender')),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: TextEditingController(text: '083166896713'),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'No.Hp',
                label: const Text('No.HP')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: TextEditingController(text: 'Deli Serdang'),
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Kab/kota',
                label: const Text('Domisili')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: TextEditingController(text: 'Mahasiswa'),
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Profesi',
                label: const Text('Profesi')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyHome()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ),
      ],
    );
  }
}

class MyProgress extends StatefulWidget {
  const MyProgress({super.key});

  @override
  State<MyProgress> createState() => _MyProgressState();
}

class _MyProgressState extends State<MyProgress>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var DarkMode = Provider.of<Mode>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 315,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TabBar(
                          tabs: const [
                            Tab(
                              text: 'Course Progress',
                            ),
                            Tab(
                              text: 'Course Completed',
                            )
                          ],
                          unselectedLabelColor: DarkMode.enableDarkMode
                              ? Colors.white
                              : Colors.black,
                          labelColor: Colors.blue,
                          indicatorColor: Colors.blue,
                          indicatorWeight: 2,
                          controller: tabController,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: const [MyCourseProgres(), MyCourseCompleted()],
            ))
          ],
        ),
      ),
    );
  }
}

class MyCourseProgres extends StatefulWidget {
  const MyCourseProgres({super.key});

  @override
  State<MyCourseProgres> createState() => _MyCourseProgresState();
}

class _MyCourseProgresState extends State<MyCourseProgres> {
  Map<String, double> learningProgress = {
    'Data Science': 50.0, // contoh persentase jalan belajar untuk Data Science
    'Mobile Developer':
        30.0, // contoh persentase jalan belajar untuk Mobile Developer
  };
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyTest()));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
          padding: const EdgeInsets.only(left: 20, right: 20),
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
    ]);
  }
}

class MyCourseCompleted extends StatefulWidget {
  const MyCourseCompleted({super.key});

  @override
  State<MyCourseCompleted> createState() => _MyCourseCompletedState();
}

class _MyCourseCompletedState extends State<MyCourseCompleted> {
  Map<String, double> learningProgress = {
    'Data Analis': 100.0,
    'Web Developer': 100.0,
  };
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      InkWell(
        onTap: () {
          _showMyButtonSheet(context);
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.yellow[600],
                elevation: 10,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/data_analis.png'),
                        height: 130,
                        width: 200,
                      ),
                      Text(
                        'Data Analis',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sertifikat Course',
                            style: TextStyle(color: Colors.blue, fontSize: 17),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Selamat! Kamu sudah menyelesaikan materi ini, klik untuk mendapatkan sertifkatmu!',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                      SizedBox(height: 10),
                      // Tampilkan bar persentase jalan belajar
                      LinearProgressIndicator(
                        value: learningProgress['Data Analis']! / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${learningProgress['Data Analis']}% Completed',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 260, left: 250),
                    child: SizedBox(
                      height: 55,
                      width: 45,
                      child: Image(
                        image: AssetImage('assets/images/completed.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          _showMyButtonSheet(context);
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.yellow[600],
                elevation: 10,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/web.jpeg'),
                        height: 130,
                        width: 200,
                      ),
                      Text(
                        'Web Developer',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sertifikat Course',
                            style: TextStyle(color: Colors.blue, fontSize: 17),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Selamat! Kamu sudah menyelesaikan materi ini, klik untuk mendapatkan sertifkatmu!',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                      SizedBox(height: 10),
                      // Tampilkan bar persentase jalan belajar
                      LinearProgressIndicator(
                        value: learningProgress['Web Developer']! / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${learningProgress['Web Developer']}% Completed',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 260, left: 250),
                    child: SizedBox(
                        height: 55,
                        width: 45,
                        child: Image(
                          image: AssetImage('assets/images/completed.jpeg'),
                          fit: BoxFit.cover,
                        ))),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  void _showMyButtonSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => MyButton());
  }
}

class MyProfileTab extends StatefulWidget {
  const MyProfileTab({super.key});

  @override
  State<MyProfileTab> createState() => _MyProfileTabState();
}

class _MyProfileTabState extends State<MyProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15, left: 15),
                          height: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/profile.jpeg'))),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                          flex: 6,
                          child: Text(
                            'Ferdinan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            MyProgress()
          ],
        ));
  }
}
