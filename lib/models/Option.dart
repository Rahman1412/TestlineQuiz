class Option {
  Option({
    this.id,
    required this.description,
    required this.questionId,
    required this.isCorrect,
    required this.createdAt,
    required this.updatedAt,
    required this.unanswered,
    required this.photoUrl
  });

  final int? id;
  final String? description;
  final int? questionId;
  final bool? isCorrect;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? unanswered;
  final dynamic photoUrl;

  factory Option.fromJson(Map<String, dynamic> json){
    return Option(
      id: json["id"],
      description: json["description"],
      questionId: json["question_id"],
      isCorrect: json["is_correct"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      unanswered: json["unanswered"],
      photoUrl: json["photo_url"]
    );
  }

}