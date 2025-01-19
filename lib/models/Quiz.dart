import 'Questions.dart';

class Quiz {
  Quiz({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    required this.topic,
    required this.time,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.duration,
    required this.endTime,
    required this.negativeMarks,
    required this.correctAnswerMarks,
    required this.shuffle,
    required this.showAnswers,
    required this.lockSolutions,
    required this.isForm,
    required this.showMasteryOption,
    required this.readingMaterial,
    required this.quizType,
    required this.isCustom,
    required this.bannerId,
    required this.examId,
    required this.showUnanswered,
    required this.endsAt,
    required this.lives,
    required this.liveCount,
    required this.coinCount,
    required this.questionsCount,
    required this.dailyDate,
    required this.maxMistakeCount,
    required this.readingMaterials,
    required this.questions,
    required this.progress,
  });

  final int? id;
  final dynamic name;
  final String? title;
  final String? description;
  final dynamic difficultyLevel;
  final String? topic;
  final DateTime? time;
  final bool? isPublished;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? duration;
  final DateTime? endTime;
  final String? negativeMarks;
  final String? correctAnswerMarks;
  final bool? shuffle;
  final bool? showAnswers;
  final bool? lockSolutions;
  final bool? isForm;
  final bool? showMasteryOption;
  final dynamic readingMaterial;
  final dynamic quizType;
  final bool? isCustom;
  final dynamic bannerId;
  final dynamic examId;
  final bool? showUnanswered;
  final DateTime? endsAt;
  final dynamic lives;
  final String? liveCount;
  final int? coinCount;
  final int? questionsCount;
  final String? dailyDate;
  final int? maxMistakeCount;
  final List<dynamic> readingMaterials;
  final List<Questions> questions;
  final int? progress;

  factory Quiz.fromJson(Map<String, dynamic> json){
    return Quiz(
      id: json["id"],
      name: json["name"],
      title: json["title"],
      description: json["description"],
      difficultyLevel: json["difficulty_level"],
      topic: json["topic"],
      time: DateTime.tryParse(json["time"] ?? ""),
      isPublished: json["is_published"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      duration: json["duration"],
      endTime: DateTime.tryParse(json["end_time"] ?? ""),
      negativeMarks: json["negative_marks"],
      correctAnswerMarks: json["correct_answer_marks"],
      shuffle: json["shuffle"],
      showAnswers: json["show_answers"],
      lockSolutions: json["lock_solutions"],
      isForm: json["is_form"],
      showMasteryOption: json["show_mastery_option"],
      readingMaterial: json["reading_material"],
      quizType: json["quiz_type"],
      isCustom: json["is_custom"],
      bannerId: json["banner_id"],
      examId: json["exam_id"],
      showUnanswered: json["show_unanswered"],
      endsAt: DateTime.tryParse(json["ends_at"] ?? ""),
      lives: json["lives"],
      liveCount: json["live_count"],
      coinCount: json["coin_count"],
      questionsCount: json["questions_count"],
      dailyDate: json["daily_date"],
      maxMistakeCount: json["max_mistake_count"],
      readingMaterials: json["reading_materials"] == null ? [] : List<dynamic>.from(json["reading_materials"]!.map((x) => x)),
      questions: json["questions"] == null ? [] : List<Questions>.from(json["questions"]!.map((x) => Questions.fromJson(x))),
      progress: json["progress"],
    );
  }

}
