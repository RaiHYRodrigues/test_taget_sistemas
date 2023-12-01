// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notes.g.dart';

// ignore: library_private_types_in_public_api
class Notes = _Notes with _$Notes;

abstract class _Notes with Store {
  final SharedPreferences _prefs;
  _Notes(this._prefs){
_loadNotes();
  }
ObservableList<Map<String, dynamic>> notes = ObservableList<Map<String, dynamic>>();

@action
  Future<void> _loadNotes() async {
    final String? notesJson = _prefs.getString('notes');
  if (notesJson != null) {
      List<dynamic> notes = jsonDecode(notesJson);
      
  
    }
}}
