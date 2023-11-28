

import 'package:flutter/material.dart';
import 'package:test_target_sistemas/views/home_view.dart';
import 'package:test_target_sistemas/views/note_view.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => HomeView(),
    '/note': (context) => const NoteView()
  }));
}
