import 'package:flutter/material.dart';

class LearningPath {
  final String title;
  final String imagePath;
  final String studentCount;
  final String topicCount;
  final String materialCount;
  final double rating;

  LearningPath({
    required this.title,
    required this.imagePath,
    required this.studentCount,
    required this.topicCount,
    required this.materialCount,
    required this.rating,
  });
}

class LearningProvider with ChangeNotifier {
  List<LearningPath> _learningPaths = [];
  List<LearningPath> get learningPaths => _learningPaths;

  void loadLearningPaths() {
    _learningPaths = [
      LearningPath(
        title: 'Digital Marketing',
        imagePath: 'assets/images/digital.jpeg',
        studentCount: '41.972',
        topicCount: '12',
        materialCount: '149',
        rating: 4.58,
      ),
      LearningPath(
        title: 'Data Science',
        imagePath: 'assets/images/data.jpeg',
        studentCount: '23.301',
        topicCount: '9',
        materialCount: '145',
        rating: 4.53,
      ),
      LearningPath(
        title: 'Data Analis',
        imagePath: 'assets/images/data_analis.png',
        studentCount: '23.000',
        topicCount: '8',
        materialCount: '200',
        rating: 4.0,
      ),
      LearningPath(
        title: 'English',
        imagePath: 'assets/images/eng.jpeg',
        studentCount: '65.000',
        topicCount: '5',
        materialCount: '100',
        rating: 5.0,
      ),
      LearningPath(
        title: 'Cyber Network',
        imagePath: 'assets/images/cyber.jpeg',
        studentCount: '52.942',
        topicCount: '8',
        materialCount: '59',
        rating: 4.59,
      ),
      LearningPath(
        title: 'Cripto',
        imagePath: 'assets/images/criptograpi.jpeg',
        studentCount: '9.678',
        topicCount: '5',
        materialCount: '78',
        rating: 4.6,
      ),
      LearningPath(
        title: 'mobile Flutter',
        imagePath: 'assets/images/flutter.jpeg',
        studentCount: '35.369',
        topicCount: '10',
        materialCount: '50',
        rating: 4.67,
      ),
      LearningPath(
        title: 'Bahasa Indonesia',
        imagePath: 'assets/images/idn.jpeg',
        studentCount: '15.000',
        topicCount: '5',
        materialCount: '15',
        rating: 4.12,
      ),
      LearningPath(
        title: 'JavaScript',
        imagePath: 'assets/images/js.png',
        studentCount: '41.856',
        topicCount: '20',
        materialCount: '100',
        rating: 4.8,
      ),
      LearningPath(
        title: 'Mobile Developer',
        imagePath: 'assets/images/mobile.jpeg',
        studentCount: '38.143',
        topicCount: '8',
        materialCount: '67',
        rating: 4.5,
      ),
      LearningPath(
        title: 'Scient Matematics',
        imagePath: 'assets/images/mtk.jpeg',
        studentCount: '45.735',
        topicCount: '25',
        materialCount: '112',
        rating: 3.76,
      ),
      LearningPath(
        title: 'Python',
        imagePath: 'assets/images/python.jpeg',
        studentCount: '38.798',
        topicCount: '12',
        materialCount: '32',
        rating: 4.31,
      ),
      LearningPath(
        title: 'Pengertian Skolastik',
        imagePath: 'assets/images/skolastik.jpeg',
        studentCount: '20.156',
        topicCount: '5',
        materialCount: '35',
        rating: 3.12,
      ),
      LearningPath(
        title: 'Tips Lolos Snbp',
        imagePath: 'assets/images/snbp.jpeg',
        studentCount: '65.462',
        topicCount: '20',
        materialCount: '210',
        rating: 3.86,
      ),
      LearningPath(
        title: 'Soal-Soal UTBK',
        imagePath: 'assets/images/snbt.jpeg',
        studentCount: '54.846',
        topicCount: '17',
        materialCount: '165',
        rating: 4.35,
      ),
      LearningPath(
        title: 'Literasi Teknologi',
        imagePath: 'assets/images/teknologi.jpeg',
        studentCount: '37.943',
        topicCount: '7',
        materialCount: '60',
        rating: 3.45,
      ),
      LearningPath(
        title: 'Web Development',
        imagePath: 'assets/images/web.jpeg',
        studentCount: '48.672',
        topicCount: '14',
        materialCount: '103',
        rating: 3.89,
      ),
    ];
    notifyListeners();
  }
}
