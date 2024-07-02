import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kelompok_oal/Activity/aboutus.dart';
import 'package:kelompok_oal/Activity/community.dart';
import 'package:kelompok_oal/Activity/course.dart';
import 'package:kelompok_oal/Activity/dropDown.dart';
import 'package:kelompok_oal/Activity/elearning.dart';
import 'package:kelompok_oal/Activity/profile.dart';
import 'package:kelompok_oal/provider/Switch.dart';
import 'package:kelompok_oal/provider/loading_provider.dart';
import 'package:kelompok_oal/provider/obscure.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

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
    MyProgram2(),
    MySnbt()
  ];
  var selectedDDB = null;
  bool isBannerVisible = true;
  var text1 =
      'Materinya bagus dan terstruktur sehingga mudah dipahami,diajarin metode best practice sama tips and trick yang bermanfaat juga di kursusnya';
  var text2 =
      'Kelas online yang paling direkomendasikan karena materi yang di sampaikan sangat detail dan jelas sehingga sangat cocok untuk pemula';
  var text3 =
      'Penyampaian materinya cukup bagus dan mudah dimengerti.Apalagi ditambah saya sudah biasa menggunakan mysql.Terima kasih LiteBrain.Semoga kedepannya semakin maju.';
  var text4 =
      'E-learning di LiteBrain mengupgrade ilmu saya tentang fundamental ilmu data hingga ke advance dengan modul yang sederhana dan mudah dicerna.Penyampaian materinya cukup bagus dan mudah dimengerti.Apalagi ditambah saya sudah biasa menggunakan mysql.Terima kasih LiteBrain.Semoga kedepannya semakin maju.sukses buat tim LiteBrain';
  var text5 =
      'Alhamdulillah learning di LiteBrain mengupgrade ilmu saya tentang fundamental jaringan dengan modul yang sederhana dan mudah dicerna.sukses buat tim LiteBrain';

  @override
  void initState() {
    super.initState();
    filteredData = data;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: const Text(
            "Anda dapat bergabung dalam kelas pelajaran secara Gratis"),
        action: SnackBarAction(
          label: "Oke",
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
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

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Logout"),
          content: const Text("Apakah Anda yakin ingin keluar dari aplikasi?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Search = Provider.of<serchClick>(context);
    var DarkMode = Provider.of<Mode>(context);
    final Loading = Provider.of<LoadingProvider>(context);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 8,
            shadowColor: Colors.grey,
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<serchClick>(context, listen: false)
                      .toogleVisible();
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
                          color: DarkMode.enableDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        Provider.of<LoadingProvider>(context, listen: false)
                            .setLoading(true);
                        Future.delayed(const Duration(seconds: 2), () {
                          Provider.of<LoadingProvider>(context, listen: false)
                              .setLoading(false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutUsPage(),
                            ),
                          );
                        });
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
                        const Spacer(),
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
                          color: DarkMode.enableDarkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        _showLogoutConfirmationDialog(context);
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
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 10, left: 15),
                        hintText: "Search...",
                      ),
                      onChanged: updateSearchResults,
                    ),
                  )
                : const Text('LiteBrain'),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                GestureDetector(
                  child: UserAccountsDrawerHeader(
                    accountName: const Text("Ferdinan"),
                    accountEmail: const Text("ferdinantag8@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      child: Container(
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpeg'),
                          ),
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCourse()));
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
                            builder: (context) => InterestSelection()));
                  },
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              if (isBannerVisible)
                MaterialBanner(
                  content: const Text(
                      'Selamat Datang Kembali! Ayo, Lanjutkan Proses Belajar!.'),
                  backgroundColor: Colors.yellow[100],
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isBannerVisible = false;
                        });
                      },
                      child: const Text('Dismiss'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyCourse()),
                        );
                      },
                      child: const Text('See Course'),
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
                        padding: const EdgeInsets.all(8.0),
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
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Text(
                          'Testimoni',
                          style: TextStyle(fontSize: 25, color: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Card(
                              shadowColor: Colors.grey,
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ListTile(
                                    leading: CircleAvatar(child: Text('A')),
                                    title: Text(
                                      'Anddrew',
                                    ),
                                    subtitle: Text(
                                      'anddrew@gmail.com',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: RatingBar(
                                      itemSize: 30,
                                      initialRating: 4.5,
                                      allowHalfRating: true,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star,
                                              color: Colors.amber),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Colors.amber,
                                          ),
                                          empty: const Icon(
                                            Icons.star,
                                            color: Colors.grey,
                                          )),
                                      onRatingUpdate: (value) {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: ReadMoreText(
                                      text1,
                                      trimLength: 150,
                                      moreStyle:
                                          const TextStyle(color: Colors.blue),
                                      lessStyle:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shadowColor: Colors.grey,
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ListTile(
                                    leading: CircleAvatar(child: Text('J')),
                                    title: Text(
                                      'Jhon',
                                    ),
                                    subtitle: Text(
                                      'jhon@gmail.com',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: RatingBar(
                                      itemSize: 30,
                                      initialRating: 4,
                                      allowHalfRating: true,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star,
                                              color: Colors.amber),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Colors.amber,
                                          ),
                                          empty: const Icon(
                                            Icons.star,
                                            color: Colors.grey,
                                          )),
                                      onRatingUpdate: (value) {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: ReadMoreText(
                                      text2,
                                      trimLength: 150,
                                      moreStyle:
                                          const TextStyle(color: Colors.blue),
                                      lessStyle:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shadowColor: Colors.grey,
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ListTile(
                                    leading: CircleAvatar(child: Text('Y')),
                                    title: Text(
                                      'Yuda',
                                    ),
                                    subtitle: Text(
                                      'yuda@gmail.com',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: RatingBar(
                                      itemSize: 30,
                                      initialRating: 3.5,
                                      allowHalfRating: true,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star,
                                              color: Colors.amber),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Colors.amber,
                                          ),
                                          empty: const Icon(
                                            Icons.star,
                                            color: Colors.grey,
                                          )),
                                      onRatingUpdate: (value) {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: ReadMoreText(
                                      text3,
                                      trimLength: 150,
                                      moreStyle:
                                          const TextStyle(color: Colors.blue),
                                      lessStyle:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shadowColor: Colors.grey,
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ListTile(
                                    leading: CircleAvatar(child: Text('C')),
                                    title: Text(
                                      'Calvin',
                                    ),
                                    subtitle: Text(
                                      'calvin@gmail.com',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: RatingBar(
                                      itemSize: 30,
                                      initialRating: 5,
                                      allowHalfRating: true,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star,
                                              color: Colors.amber),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Colors.amber,
                                          ),
                                          empty: const Icon(
                                            Icons.star,
                                            color: Colors.grey,
                                          )),
                                      onRatingUpdate: (value) {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: ReadMoreText(
                                      text4,
                                      trimLength: 150,
                                      moreStyle:
                                          const TextStyle(color: Colors.blue),
                                      lessStyle:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shadowColor: Colors.grey,
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const ListTile(
                                    leading: CircleAvatar(child: Text('M')),
                                    title: Text(
                                      'Mary',
                                    ),
                                    subtitle: Text(
                                      'mary@gmail.com',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: RatingBar(
                                      itemSize: 30,
                                      initialRating: 5,
                                      allowHalfRating: true,
                                      ratingWidget: RatingWidget(
                                          full: const Icon(Icons.star,
                                              color: Colors.amber),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Colors.amber,
                                          ),
                                          empty: const Icon(
                                            Icons.star,
                                            color: Colors.grey,
                                          )),
                                      onRatingUpdate: (value) {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: ReadMoreText(
                                      text5,
                                      trimLength: 150,
                                      moreStyle:
                                          const TextStyle(color: Colors.blue),
                                      lessStyle:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (Loading.isLoading)
          Container(
            color: Colors.black54,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
