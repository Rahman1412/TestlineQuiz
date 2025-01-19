class PracticeMaterial {
  PracticeMaterial({
    required this.content,
    required this.keywords,
  });

  final List<String> content;
  final List<String> keywords;

  factory PracticeMaterial.fromJson(Map<String, dynamic> json){
    return PracticeMaterial(
      content: json["content"] == null ? [] : List<String>.from(json["content"]!.map((x) => x)),
      keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
    );
  }

}