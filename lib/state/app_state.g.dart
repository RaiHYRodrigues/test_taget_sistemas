// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
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

  late final _$notesMapAtom =
      Atom(name: '_AppState.notesMap', context: context);

  @override
  ObservableMap<String, Object> get notesMap {
    _$notesMapAtom.reportRead();
    return super.notesMap;
  }

  @override
  set notesMap(ObservableMap<String, Object> value) {
    _$notesMapAtom.reportWrite(value, super.notesMap, () {
      super.notesMap = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_AppState.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$loadNotesAsyncAction =
      AsyncAction('_AppState.loadNotes', context: context);

  @override
  Future<void> loadNotes() {
    return _$loadNotesAsyncAction.run(() => super.loadNotes());
  }

  late final _$logInAsyncAction =
      AsyncAction('_AppState.logIn', context: context);

  @override
  Future<void> logIn(BuildContext context, String user, String password) {
    return _$logInAsyncAction.run(() => super.logIn(context, user, password));
  }

  late final _$createNotesAsyncAction =
      AsyncAction('_AppState.createNotes', context: context);

  @override
  Future<void> createNotes(String text) {
    return _$createNotesAsyncAction.run(() => super.createNotes(text));
  }

  late final _$editNoteAsyncAction =
      AsyncAction('_AppState.editNote', context: context);

  @override
  Future<void> editNote(int? id, String? newText) {
    return _$editNoteAsyncAction.run(() => super.editNote(id, newText));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('_AppState.deleteNote', context: context);

  @override
  Future<void> deleteNote({required int id}) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(id: id));
  }

  @override
  String toString() {
    return '''
currentScreen: ${currentScreen},
isLoading: ${isLoading},
notesMap: ${notesMap}
    ''';
  }
}
