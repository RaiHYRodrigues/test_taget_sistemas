// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  Computed<ObservableList<Note>>? _$sortedNotesComputed;

  @override
  ObservableList<Note> get sortedNotes => (_$sortedNotesComputed ??=
          Computed<ObservableList<Note>>(() => super.sortedNotes,
              name: '_AppState.sortedNotes'))
      .value;

  late final _$currentScreenAtom =
      Atom(name: '_AppState.currentScreen', context: context);

  @override
  AppScreen get currentScreen {
    _$currentScreenAtom.reportRead();
    return super.currentScreen;
  }

  @override
  set currentScreen(AppScreen value) {
    _$currentScreenAtom.reportWrite(value, super.currentScreen, () {
      super.currentScreen = value;
    });
  }

  late final _$editedTextAtom =
      Atom(name: '_AppState.editedText', context: context);

  @override
  String get editedText {
    _$editedTextAtom.reportRead();
    return super.editedText;
  }

  @override
  set editedText(String value) {
    _$editedTextAtom.reportWrite(value, super.editedText, () {
      super.editedText = value;
    });
  }

  late final _$idToEditAtom =
      Atom(name: '_AppState.idToEdit', context: context);

  @override
  int get idToEdit {
    _$idToEditAtom.reportRead();
    return super.idToEdit;
  }

  @override
  set idToEdit(int value) {
    _$idToEditAtom.reportWrite(value, super.idToEdit, () {
      super.idToEdit = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AppState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoggedAtom =
      Atom(name: '_AppState.isLogged', context: context);

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  late final _$obsNoteListAtom =
      Atom(name: '_AppState.obsNoteList', context: context);

  @override
  ObservableList<Note> get obsNoteList {
    _$obsNoteListAtom.reportRead();
    return super.obsNoteList;
  }

  @override
  set obsNoteList(ObservableList<Note> value) {
    _$obsNoteListAtom.reportWrite(value, super.obsNoteList, () {
      super.obsNoteList = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_AppState.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$logInAsyncAction =
      AsyncAction('_AppState.logIn', context: context);

  @override
  Future<void> logIn(BuildContext context, String user, String password) {
    return _$logInAsyncAction.run(() => super.logIn(context, user, password));
  }

  late final _$createNoteAsyncAction =
      AsyncAction('_AppState.createNote', context: context);

  @override
  Future<bool> createNote(String text) {
    return _$createNoteAsyncAction.run(() => super.createNote(text));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('_AppState.deleteNote', context: context);

  @override
  Future<bool> deleteNote(int id) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(id));
  }

  late final _$editNoteAsyncAction =
      AsyncAction('_AppState.editNote', context: context);

  @override
  Future<bool> editNote(int id, String newText) {
    return _$editNoteAsyncAction.run(() => super.editNote(id, newText));
  }

  @override
  String toString() {
    return '''
currentScreen: ${currentScreen},
editedText: ${editedText},
idToEdit: ${idToEdit},
isLoading: ${isLoading},
isLogged: ${isLogged},
obsNoteList: ${obsNoteList},
sortedNotes: ${sortedNotes}
    ''';
  }
}
