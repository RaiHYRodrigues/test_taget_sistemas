import 'package:flutter/material.dart';

class MockAuthProvider {
Future<void> logIn(
  BuildContext context,
  String user,
  String password,
) async {
  
  if (user.isEmpty || password.isEmpty) {
    
    return _showErrorDialog(context, 'Usuário ou Senha não está Preenchido');
  } else if (user.endsWith(' ')) {
    return _showErrorDialog(context, "Usuário não pode terminar com espaço");
  } else if (password.length < 2) {
    return _showErrorDialog(context, 'Senha deve ter no mínimo 2 caracteres');
  } else {
    
    Navigator.pushReplacementNamed(context, '/note');
  }
}

Future<void> _showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Ops...'),
        content: Text(text),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok!'))
        ],
      );
    },
  );
}
}