// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

part 'note.g.dart';

// ignore: library_private_types_in_public_api
class Note = _Note with _$Note;

abstract class _Note with Store {
  final String id;
  final DateTime creationDate;

  @observable
  String text;

  _Note({
    required this.id,
    required this.creationDate,
    required this.text,
  });

  @override
  bool operator ==(covariant _Note other) =>
      id == other.id &&
      text == other.text &&
      creationDate == other.creationDate;

  @override
  int get hashCode => Object.hash(
        id,
        creationDate,
        text,
      );
}
