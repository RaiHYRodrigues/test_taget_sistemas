import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_target_sistemas/services/mock_auth_provider.dart';
import 'package:test_target_sistemas/state/notes.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  @observable
  AppScreen currentScreen = AppScreen.home;

  @observable
  bool isLogged = false;

  @observable
  bool isLoading = false;

  

  @action
  Future<void> initialize() async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool checkLogin = prefs.getBool('isLogged') ?? false;
    if (checkLogin == false) {
      currentScreen = AppScreen.home;
      isLoading = false;
    } else {
      currentScreen = AppScreen.note;
      isLoading = false;
      isLogged = true;
      
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
    await authProvider.logIn(context, user, password);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', true);
    isLogged = true;
    isLoading = false;
  }

  @action
  Future<void> createNotes(String text) async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var notes = prefs.getString('notes');

    if (notes == null) {
      var notesJson = [
        {'id': 1, 'text': text}
      ];
      await prefs.setString('notes', jsonEncode(notesJson));
    } else {
      var notesJson = jsonDecode(notes);
      int id = notesJson.length + 1;
      notesJson.add({'id': id, 'text': text});
      await prefs.setString('notes', jsonEncode(notesJson));
    }
  }

  @action
  Future<void> editNote(int id, String newText) async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var notes = prefs.getString('notes');

    if (notes != null) {
      var notesJson = jsonDecode(notes);

      int indexToEdit = notesJson.indexWhere((element) => element['id'] == id);

      notesJson[indexToEdit]['text'] = newText;

      await prefs.setString('notes', jsonEncode(notesJson));
    }

    isLoading = false;
  }

  @action
  Future<void> deleteNote(int id) async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var notes = prefs.getString('notes');
    if (notes != null) {
      var notesJson = jsonDecode(notes);
      int indexToDelete =
          notesJson.indexWhere((element) => element['id'] == id);
      notesJson.removeAt(indexToDelete);
      await prefs.setString('notes', jsonEncode(notesJson));
    }
    isLoading = false;
  }
}

enum AppScreen { home, note }

