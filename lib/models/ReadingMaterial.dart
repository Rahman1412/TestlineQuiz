import 'PracticeMaterial.dart';

class ReadingMaterial {
  ReadingMaterial({
    required this.id,
    required this.keywords,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.contentSections,
    required this.practiceMaterial,
  });

  final int? id;
  final String? keywords;
  final dynamic content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String> contentSections;
  final PracticeMaterial? practiceMaterial;

  factory ReadingMaterial.fromJson(Map<String, dynamic> json){
    return ReadingMaterial(
      id: json["id"],
      keywords: json["keywords"],
      content: json["content"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      contentSections: json["content_sections"] == null ? [] : List<String>.from(json["content_sections"]!.map((x) => x)),
      practiceMaterial: json["practice_material"] == null ? null : PracticeMaterial.fromJson(json["practice_material"]),
    );
  }

}