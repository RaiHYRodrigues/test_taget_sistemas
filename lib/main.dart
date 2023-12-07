import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_target_sistemas/state/app_state.dart';
import 'package:test_target_sistemas/views/edit_view.dart';
import 'package:test_target_sistemas/views/login_view.dart';
import 'package:test_target_sistemas/views/loading_view.dart';
import 'package:test_target_sistemas/views/note_view.dart';

void main() {
  runApp(Provider(
    create: (_) => AppState()..initialize(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReactionBuilder(
        builder: (context) {
          return autorun((_) {
            final isLoading = appState.isLoading;

            if (isLoading) {
              const LoadingView();
            }
          });
        },
        child: Observer(
          builder: (context) {
            switch (appState.currentScreen) {
              case AppScreen.login:
                return const LoginView();
              case AppScreen.note:
                return const NoteView();
              case AppScreen.edit:
                return EditView(
                  id: appState.idToEdit,
                  text: appState.editedText,
                );
            }
          },
        ),
      ),
    );
  }
}
