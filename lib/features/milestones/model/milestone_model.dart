class Milestone {
  final String title;
  final String note;
  final String imagePath;

  Milestone({required this.title, required this.note, required this.imagePath});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'note': note,
      'imagePath': imagePath,
    };
  }

  factory Milestone.fromJson(Map<String, dynamic> json) {
    return Milestone(
      title: json['title'] ?? '',
      note: json['note'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}
