import 'package:flutter/material.dart';

import 'package:test_target_sistemas/components/auth_form.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFF1E4E62), Color(0xFF2D958E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Center(child: AuthForm()),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.green,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              TextButton(
                  onPressed: () {
                    _launchInBrowser(Uri.parse('https://www.google.com.br/'));
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

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
