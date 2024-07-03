import 'package:flutter/material.dart';

class MyProgram2 extends StatelessWidget {
  const MyProgram2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          imagePath: 'assets/images/flutter.jpeg',
          title: 'Mobile Developer',
          information: 'Learn mobile app development using Flutter.',
          showDiscount: true,
        ),
        CustomCard(
          imagePath: 'assets/images/js.png',
          title: 'Web Developer',
          information: 'Learn web development using JavaScript.',
          showDiscount: true,
        ),
        CustomCard(
          imagePath: 'assets/images/python.jpeg',
          title: 'Fundamental Python',
          information: 'Learn the fundamentals of Python programming language.',
          showDiscount: true,
        ),
      ],
    );
  }
}

class MyDataScience extends StatelessWidget {
  const MyDataScience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          imagePath: 'assets/images/data_analis.png',
          title: 'Data Analyst',
          information: 'Learn data analysis techniques and tools.',
          showDiscount: true,
        ),
        CustomCard(
          imagePath: 'assets/images/data.jpeg',
          title: 'Data Science',
          information: 'Learn data science methodologies and algorithms.',
          showDiscount: true,
        ),
      ],
    );
  }
}

class MyCyber extends StatelessWidget {
  const MyCyber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          imagePath: 'assets/images/cyber.jpeg',
          showDiscount: true,
          title: 'Cyber Security',
          information:
              'Pelajari tentang keamanan komputer dan strategi pertahanan digital.',
        ),
        CustomCard(
          imagePath: 'assets/images/criptograpi.jpeg',
          showDiscount: true,
          title: 'Cryptography',
          information: 'Pelajari prinsip dan teknik kriptografi.',
        ),
      ],
    );
  }
}

class MySnbt extends StatelessWidget {
  const MySnbt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          imagePath: 'assets/images/skolastik.jpeg',
          showDiscount: true,
          title: 'Tes Potensi Skolastik',
          information: 'Pelajari tentang tes potensi skolastik...',
        ),
        CustomCard(
          imagePath: 'assets/images/idn.jpeg',
          showDiscount: true,
          title: 'Literasi Bahasa Indonesia',
          information: 'Pelajari tentang literasi bahasa Indonesia...',
        ),
        CustomCard(
          imagePath: 'assets/images/eng.jpeg',
          showDiscount: true,
          title: 'Literasi Bahasa Inggris',
          information: 'belajar bahasa Inggris dan simple present tense...',
        ),
        CustomCard(
          imagePath: 'assets/images/mtk.jpeg',
          showDiscount: true,
          title: 'Penalaran Matematika',
          information:
              'Pelajari tentang penalaran matematika dan pemecahan masalah...',
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Image(
                    image: AssetImage('assets/images/snbt.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Image(
                    image: AssetImage('assets/images/teknologi.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomCard(
          imagePath: 'assets/images/web.jpeg',
          title: 'Web Developer',
          information:
              'Pengembangan web untuk membuat situs web dan aplikasi web....',
          showDiscount: true,
        ),
        CustomCard(
          imagePath: 'assets/images/mobile.jpeg',
          title: 'Mobile Developer',
          information:
              'Pelajari pengembangan aplikasi seluler untuk platform iOS dan Android....',
          showDiscount: true,
        ),
        CustomCard(
          imagePath: 'assets/images/data.jpeg',
          title: 'Data Science',
          information:
              'Pelajari analisis data dan teknik pembelajaran mesin untuk memperoleh wawasan dari data....',
          showDiscount: true,
        ),
        CustomCard(
          imagePath: 'assets/images/digital.jpeg',
          title: 'Digital Marketing',
          information:
              'Strategi pemasaran digital untuk mempromosikan produk dan layanan secara online....',
          showDiscount: true,
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String information;
  final bool showDiscount;

  const CustomCard({
    required this.imagePath,
    required this.title,
    required this.information,
    this.showDiscount = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image(
                  image: AssetImage(imagePath),
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  color: Colors.black54,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  information,
                  style: TextStyle(fontSize: 14),
                ),
                if (showDiscount) ...[
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.deepPurpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      'DAFTAR SEKARANG & DAPATKAN DISKON KHUSUS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey[700]),
                      SizedBox(width: 5),
                      Text(
                        '7 Agustus 2024 - 19 September 2024',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rp 700.000',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Rp 250.000',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('My Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHomePage(),
            MyProgram2(),
            MyDataScience(),
            MyCyber(),
            MySnbt(),
          ],
        ),
      ),
    ),
  ));
}
