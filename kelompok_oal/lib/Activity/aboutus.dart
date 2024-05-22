import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Icon(
              Icons.school,
              size: 100,
              color: Colors.blueAccent,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Selamat Datang di LiteBrain!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                'LiteBrain adalah platform e-learning yang didedikasikan untuk memberikan pendidikan berkualitas. Kami menyediakan kursus yang dirancang untuk mempersiapkan Anda dengan keterampilan yang dibutuhkan oleh industri startup dan teknologi saat ini. Bergabunglah dengan kami dan tingkatkan keahlian Anda sekarang juga!',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            // Section for contact information
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email: contact@litebrain.com',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Telepon: +62 123 456 789',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Social media icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        color: Colors.blueAccent,
                        onPressed: () {
                          // TODO: Add navigation to Facebook
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add more content as needed
          ],
        ),
      ),
    );
  }
}
