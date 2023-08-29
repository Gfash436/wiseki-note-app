class NoteModel {
  final String title;
  final String content;
  final String dateTime;

  NoteModel({
    required this.title,
    required this.content,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'dateTime': dateTime,
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      dateTime: json['dateTime'],
    );
  }
}
