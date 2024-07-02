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
              'pengembangan web untuk membuat situs web dan aplikasi web....',
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
              'strategi pemasaran digital untuk mempromosikan produk dan layanan secara online....',
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
      margin: EdgeInsets.all(15),
      child: Column(
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    //color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  information,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                if (showDiscount) ...[
                  SizedBox(height: 10),
                  Card(
                    color: Color.fromARGB(255, 215, 177, 240),
                    margin: EdgeInsets.only(top: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'DAFTAR SEKARANG & DAPATKAN DISKON KHUSUS',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        '7 Agustus 2024 - 19 September 2024',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.price_change, color: Colors.red),
                      SizedBox(width: 5),
                      Text(
                        'Rp 700.000',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.price_check, color: Colors.green),
                      SizedBox(width: 5),
                      Text(
                        'Rp 250.000',
                        style: TextStyle(fontSize: 14, color: Colors.green),
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
