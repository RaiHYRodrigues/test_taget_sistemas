// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_target_sistemas/services/mock_auth_provider.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  @observable
  AppScreen currentScreen = AppScreen.home;

  @observable
  bool isLogged = false;

  @observable
  bool isLoading = false;

  @observable
  ObservableMap<String, Object> notesMap =  ObservableMap<String, Object>.of({'id': 0, 'text': ''});

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
  Future<ObservableMap<String, Object>> loadNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var noteString = prefs.getString('notes');
    if (noteString != null) {
      Map<String, Object> notesDecoded = jsonDecode(noteString);
      return notesMap = ObservableMap<String, Object>.of(notesDecoded);
    } else {
      return notesMap = ObservableMap<String, Object>.of({});
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
    authProvider.logIn(context, user, password);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', true);
    isLogged = true;
    isLoading = false;
  }

  @action
  Future<void> createNotes(String text) async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var noteString = prefs.getString('notes');

    if (noteString == null) {
      var _notesMap = [
        {'id': 1, 'text': text}
      ];
      String notesEncoded = jsonEncode(_notesMap);
      Map<String, Object> notesDecoded = jsonDecode(notesEncoded);
      //Set our observable map for notes
      notesMap = ObservableMap<String, Object>.of(notesDecoded);
      //Set our shared preferences Map for notes
      prefs.setString('notes', notesEncoded);
      isLoading = false;
    } else {
      var notesDecoded = jsonDecode(noteString);
      int id = notesDecoded.length + 1;
      notesDecoded.add({'id': id, 'text': text});
      //Update our observable Map for notes
      notesMap = ObservableMap<String, Object>.of(notesDecoded);
      //Update our shared preferences Map for notes
      await prefs.setString('notes', jsonEncode(notesDecoded));
      isLoading = false;
    }
  }

  @action
  Future<void> editNote(int id, String newText) async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var noteString = prefs.getString('notes');

   if (noteString != null) {
      var notesDecoded = jsonDecode(noteString);
      int idToEdit = notesDecoded.indexWhere((element) => element['id'] == id);
      notesDecoded[idToEdit]['text'] = newText;
      notesMap = ObservableMap<String, Object>.of(notesDecoded);
      await prefs.setString('notes', jsonEncode(notesDecoded));
    }

    isLoading = false;
  }

  @action
  Future<void> deleteNote(int id) async {
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var noteString = prefs.getString('notes');
    if (noteString != null) {
      var notesDecoded = jsonDecode(noteString);
      int idToDelete =
          notesDecoded.indexWhere((element) => element['id'] == id);
      notesDecoded.removeAt(idToDelete);
      notesMap = ObservableMap<String, Object>.of(notesDecoded);
      await prefs.setString('notes', jsonEncode(notesDecoded));
    }
    isLoading = false;
  }
}

enum AppScreen { home, note }
