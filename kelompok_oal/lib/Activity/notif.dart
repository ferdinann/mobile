import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kelompok_oal/provider/notifProvider.dart';
import 'package:provider/provider.dart';

class Mynotif extends StatefulWidget {
  const Mynotif({super.key});

  @override
  State<Mynotif> createState() => _MynotifState();
}

class _MynotifState extends State<Mynotif> {
  void markAllAsRead() {
    setState(() {
      baca = true; // Ubah nilai `baca` menjadi true
      Provider.of<notifProvider>(context, listen: false).markAllAsRead();
    });
  }

  bool baca = false;
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<notifProvider>(context, listen: false).initialData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<notifProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        actions: [
          PopupMenuButton(
              itemBuilder: ((context) => [
                    PopupMenuItem(
                        child: ListTile(
                      title: Text("Tandai semua sebagai telah dibaca"),
                      onTap: () {
                        markAllAsRead();
                      },
                      //onTap: () => prov.ubahList('baca'),
                    )),
                    PopupMenuItem(
                        child: ListTile(
                      title: Text("Hapus semua"),
                      onTap: () => prov.ubahList('Hapus'),
                    ))
                  ])),
        ],
        title: Text("Notifikasi"),
      ),
      body: body(context),
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<notifProvider>(context);
    if (prov.data == null) {
      return Center(
        child: Text("Tidak ada notifikasi"),
      );
    } else {
      return ListView.builder(
        itemCount: prov.data['data'].isEmpty.toString().length,
        itemBuilder: (BuildContext context, int index) {
          var item = prov.data['data']![index];
          return Slidable(
            endActionPane: ActionPane(
                extentRatio: 1 / 5,
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {}),
                    icon: Icons.delete,
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.red.shade100,
                    label: 'Delete',
                  ),
                ]),
            child: baca == false
                ? ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          child: Text(item['liding']),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 8,
                        )
                      ],
                    ),
                    title: Text(item['message']),
                    trailing: Column(
                      children: [
                        Text(
                          item['treiling'],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {},
                  )
                : ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          child: Text(item['liding']),
                        ),
                      ],
                    ),
                    title: Text(item['message']),
                    trailing: Column(
                      children: [
                        Text(
                          item['treiling'],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
          );
        },
      );
    }
  }
}
