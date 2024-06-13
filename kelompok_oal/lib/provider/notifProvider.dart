import 'dart:convert';
import 'package:flutter/material.dart';

class notifProvider extends ChangeNotifier {
  initialData() async {
    setData = listTile;
  }

  final listTile = {
    "data": [
      {
        "message":
            "kamu sudah meyelesaikan course Data Analys lihat pada aktivitas untuk melihat sertifikat kamu",
        "liding": "L",
        "treiling": "10.00",
      },
      {
        "message":
            "kamu sudah meyelesaikan course Web Depelopment lihat pada aktivitas untuk melihat sertifikat kamu",
        "liding": "L",
        "treiling": "03.00",
      },
      {
        "message":
            "Yuk, lihat course lainnya yang mungkin sesuai dengan minat kamu",
        "liding": "M",
        "treiling": "10.00",
      },
      {
        "message":
            "Progress pada course Data Science kamu sudah 30 % lanjutkan agar pemahamanmu semakin baik.",
        "liding": "D",
        "treiling": "12.20",
      },
      {
        "message":
            "Progress pada course Mobile Depelopment kamu sudah 50 % lanjutkan agar peluang kamu menjadi seorang Software Depelopment.",
        "liding": "D",
        "treiling": "12.20",
      },
    ]
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);

    notifyListeners();
  }

  ubahList(val) {
    if (val == 'baca') {
      setData = listTile;
    } else if (val == "Hapus") {
      setData = null;
    }
  }

  void markAllAsRead() {
    data['data']?.forEach((item) {
      item['baca'] = true;
    });
    notifyListeners();
  }
}
