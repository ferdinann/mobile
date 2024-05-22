import 'package:flutter/material.dart';

class Mynotif extends StatefulWidget {
  const Mynotif({super.key});

  @override
  State<Mynotif> createState() => _MynotifState();
}

class _MynotifState extends State<Mynotif> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Jumlah pesan dalam daftar
      itemBuilder: (BuildContext context, int index) {
        // Contoh data pesan
        String sender = index.isEven ? 'Bunny' : 'Jenny';
        String message = 'You get a notification from $sender';
        bool isMe = index.isEven; // Jika pesan dari saya

        return ListTile(
          leading: CircleAvatar(
            // Avatar pengirim
            child: Text(sender[0]),
          ),
          title: Text(sender),
          subtitle: Text(message),
          trailing: Column(
            children: [
              Text(
                '10:00', // Waktu pengiriman pesan
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.more_vert)
            ],
          ),
          onTap: () {
            //Aksi saat pesan ditekan
            print('Pesan dari $sender ditekan');
          },
          selected: isMe, // Pesan dari saya ditandai
        );
      },
    );
  }
}
