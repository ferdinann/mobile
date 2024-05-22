import 'package:flutter/material.dart';

class MyProgram extends StatefulWidget {
  const MyProgram({super.key});

  @override
  State<MyProgram> createState() => _MyProgramState();
}

class _MyProgramState extends State<MyProgram> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/flutter.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Mobile Developer',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/js.png'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Web Developer',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/python.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Pundamental Python',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MyDataScience extends StatefulWidget {
  const MyDataScience({super.key});

  @override
  State<MyDataScience> createState() => _MyDataScienceState();
}

class _MyDataScienceState extends State<MyDataScience> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/data_analis.png'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Data analis',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/data.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Data Science',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyCyber extends StatefulWidget {
  const MyCyber({super.key});

  @override
  State<MyCyber> createState() => _MyCyberState();
}

class _MyCyberState extends State<MyCyber> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/cyber.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Cyber Security',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/criptograpi.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Cryptography',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MySnbt extends StatefulWidget {
  const MySnbt({super.key});

  @override
  State<MySnbt> createState() => _MySnbtState();
}

class _MySnbtState extends State<MySnbt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/skolastik.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Tes Potensi Skolastik',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/idn.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Literasi Bahasa Indonesia',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/eng.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Literasi Bahasa Inggris',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/mtk.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Penalaran Matematika',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                    image: AssetImage(
                      'assets/images/snbt.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Image(
                    image: AssetImage(
                      'assets/images/teknologi.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/web.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Web Developer',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/mobile.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Mobile Developer',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/data.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Data Science',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        const Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/images/digital.jpeg'),
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Digital Marketing',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
