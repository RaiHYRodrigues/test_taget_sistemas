import 'package:flutter/material.dart';

import 'home_view.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:
              //Note View Elements
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
              ),
              const SizedBox(height: 100),
              TextButton(
                  onPressed: () {
                    launchInBrowser(Uri.parse('https://www.google.com.br/'));
                  },
                  child: const Text(
                    'Política de Privacidade',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
