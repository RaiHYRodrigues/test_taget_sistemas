import 'package:flutter/material.dart';
import 'package:test_target_sistemas/views/edit_view.dart';
import 'package:test_target_sistemas/views/home_view.dart';
import 'package:test_target_sistemas/views/loading_view.dart';
import 'package:test_target_sistemas/views/note_view.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/edit', routes: {
    '/': (context) => HomeView(),
    '/note': (context) => NoteView(),
    '/loading': (context) => const LoadingView(),
    '/edit': (context) => EditView(
          id: 3,
          text:
              "Deu certo",
        )
  }));
}
