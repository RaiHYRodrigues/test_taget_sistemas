// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:test_target_sistemas/state/app_state.dart';
import 'package:test_target_sistemas/utilities.dart';

class NoteView extends HookWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    final TextEditingController controller = TextEditingController();
    return Container(
        //Gradient BackGround
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFF1E4E62), Color(0xFF2D958E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: GestureDetector(
          onTap: () {
            focusNode.requestFocus();
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body:
                //Note View Elements
                Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(child: SizedBox()),
                  //List of notes inide this container
                  Container(
                    height: 280,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const NotesList(),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                        onSubmitted: (text) {
                          final text = controller.text;
                          final checkedText = text.trim();
                          if (checkedText.isNotEmpty) {
                            context.read<AppState>().createNote(text);
                          } else {
                            notFilledDialog(context);
                          }
                        },
                        controller: controller,
                        focusNode: focusNode,
                        autofocus: true,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                            hintText: 'Digite seu texto',
                            counterText: '',
                            contentPadding: EdgeInsets.all(8),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)))),
                  ),
                  const SizedBox(height: 50),
                  TextButton(
                      onPressed: () {
                        launchInBrowser(
                            Uri.parse('https://www.google.com.br/'));
                      },
                      child: const Text(
                        'Política de Privacidade',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ));
  }
}

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemCount: appState.sortedNotes.length,
          itemBuilder: (context, index) {
            final note = appState.sortedNotes[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                          onPressed: () {
                            appState.goToEdit(
                              note.id,
                              note.text,
                            );
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deleteDialog(context, appState, note.id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                    child: Text(
                      note.text,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
