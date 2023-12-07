// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_target_sistemas/services/auth_service/mock_auth_provider.dart';
import 'package:test_target_sistemas/services/note_service/note.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  late SharedPreferences prefs;

  @observable
  AppScreen currentScreen = AppScreen.login;

  @observable
  bool isLoading = false;

  @observable
  bool isLogged = false;

  @observable
  ObservableList<Note> obsNoteList = ObservableList<Note>();

  @computed
  ObservableList<Note> get sortedNotes =>
      ObservableList.of(obsNoteList.sorted());

  @action
  Future<void> initialize() async {
    isLoading = true;
    prefs = await SharedPreferences.getInstance();

    List<Note>? _notes = await _getNotes(prefs);

    final bool checkLogin = prefs.getBool('isLogged') ?? false;

    if (checkLogin == false) {
      currentScreen = AppScreen.login;
      isLoading = false;
    } else if (_notes != null) {
      obsNoteList.addAll(_notes);

      currentScreen = AppScreen.note;

      isLoading = false;
    }
  }

  @action
  Future<void> logIn(
    BuildContext context,
    String user,
    String password,
  ) async {
    isLoading = true;
    MockAuthProvider authProvider = MockAuthProvider();
    final authStatus = await authProvider.logIn(context, user, password);

    if (authStatus) {
      prefs.setBool('isLogged', true);

      currentScreen = AppScreen.note;
      isLoading = false;
    }
  }

  @action
  Future<bool> createNote(String text) async {
    isLoading = true;

    final String creationDate = DateTime.now().toString();
    final id = obsNoteList.length + 1;
    List<String> _noteStringList = prefs.getStringList('notes') ?? [];
    bool idExists = obsNoteList.any((note) => false == id);

    while (idExists) {
      id + 1;
      idExists = obsNoteList.any((note) => note.id == id);
    }

    final note = Note(
      id: id,
      creationDate: creationDate,
      text: text,
    );
    //add in shared preferences
    _noteStringList.add(jsonEncode(note.toJson()));
    prefs.setStringList('notes', _noteStringList);
    //add in the observable
    obsNoteList.add(note);

    isLoading = false;
    return true;
  }
  Future<bool> deleteNote(int id) async {
  isLoading = true;

  List<String> _noteStringList = prefs.getStringList('notes') ?? [];
  List<Note> notes = [];

  for (String noteString in _noteStringList) {
    Note note = Note.fromJson(jsonDecode(noteString));
    notes.add(note);
  }

  int indexToDelete = notes.indexWhere((note) => note.id == id);

  if (indexToDelete != -1) {
    notes.removeAt(indexToDelete);

    // Update SharedPreferences
    _noteStringList = notes.map((note) => jsonEncode(note.toJson())).toList();
    prefs.setStringList('notes', _noteStringList);

    // Update the observable list
    obsNoteList.removeWhere((note) => note.id == id);

    isLoading = false;
    return true;
  } else {
    isLoading = false;
    return false; 
  }
}
 
}

extension Sorted on List<Note> {
  List<Note> sorted() => [...this]..sort((lhs, rhs) {
      DateTime lhsDate = DateTime.parse(lhs.creationDate);
      DateTime rhsDate = DateTime.parse(rhs.creationDate);
      return lhsDate.compareTo(rhsDate);
    });
}

Future<List<Note>?> _getNotes(SharedPreferences _prefs) async {
  final List<String> noteStringList = _prefs.getStringList('notes') ?? [];
  List<Note> noteList = [];

  if (noteStringList.isNotEmpty) {
    for (String noteString in noteStringList) {
      Map<String, dynamic> noteMap = jsonDecode(noteString);
      Note note = Note.fromJson(noteMap);
      noteList.add(note);
    }

    return noteList;
  }
  return null;
}

Future<void> _setNotes(List<Note> noteList, SharedPreferences _prefs) async {
  List<String> noteStringlist = [];
  for (Note note in noteList) {
    noteStringlist.add(jsonEncode(note.toJson()));
  }
}

enum AppScreen { login, note, edit }
