import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_target_sistemas/state/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> deleteDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deseja apagar o texto?'),
          content: const Text('O texto não poderá ser recuperado'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar')),
            TextButton(onPressed: () {
              
             
            }, child: const Text('Sim'))
          ],
        );
      });
}

Future<void> logOutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sair'),
          content: const Text('Todos os textos deste usuário serão perdidos'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar')),
            TextButton(onPressed: () {
              //Appstate Log Out
              }, child: const Text('Sim'))
          ],
        );
      });
}

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}