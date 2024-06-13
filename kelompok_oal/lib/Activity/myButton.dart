import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                leading: Icon(Icons.download),
                title: Text("Download"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.open_in_full),
                title: Text("Open"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ]));
  }
}
