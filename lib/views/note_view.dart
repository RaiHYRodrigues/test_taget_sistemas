// ignore_for_file: public_member_api_docs, sort_constructors_first,
import 'package:flutter/material.dart';
import 'package:test_target_sistemas/utilities.dart';

import 'home_view.dart';

class NoteView extends StatelessWidget {
  NoteView({super.key});

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            _focusNode.requestFocus();
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body:
                //Note View Elements
                Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    height: 280,
                    width: 280,
                    child: Column(children: [
                      Card(
                        child: ListTile(
                            contentPadding: EdgeInsets.only(left: 4, right: 2),
                            leading: Text('Texto Digitado 1'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child:
                                        Icon(Icons.edit, color: Colors.black)),
                                TextButton(
                                    onPressed: () {
                                      deleteDialog(context);
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ))
                              ],
                            )),
                      )
                    ]),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
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

class NoteTile extends StatelessWidget {
  final int noteIndex;

  const NoteTile({
    Key? key,
    required this.noteIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Texto digitado $noteIndex'),
    );
  }
}
