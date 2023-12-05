import 'package:flutter/material.dart';

class MockAuthProvider {
  Future<bool> logIn(
    BuildContext context,
    String user,
    String password,
  ) async {
    if (user.isEmpty || password.isEmpty) {
      _authErrorDialog(context, 'Usuário ou Senha não está Preenchido');
      return false;
    } else if (user.endsWith(' ')) {
      _authErrorDialog(context, "Usuário não pode terminar com espaço");
      return false;
    } else if (password.length < 2) {
      _authErrorDialog(context, 'Senha deve ter no mínimo 2 caracteres');
      return false;
    } else {
      return true;
    }
  }

  Future<void> _authErrorDialog(
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
