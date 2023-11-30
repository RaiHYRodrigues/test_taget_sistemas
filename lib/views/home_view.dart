import 'package:flutter/material.dart';

import 'package:test_target_sistemas/components/auth_form.dart';
import 'package:test_target_sistemas/services/auth/mock_auth_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final userController = TextEditingController();
  final passwordController = TextEditingController();
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
              // Home View Elements
              Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Center(
                child: AuthForm(
                    user: userController, password: passwordController),
              ),
              const SizedBox(height: 30),
              // 'Entrar' Button
              ElevatedButton(
                onPressed: () async {
                  final user = userController.text;
                  final password = passwordController.text;
                  MockAuthProvider authProvider = MockAuthProvider();
                  await authProvider.logIn(context, user, password);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.green,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              // 'Política de Privacidade' Button
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

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
