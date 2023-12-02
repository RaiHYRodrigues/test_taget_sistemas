import 'package:flutter/material.dart';

class EditView extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  final int? id;
  final String? text;
  EditView({super.key, this.id, this.text});

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
                  //List of notes inide this container
                  Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Center(
                                child: Text('Texto digitado $id',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            const Divider(),
                            Text(text ?? 'Agora é rezar'),
                          ],
                        ),
                      )),
                  const SizedBox(height: 50),

                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ));
  }
}
