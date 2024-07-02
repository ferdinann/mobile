import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final List<Map<String, dynamic>> _data = [
    {
      'image': 'assets/images/linkedinLogo.png',
      'label': 'Linkedin',
    },
    {
      'image': 'assets/images/fbLogo.png',
      'label': 'Facebook',
    },
    {
      'image': 'assets/images/igLogo.png',
      'label': 'Instagram',
    },
    {
      'image': 'assets/images/xLogo.jpeg',
      'label': 'Twitter',
    },
  ];

  void _handleItemTap(int index) {
    print('Item at index $index tapped!');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: const Text(
            'Share to',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: _data
                .map((item) => InkWell(
                      onTap: () => _handleItemTap(_data.indexOf(item)),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: GestureDetector(
                                  child: Image.asset(item['image']),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(item['label']),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
