class NoteModel {
  final String title;
  final String content;
  final String dateTime;
  bool? isFavorite;

  NoteModel({
    required this.title,
    required this.content,
    required this.dateTime,
    this.isFavorite,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'dateTime': dateTime,
      'isFavorite': isFavorite,
    };
  }

  NoteModel copyWith({
    String? title,
    String? content,
    String? dateTime,
    bool? isFavorite,
  }) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      dateTime: dateTime ?? this.dateTime,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      dateTime: json['dateTime'],
      isFavorite: json['isFavorite'],
    );
  }
}
