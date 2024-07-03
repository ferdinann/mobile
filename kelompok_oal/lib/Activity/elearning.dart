import 'package:flutter/material.dart';
import 'package:kelompok_oal/provider/learning_provider.dart';
import 'package:provider/provider.dart';
import 'learning_card.dart';

class MyLearning extends StatefulWidget {
  const MyLearning({Key? key}) : super(key: key);

  @override
  State<MyLearning> createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {
  TextEditingController _searchController = TextEditingController();
  List<LearningPath> _filteredLearningPaths = [];
  bool _isSearchActive = false;
  List<String> _categories = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final learningProvider = context.read<LearningProvider>();
      learningProvider.loadLearningPaths();
      setState(() {
        _categories = _getCategories(learningProvider.learningPaths);
      });
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  List<String> _getCategories(List<LearningPath>? learningPaths) {
    final Set<String> categories = {};
    for (var path in learningPaths ?? []) {
      categories.add(path.title);
    }
    return categories.toList();
  }

  void _onSearchChanged() {
    final learningProvider = context.read<LearningProvider>();
    final searchQuery = _searchController.text.toLowerCase();

    setState(() {
      _filteredLearningPaths = learningProvider.learningPaths.where((path) {
        return path.title.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  void _onChipSelected(String category) {
    _searchController.text = category;
    _onSearchChanged();
  }

  void _toggleSearchBar(bool isActive) {
    setState(() {
      _isSearchActive = isActive;
      if (!_isSearchActive) {
        _searchController.clear();
        _filteredLearningPaths.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final learningProvider = context.watch<LearningProvider>();
    final learningPaths = _searchController.text.isEmpty
        ? learningProvider.learningPaths
        : _filteredLearningPaths;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar E-Learning Yang Ada'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onTap: () => _toggleSearchBar(true),
                  onChanged: (text) => _toggleSearchBar(true),
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).textTheme.bodyText1?.color,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6)
                          : Theme.of(context).textTheme.bodyText2?.color,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).colorScheme.surface
                        : Colors.white,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                if (_isSearchActive)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _categories.map((category) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ActionChip(
                            label: Text(
                              category,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            onPressed: () => _onChipSelected(category),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: learningPaths.isEmpty
                ? const Center(child: Text('None'))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 0.8,
                      children: learningPaths.map((path) {
                        return LearningCard(
                          title: path.title,
                          imagePath: path.imagePath,
                          studentCount: path.studentCount,
                          topicCount: path.topicCount,
                          materialCount: path.materialCount,
                          rating: path.rating.toStringAsFixed(2),
                        );
                      }).toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
