import 'Option.dart';
import 'ReadingMaterial.dart';

class Questions {
  Questions({
    required this.id,
    required this.description,
    required this.difficultyLevel,
    required this.topic,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.detailedSolution,
    required this.type,
    required this.isMandatory,
    required this.showInFeed,
    required this.pyqLabel,
    required this.topicId,
    required this.readingMaterialId,
    required this.fixedAt,
    required this.fixSummary,
    required this.createdBy,
    required this.updatedBy,
    required this.quizLevel,
    required this.questionFrom,
    required this.language,
    required this.photoUrl,
    required this.photoSolutionUrl,
    required this.isSaved,
    required this.tag,
    required this.options,
    required this.readingMaterial,
    this.selectedOption,
    this.isCorrect
  });

  final int? id;
  final String? description;
  final dynamic difficultyLevel;
  final String? topic;
  final bool? isPublished;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? detailedSolution;
  final String? type;
  final bool? isMandatory;
  final bool? showInFeed;
  final String? pyqLabel;
  final int? topicId;
  final int? readingMaterialId;
  final DateTime? fixedAt;
  final String? fixSummary;
  final dynamic createdBy;
  final String? updatedBy;
  final dynamic quizLevel;
  final String? questionFrom;
  final dynamic language;
  final dynamic photoUrl;
  final dynamic photoSolutionUrl;
  final bool? isSaved;
  final String? tag;
  final List<Option> options;
  final ReadingMaterial? readingMaterial;
  String? selectedOption;
  bool? isCorrect;

  factory Questions.fromJson(Map<String, dynamic> json){
    return Questions(
      id: json["id"],
      description: json["description"],
      difficultyLevel: json["difficulty_level"],
      topic: json["topic"],
      isPublished: json["is_published"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      detailedSolution: json["detailed_solution"],
      type: json["type"],
      isMandatory: json["is_mandatory"],
      showInFeed: json["show_in_feed"],
      pyqLabel: json["pyq_label"],
      topicId: json["topic_id"],
      readingMaterialId: json["reading_material_id"],
      fixedAt: DateTime.tryParse(json["fixed_at"] ?? ""),
      fixSummary: json["fix_summary"],
      createdBy: json["created_by"],
      updatedBy: json["updated_by"],
      quizLevel: json["quiz_level"],
      questionFrom: json["question_from"],
      language: json["language"],
      photoUrl: json["photo_url"],
      photoSolutionUrl: json["photo_solution_url"],
      isSaved: json["is_saved"],
      tag: json["tag"],
      options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
      readingMaterial: json["reading_material"] == null ? null : ReadingMaterial.fromJson(json["reading_material"]),
      selectedOption : json["selectedOption"] ?? "",
      isCorrect: json["isCorrect"] ?? false
    );
  }

}






