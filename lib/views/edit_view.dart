import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:test_target_sistemas/state/app_state.dart';

class EditView extends HookWidget {
  
  final int? id;
  final String? text;
  const EditView({super.key, this.id, this.text});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text:text);
    final FocusNode focusNode = FocusNode();
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
                            TextField(
                              onSubmitted: (text) {
                          final text = controller.text;
                          
                        
                        },
                              maxLines: null,
                              expands: true,
                              keyboardType: TextInputType.multiline,
                              controller: controller,
                              
                            ),
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
