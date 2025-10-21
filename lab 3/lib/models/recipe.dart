class Recipe {
  final String category;
  final String imagePath;
  final String title;
  final double rating;
  final String time;

  Recipe({
    required this.category,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.time,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      category: json['category'] ?? '',
      imagePath: json['imagePath'] ?? '',
      title: json['title'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'imagePath': imagePath,
      'title': title,
      'rating': rating,
      'time': time,
    };
  }

  @override
  String toString() {
    return 'Recipe{category: $category, imagePath: $imagePath, title: $title, rating: $rating, time: $time}';
  }
}
