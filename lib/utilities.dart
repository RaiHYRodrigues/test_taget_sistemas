import 'package:flutter/material.dart';

import 'package:test_target_sistemas/state/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> deleteDialog(BuildContext context, AppState appState, int id) {
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
            TextButton(
                onPressed: () {
                  appState.deleteNote(id);
                  Navigator.of(context).pop();
                },
                child: const Text('Sim'))
          ],
        );
      });
}

Future<void> notFilledDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Não Preenchido!', style: TextStyle(fontSize: 16)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok!')),
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
