import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  List<QuizModel> _quizzes = [
    QuizModel(
      question: "Soal 1: Apa itu Flutter?",
      rightAnswer:
          "Flutter adalah kerangka kerja UI yang digunakan untuk membangun aplikasi seluler, desktop, dan web.",
      wrongAnswers: [
        "Flutter adalah bahasa pemrograman.",
        "Flutter adalah sistem operasi.",
        "Flutter adalah perusahaan teknologi.",
      ],
    ),
    QuizModel(
      question: "Soal 2: Apa itu Provider?",
      rightAnswer:
          "Provider adalah cara untuk membuat data tersedia di seluruh aplikasi tanpa perlu membuat banyak referensi ke data tersebut.",
      wrongAnswers: [
        "Provider adalah bahasa pemrograman.",
        "Provider adalah sistem operasi.",
        "Provider adalah perusahaan teknologi.",
      ],
    ),
    // Penambahan soal-soal baru
    QuizModel(
      question: "Soal 3: Apa kegunaan StatelessWidget dalam Flutter?",
      rightAnswer:
          "StatelessWidget digunakan untuk widget yang tidak memerlukan perubahan state selama siklus hidup aplikasi.",
      wrongAnswers: [
        "StatelessWidget digunakan untuk membuat aplikasi berbasis state.",
        "StatelessWidget digunakan untuk mengatur state aplikasi.",
        "StatelessWidget digunakan untuk menampilkan data dari database.",
      ],
    ),
    QuizModel(
      question:
          "Soal 4: Apa perbedaan antara StatelessWidget dan StatefulWidget?",
      rightAnswer:
          "StatefulWidget dapat memiliki state yang berubah, sedangkan StatelessWidget tidak.",
      wrongAnswers: [
        "StatefulWidget hanya bisa digunakan untuk aplikasi Android.",
        "StatefulWidget tidak bisa digunakan untuk membuat tata letak.",
        "StatefulWidget hanya bisa digunakan dalam mode pengembangan.",
      ],
    ),
    QuizModel(
      question: "Soal 5: Apa itu widget di Flutter?",
      rightAnswer:
          "Widget adalah elemen dasar dari antarmuka pengguna Flutter, seperti tombol atau tata letak.",
      wrongAnswers: [
        "Widget adalah bahasa pemrograman.",
        "Widget adalah sistem operasi.",
        "Widget adalah perusahaan teknologi.",
      ],
    ),
    QuizModel(
      question: "Soal 6: Apa itu MaterialApp dalam Flutter?",
      rightAnswer:
          "MaterialApp adalah widget yang menyediakan beberapa fitur bawaan untuk aplikasi yang mengikuti pedoman Material Design.",
      wrongAnswers: [
        "MaterialApp adalah metode pembayaran dalam aplikasi Flutter.",
        "MaterialApp adalah jenis perangkat keras.",
        "MaterialApp adalah merek ponsel pintar.",
      ],
    ),
    QuizModel(
      question: "Soal 7: Apa itu setState dalam Flutter?",
      rightAnswer:
          "setState adalah metode yang digunakan untuk memperbarui tampilan widget ketika terjadi perubahan state.",
      wrongAnswers: [
        "setState adalah metode pembayaran dalam aplikasi Flutter.",
        "setState adalah jenis widget.",
        "setState adalah merek ponsel pintar.",
      ],
    ),
    QuizModel(
      question: "Soal 8: Apa itu StatefulWidget dalam Flutter?",
      rightAnswer:
          "StatefulWidget adalah widget yang memiliki state yang dapat berubah selama siklus hidup aplikasi.",
      wrongAnswers: [
        "StatefulWidget adalah widget yang tidak memiliki tampilan.",
        "StatefulWidget adalah widget yang hanya bisa digunakan sekali.",
        "StatefulWidget adalah widget yang tidak bisa berinteraksi dengan pengguna.",
      ],
    ),
    QuizModel(
      question: "Soal 9: Apa yang dimaksud dengan hot reload dalam Flutter?",
      rightAnswer:
          "Hot reload adalah fitur Flutter yang memungkinkan pengembang melihat perubahan kode tanpa harus me-restart aplikasi dari awal.",
      wrongAnswers: [
        "Hot reload adalah jenis ponsel pintar.",
        "Hot reload adalah perintah untuk mematikan aplikasi Flutter.",
        "Hot reload adalah metode pembayaran dalam aplikasi Flutter.",
      ],
    ),
    QuizModel(
      question: "Soal 10: Apa itu widget tree dalam Flutter?",
      rightAnswer:
          "Widget tree adalah hierarki dari semua widget yang digunakan dalam aplikasi Flutter.",
      wrongAnswers: [
        "Widget tree adalah jenis pohon di hutan.",
        "Widget tree adalah alat untuk menyiram tanaman.",
        "Widget tree adalah perangkat keras.",
      ],
    ),
    QuizModel(
      question: "Soal 11: Apa itu framework dalam Flutter?",
      rightAnswer:
          "Framework adalah kerangka kerja yang menyediakan struktur dan komponen untuk membangun aplikasi.",
      wrongAnswers: [
        "Framework adalah perangkat keras.",
        "Framework adalah bahasa pemrograman.",
        "Framework adalah jenis buku.",
      ],
    ),
    QuizModel(
      question: "Soal 12: Apa itu widget Stateless dalam Flutter?",
      rightAnswer:
          "Stateless widget adalah widget yang tidak menyimpan state internal.",
      wrongAnswers: [
        "Stateless widget adalah widget yang harus selalu berubah.",
        "Stateless widget adalah widget yang hanya bisa digunakan sekali.",
        "Stateless widget adalah widget yang memiliki tampilan statis.",
      ],
    ),
    QuizModel(
      question: "Soal 13: Apa itu widget StatefulWidget dalam Flutter?",
      rightAnswer:
          "Stateful widget adalah widget yang dapat menyimpan dan mengelola state.",
      wrongAnswers: [
        "Stateful widget adalah widget yang tidak dapat berubah.",
        "Stateful widget adalah widget yang hanya bisa digunakan sekali.",
        "Stateful widget adalah widget yang tidak bisa berinteraksi dengan pengguna.",
      ],
    ),
    QuizModel(
      question: "Soal 14: Apa itu widget MaterialApp dalam Flutter?",
      rightAnswer:
          "MaterialApp adalah widget yang mengimplementasikan desain dan perilaku aplikasi yang direkomendasikan oleh Material Design.",
      wrongAnswers: [
        "MaterialApp adalah widget yang hanya bisa digunakan untuk aplikasi Android.",
        "MaterialApp adalah widget yang hanya bisa digunakan untuk membuat tata letak.",
        "MaterialApp adalah widget yang hanya bisa digunakan dalam mode pengembangan.",
      ],
    ),
    QuizModel(
      question: "Soal 15: Apa itu package dalam Flutter?",
      rightAnswer:
          "Package adalah kumpulan kode yang dapat digunakan kembali yang mengandung fitur atau fungsi tertentu.",
      wrongAnswers: [
        "Package adalah jenis ponsel pintar.",
        "Package adalah perintah untuk mematikan aplikasi Flutter.",
        "Package adalah metode pembayaran dalam aplikasi Flutter.",
      ],
    ),
  ];

  List<QuizModel> get quizzes => _quizzes;
  int _currentQuizIndex = 0;

  int get currentQuizIndex => _currentQuizIndex;
  void nextQuiz() {
    _currentQuizIndex++;
    if (_currentQuizIndex >= _quizzes.length) {
      _currentQuizIndex = 0;
    }
    notifyListeners();
  }

  void previousQuiz() {
    _currentQuizIndex--;
    if (_currentQuizIndex < 0) {
      _currentQuizIndex = _quizzes.length - 1;
    }
    notifyListeners();
  }

  QuizModel get currentQuiz => _quizzes[_currentQuizIndex];
}

class QuizModel {
  String question;
  String rightAnswer;
  List<String> wrongAnswers;
  String? selectedAnswer;

  QuizModel({
    required this.question,
    required this.rightAnswer,
    required this.wrongAnswers,
    this.selectedAnswer,
  });
}
