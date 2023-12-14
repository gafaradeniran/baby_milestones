// milestone.dart

class Milestone {
  final String title;
  final String note;
  final String imagePath; // Path to the image file or URL

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


//test data
// List<Milestone> milestone = [
//   Milestone(
//     imagePath: AssetResources.onboarding1,
//     title: 'Baby First Word',
//     note:
//         'Toda, my baby ultered his first word, he said daddy!. today is indeed a great day',
//   ),
//   Milestone(
//     imagePath: AssetResources.onboarding2,
//     title: 'Baby Travels',
//     note:
//         'Toda, my baby ultered his first word, he said daddy!. today is indeed a great day',
//   ),
// ];
