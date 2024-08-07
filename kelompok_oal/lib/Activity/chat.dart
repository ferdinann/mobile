import 'package:flutter/material.dart';

class Mychat extends StatefulWidget {
  const Mychat({super.key});

  @override
  State<Mychat> createState() => _MychatState();
}

class _MychatState extends State<Mychat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
        elevation: 5,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          String sender = index.isEven ? 'John' : 'Jenny';
          String message = 'Hello, this is message number $index';
          bool isMe = index.isEven; // Jika pesan dari saya

          return ListTile(
            leading: CircleAvatar(
              // Avatar pengirim
              child: Text(sender[0]),
            ),
            title: Text(sender),
            subtitle: Text(message),
            trailing: const Text(
              '10:00', // Waktu pengiriman pesan
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              // Aksi saat pesan ditekan
              print('Pesan dari $sender ditekan');
            },
            selected: isMe, // Pesan dari saya ditandai
          );
        },
      ),
    );
  }
}
