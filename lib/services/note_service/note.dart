// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  final int id;
  String text;
  final String creationDate;

  Note({
    required this.id,
    required this.text,
    required this.creationDate,
  });

  factory Note.fromJson(Map<String, dynamic> noteJson) {
    return Note(
      id: noteJson['id'],
      text: noteJson['text'],
      creationDate: noteJson['creationDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final noteJson = {
      'id': id,
      'text': text,
      'creationDate': creationDate,
    };
    return noteJson;
  }
}
