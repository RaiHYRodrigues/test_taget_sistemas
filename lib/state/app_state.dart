import 'package:mobx/mobx.dart';
import 'package:test_target_sistemas/state/note.dart';

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
  ObservableList<Note> notes = ObservableList<Note>();

  @computed
  ObservableList<Note> get sortedNotes => ObservableList.of(notes.sorted());

  @action
  void goTo(AppScreen screen) {
    currentScreen = screen;
  }

  @action
  Future<bool> delete(Note note) async {
    isLoading = true;
    notes.removeWhere((element) => element.id == note.id);
    isLoading = false;
    return true;
  }
}

abstract class _DocumentKeys {
  static const text = 'text';
  static const creationDate = 'creation_date';
}

extension Sorted on List<Note> {
  List<Note> sorted() => [...this]..sort((top, bot) {
      return top.creationDate.compareTo(bot.creationDate);
    });
}

enum AppScreen { home, note }
